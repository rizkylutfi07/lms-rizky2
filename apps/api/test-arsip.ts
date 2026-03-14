import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();
async function run() {
    console.log("Connecting...");
    const deleted = await prisma.ujian.findMany({
        where: { deletedAt: { not: null } },
        select: { id: true, judul: true, deletedAt: true }
    });
    console.log("Deleted count:", deleted.length);
    console.log("Deleted records:", deleted);
}
run();
