# Fix: Automatic Logout on Token Expiry (401 Error)

## Masalah
User harus logout manual dan login lagi setiap kali token expired (error 401).

## Solusi
Implementasi automatic logout dan redirect ke halaman login ketika token expired atau invalid (401 error).

## Perubahan

### 1. Global Fetch Interceptor
**File:** `apps/front/components/fetch-interceptor.tsx` (NEW)
- Intercept semua fetch request
- Auto-detect 401 response
- Clear localStorage dan redirect ke /login

### 2. API Client Updates
**File:** `apps/front/lib/api-client.ts`
- Tambah 401 error handling di `apiFetch()` function
- Auto-logout dan redirect ke login page

### 3. API Wrapper Updates
**File:** `apps/front/lib/api.ts`
- Tambah 401 handling di `fetchApi()` function
- Update semua file upload functions:
  - `materiApi.createWithFile()`
  - `materiApi.updateWithFile()`
  - `tugasApi.createWithFiles()`
  - `tugasApi.submit()`

### 4. React Query Configuration
**File:** `apps/front/app/providers.tsx`
- Konfigurasi retry logic: jangan retry untuk 401 errors
- Prevents unnecessary retries when token expired

### 5. Root Layout Integration
**File:** `apps/front/app/layout.tsx`
- Mount `FetchInterceptor` component globally
- Ensures all fetch requests are monitored

### 6. Import Modal Fix
**File:** `apps/front/components/ImportModal.tsx`
- Update hardcoded URL ke dynamic `API_URL`
- Add 401 error handling

## Cara Kerja

1. **Global Interceptor**: Semua fetch request dimonitor oleh interceptor
2. **Auto Detection**: Ketika response status 401:
   - Clear `arunika-auth` dari localStorage
   - Redirect ke `/login` page
   - Show error message yang jelas
3. **No Retry**: React Query tidak retry untuk 401 errors
4. **Consistent UX**: User langsung di-redirect, tidak perlu logout manual

## Testing
Untuk test, coba:
1. Login ke aplikasi
2. Tunggu sampai token expired (atau hapus/corrupt token di localStorage)
3. Lakukan action apa saja (klik menu, load data, dll)
4. Aplikasi akan auto-redirect ke login page dengan pesan "Sesi Anda telah berakhir"

## Benefits
✅ Better User Experience - tidak perlu logout manual  
✅ Security - auto-clear expired credentials  
✅ Consistent - handled globally untuk semua API calls  
✅ Clear messaging - user tahu kenapa harus login lagi  
