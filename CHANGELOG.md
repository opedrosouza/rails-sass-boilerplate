## 2025-03-29
- Upgraded to Rails 8
- Using devise scopes to return `404` or render `pages/home` in case someone try to discover admin routes.
- Removed the `storefront` and `app` namespaces/folders to simplify the project structure.
- JS libs and Ruby gems upgraded.

## 2025-08-25
- Removed Devise Admin resources to leverage User resources
- Removed annotate gem since its not maintened
- Upgrade js and ruby libs
- Added `admin` column to Users

## 2025-08-28
- Changed devise controllers and views from `auth` to `users` keeping the devise default.
