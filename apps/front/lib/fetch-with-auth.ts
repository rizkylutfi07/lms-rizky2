/**
 * Enhanced fetch wrapper with automatic 401 handling
 * Automatically redirects to login when token is expired or invalid
 */
export async function fetchWithAuth(
  url: string | URL,
  options: RequestInit = {}
): Promise<Response> {
  const response = await fetch(url, options);

  // Handle 401 Unauthorized - token expired or invalid
  if (response.status === 401 && typeof window !== 'undefined') {
    // Clear auth data
    localStorage.removeItem('arunika-auth');
    // Redirect to login page
    window.location.href = '/login';
    throw new Error('Sesi Anda telah berakhir. Silakan login kembali.');
  }

  return response;
}

/**
 * Helper function to get auth token from localStorage
 */
export function getAuthToken(): string | null {
  if (typeof window === 'undefined') return null;
  
  try {
    const auth = localStorage.getItem('arunika-auth');
    if (!auth) return null;
    const parsed = JSON.parse(auth);
    return parsed.token || null;
  } catch {
    return null;
  }
}

/**
 * Helper function to create auth headers
 */
export function getAuthHeaders(additionalHeaders: Record<string, string> = {}): HeadersInit {
  const token = getAuthToken();
  const headers: Record<string, string> = {
    ...additionalHeaders,
  };
  
  if (token) {
    headers['Authorization'] = `Bearer ${token}`;
  }
  
  return headers;
}
