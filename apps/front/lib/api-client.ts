function resolveApiBase(): string {
  if (typeof window === "undefined") {
    return process.env.NEXT_PUBLIC_API_URL?.replace(/\/$/, "") ?? "http://localhost:3001";
  }
  const host = window.location.hostname;
  if (host === "lms.smkpgribanyuputih.cloud") {
    return "https://api.smkpgribanyuputih.cloud";
  }
  if (host === "192.168.1.11") {
    return "http://192.168.1.11:3001";
  }
  return process.env.NEXT_PUBLIC_API_URL?.replace(/\/$/, "") ?? `http://localhost:3001`;
}

const apiBaseUrl = resolveApiBase();

export async function apiFetch<T>(
  path: string,
  options: RequestInit = {},
  token?: string | null,
): Promise<T> {
  const headers = new Headers(options.headers ?? {});
  headers.set("Content-Type", "application/json");
  if (token) {
    headers.set("Authorization", `Bearer ${token}`);
  }

  const response = await fetch(`${apiBaseUrl}${path}`, {
    ...options,
    headers,
  });

  if (!response.ok) {
    // Only redirect to login on 401 for authenticated calls (not for the login endpoint itself)
    const isAuthEndpoint = path.startsWith('/auth/');
    if (response.status === 401 && !isAuthEndpoint) {
      if (typeof window !== "undefined") {
        window.localStorage.removeItem("arunika-auth");
        window.location.replace("/login");
      }
      throw new Error("Sesi habis, silakan login kembali");
    }

    // Try to parse the error message from the response body
    let message: string;
    try {
      const body = await response.json();
      message = body.message || body.error || JSON.stringify(body);
    } catch {
      message = (await response.text()) || `Request gagal (${response.status})`;
    }
    throw new Error(message);
  }

  return response.json() as Promise<T>;
}

export { apiBaseUrl };
