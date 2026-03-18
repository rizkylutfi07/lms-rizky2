import { Injectable, BadRequestException } from '@nestjs/common';
import { exec } from 'child_process';
import { promisify } from 'util';
import * as fs from 'fs';
import * as path from 'path';

const execAsync = promisify(exec);

@Injectable()
export class DatabaseService {
    private readonly backupDir = path.join(process.cwd(), 'apps/api/backups');
    private readonly dockerContainer = 'belajar-postgres'; // PostgreSQL Docker container name

    constructor() {
        // Ensure backup directory exists
        if (!fs.existsSync(this.backupDir)) {
            fs.mkdirSync(this.backupDir, { recursive: true });
        }
    }

    async exportDatabase(type: 'full' | 'data-only' = 'full'): Promise<{ buffer: Buffer; filename: string }> {
        try {
            const timestamp = new Date().toISOString().replace(/[:.]/g, '-').split('T')[0];
            const suffix = type === 'data-only' ? 'data-only' : 'full';
            const filename = `backup_${suffix}_${timestamp}_${Date.now()}.sql`;
            const filepath = path.join(this.backupDir, filename);

            // Get database connection info from environment
            const dbUrl = process.env.DATABASE_URL;
            if (!dbUrl) {
                throw new BadRequestException('DATABASE_URL not configured');
            }

            // Parse database URL
            const url = new URL(dbUrl);
            const dbName = url.pathname.slice(1);
            const dbUser = url.username;
            const dbPassword = url.password;

            // Build pg_dump flags based on backup type
            const pgDumpFlags = type === 'data-only'
                ? '--data-only --disable-triggers --column-inserts'
                : '--if-exists --clean --disable-triggers';

            // Execute pg_dump inside Docker container
            const command = `docker exec -e PGPASSWORD="${dbPassword}" ${this.dockerContainer} pg_dump -U ${dbUser} ${pgDumpFlags} -d ${dbName} > "${filepath}"`;

            await execAsync(command);

            // Read the file and return as buffer
            const buffer = fs.readFileSync(filepath);

            return { buffer, filename };
        } catch (error) {
            console.error('Export database error:', error);
            throw new BadRequestException(`Failed to export database: ${error.message}`);
        }
    }

    async createAutoBackup(): Promise<string> {
        try {
            const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
            const filename = `auto_backup_${timestamp}.sql`;
            const filepath = path.join(this.backupDir, filename);

            const dbUrl = process.env.DATABASE_URL;
            if (!dbUrl) {
                throw new BadRequestException('DATABASE_URL not configured');
            }

            const url = new URL(dbUrl);
            const dbName = url.pathname.slice(1);
            const dbUser = url.username;
            const dbPassword = url.password;

            // Execute pg_dump inside Docker container (full backup for auto-backup)
            const command = `docker exec -e PGPASSWORD="${dbPassword}" ${this.dockerContainer} pg_dump -U ${dbUser} --if-exists --clean --disable-triggers -d ${dbName} > "${filepath}"`;

            await execAsync(command);

            return filename;
        } catch (error) {
            console.error('Auto backup error:', error);
            throw new BadRequestException(`Failed to create auto backup: ${error.message}`);
        }
    }

    async importDatabase(
        sqlContent: string,
        createBackup: boolean = true,
        type: 'full' | 'data-only' = 'full',
    ): Promise<{ message: string; backupFile?: string; warning?: string }> {
        const tempFile = path.join(this.backupDir, `temp_import_${Date.now()}.sql`);
        try {
            let backupFile: string | undefined;
            let warning: string | undefined;

            // Create automatic backup if requested
            if (createBackup) {
                try {
                    backupFile = await this.createAutoBackup();
                } catch (error) {
                    console.warn('Backup creation failed, continuing without backup:', error.message);
                    warning = 'Backup creation skipped. Import will proceed WITHOUT backup!';
                }
            }

            // Write SQL content to temp file
            fs.writeFileSync(tempFile, sqlContent);

            const dbUrl = process.env.DATABASE_URL;
            if (!dbUrl) {
                throw new BadRequestException('DATABASE_URL not configured');
            }

            const url = new URL(dbUrl);
            const dbName = url.pathname.slice(1);
            const dbUser = url.username;
            const dbPassword = url.password;

            const psqlExec = (args: string) =>
                `docker exec -e PGPASSWORD="${dbPassword}" ${this.dockerContainer} psql -U ${dbUser} -d ${dbName} ${args}`;

            if (type === 'full') {
                // Full import: drop schema completely, then recreate and import (includes schema + data)
                const dropCmd = psqlExec(`-c "DROP SCHEMA public CASCADE; CREATE SCHEMA public; GRANT ALL ON SCHEMA public TO ${dbUser}; GRANT ALL ON SCHEMA public TO public;"`);
                try {
                    await execAsync(dropCmd);
                } catch (error) {
                    console.warn('Drop schema warning:', error.message);
                }

                // Copy SQL file to container
                const containerTempFile = `/tmp/import_full_${Date.now()}.sql`;
                await execAsync(`docker cp "${tempFile}" ${this.dockerContainer}:${containerTempFile}`);
                try {
                    await execAsync(psqlExec(`--set ON_ERROR_STOP=on -f ${containerTempFile}`));
                } finally {
                    await execAsync(`docker exec ${this.dockerContainer} rm -f ${containerTempFile}`);
                }
            } else {
                // Data-only import:
                // 1. Disable FK constraints via session_replication_role
                // 2. TRUNCATE all tables (clears existing rows → no duplicate key errors)
                // 3. Import the data
                // 4. Re-enable FK constraints
                // All in ONE psql session so session_replication_role stays active.
                const truncateBlock = `
DO $$
DECLARE r RECORD;
BEGIN
  FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public')
  LOOP
    EXECUTE 'TRUNCATE TABLE public."' || r.tablename || '" RESTART IDENTITY CASCADE';
  END LOOP;
END $$;
`;
                const wrappedContent =
                    `SET session_replication_role = replica;\n` +
                    truncateBlock +
                    sqlContent +
                    `\nSET session_replication_role = DEFAULT;\n`;

                const wrappedFile = path.join(this.backupDir, `temp_import_wrapped_${Date.now()}.sql`);
                fs.writeFileSync(wrappedFile, wrappedContent);
                const wrappedContainerFile = `/tmp/import_data_${Date.now()}.sql`;
                await execAsync(`docker cp "${wrappedFile}" ${this.dockerContainer}:${wrappedContainerFile}`);
                try {
                    await execAsync(psqlExec(`--set ON_ERROR_STOP=on -f ${wrappedContainerFile}`));
                } finally {
                    fs.unlinkSync(wrappedFile);
                    await execAsync(`docker exec ${this.dockerContainer} rm -f ${wrappedContainerFile}`);
                }
            }

            // Clean up local temp file
            if (fs.existsSync(tempFile)) fs.unlinkSync(tempFile);

            return {
                message: `Database imported successfully (${type})`,
                backupFile,
                warning,
            };
        } catch (error) {
            // Clean up temp file on error
            if (fs.existsSync(tempFile)) fs.unlinkSync(tempFile);
            console.error('Import database error:', error);
            throw new BadRequestException(`Failed to import database: ${error.message}`);
        }
    }

    async listBackups(): Promise<Array<{ filename: string; size: number; created: Date }>> {
        try {
            const files = fs.readdirSync(this.backupDir);

            const backups = files
                .filter(file => file.endsWith('.sql'))
                .map(file => {
                    const filepath = path.join(this.backupDir, file);
                    const stats = fs.statSync(filepath);
                    return {
                        filename: file,
                        size: stats.size,
                        created: stats.birthtime,
                    };
                })
                .sort((a, b) => b.created.getTime() - a.created.getTime());

            return backups;
        } catch (error) {
            console.error('List backups error:', error);
            throw new BadRequestException(`Failed to list backups: ${error.message}`);
        }
    }

    async getBackupFile(filename: string): Promise<Buffer> {
        try {
            const filepath = path.join(this.backupDir, filename);

            // Security check: ensure filename doesn't contain path traversal
            if (filename.includes('..') || filename.includes('/')) {
                throw new BadRequestException('Invalid filename');
            }

            if (!fs.existsSync(filepath)) {
                throw new BadRequestException('Backup file not found');
            }

            return fs.readFileSync(filepath);
        } catch (error) {
            console.error('Get backup file error:', error);
            throw new BadRequestException(`Failed to get backup file: ${error.message}`);
        }
    }

    async deleteBackup(filename: string): Promise<{ message: string }> {
        try {
            const filepath = path.join(this.backupDir, filename);

            // Security check
            if (filename.includes('..') || filename.includes('/')) {
                throw new BadRequestException('Invalid filename');
            }

            if (!fs.existsSync(filepath)) {
                throw new BadRequestException('Backup file not found');
            }

            fs.unlinkSync(filepath);

            return { message: 'Backup deleted successfully' };
        } catch (error) {
            console.error('Delete backup error:', error);
            throw new BadRequestException(`Failed to delete backup: ${error.message}`);
        }
    }
}
