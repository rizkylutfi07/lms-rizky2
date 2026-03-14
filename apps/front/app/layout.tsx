import type { Metadata } from "next";
import "@fontsource-variable/plus-jakarta-sans";
import localFont from "next/font/local";
import "./globals.css";
import { Providers } from "./providers";
import { cn } from "@/lib/utils";
import { RoleProvider } from "./(dashboard)/role-context";
import { Toaster } from "@/components/ui/toaster";

const geistMono = localFont({
  src: "./fonts/GeistMonoVF.woff",
  variable: "--font-geist-mono",
});

export const metadata: Metadata = {
  title: "SWA - SMKS PGRI Banyuputih",
  description:
    "Sistem Manajemen Sekolah - SMKS PGRI Banyuputih Situbondo",
  icons: {
    icon: [
      { url: '/logo.png', type: 'image/png' },
      { url: '/logo.png', sizes: '32x32', type: 'image/png' },
      { url: '/logo.png', sizes: '16x16', type: 'image/png' },
    ],
    shortcut: '/logo.png',
    apple: '/logo.png',
  },
  manifest: '/manifest.json',
  appleWebApp: {
    capable: true,
    statusBarStyle: 'default',
    title: 'SWA - SMKS PGRI',
  },
  other: {
    "google": "notranslate"
  }
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="id" translate="no" className="notranslate" suppressHydrationWarning>
      <head>
        <link rel="icon" href="/logo.png" type="image/png" />
        <link rel="shortcut icon" href="/logo.png" type="image/png" />
        <link rel="apple-touch-icon" href="/logo.png" />
        <link rel="manifest" href="/manifest.json" />
        <meta name="theme-color" content="#2563eb" />
        <meta name="mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="default" />
      </head>
      <body
        suppressHydrationWarning
        className={cn(
          "min-h-screen bg-background text-foreground antialiased font-sans",
          geistMono.variable,
        )}
      >
        <RoleProvider>
          <Providers>{children}</Providers>
        </RoleProvider>
        <Toaster />
      </body>
    </html>
  );
}
