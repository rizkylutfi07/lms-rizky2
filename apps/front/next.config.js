/** @type {import('next').NextConfig} */
const nextConfig = {
    // Enable gzip compression
    compress: true,

    // Remove X-Powered-By header for security
    poweredByHeader: false,

    // Image optimization
    images: {
        remotePatterns: [
            {
                protocol: 'https',
                hostname: 'localhost:3001',
            },
            {
                protocol: 'http',
                hostname: 'localhost',
            },
            {
                protocol: 'http',
                hostname: '192.168.1.11',
            },
        ],
        // Use modern image formats
        formats: ['image/avif', 'image/webp'],
    },

    // Experimental optimizations
    experimental: {
        // Optimize package imports for faster builds
        optimizePackageImports: [
            'lucide-react',
            '@radix-ui/react-dialog',
            '@radix-ui/react-dropdown-menu',
            '@radix-ui/react-popover',
            '@radix-ui/react-select',
            '@radix-ui/react-tabs',
            'date-fns',
        ],
    },
};

export default nextConfig;
