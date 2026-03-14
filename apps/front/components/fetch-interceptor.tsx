"use client";

import { useEffect } from 'react';

/**
 * Global fetch interceptor to handle 401 errors
 * This component should be mounted once at the app root
 */
export function FetchInterceptor() {
  useEffect(() => {
    // Save original fetch
    const originalFetch = window.fetch;

    // Override fetch
    window.fetch = async (...args) => {
      const response = await originalFetch(...args);

      // Clone response to check status without consuming it
      const clonedResponse = response.clone();

      // Handle 401 Unauthorized - token expired or invalid
      if (clonedResponse.status === 401) {
        // Check if not already on login page to avoid redirect loop
        if (!window.location.pathname.includes('/login')) {
          // Clear auth data
          localStorage.removeItem('arunika-auth');
          // Redirect to login page
          window.location.href = '/login';
        }
      }

      return response;
    };

    // Cleanup: restore original fetch on unmount
    return () => {
      window.fetch = originalFetch;
    };
  }, []);

  return null;
}
