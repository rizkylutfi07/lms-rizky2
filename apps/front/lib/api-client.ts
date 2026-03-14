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

  if (response.status === 401) {
    // Token expired or invalid — clear auth state and redirect to login
    if (typeof window !== "undefined") {
      window.localStorage.removeItem("arunika-auth");
      window.location.replace("/login");
    }
    throw new Error("Sesi habis, silakan login kembali");
  }

  if (!response.ok) {
    const text = await response.text();
    throw new Error(text || `Request failed with ${response.status}`);
  }

  return response.json() as Promise<T>;
}

export { apiBaseUrl };
