# التشغيل مع قاعدة بيانات SQL (Supabase)

1. ادخل https://supabase.com وسجّل، واضغط New project (اكتب اسم وباسورد لقاعدة البيانات وأي منطقة).
2. افتح ملف supabase.sql، غيّر ADMIN_EMAIL_HERE لإيميلك، وانسخ الملف كله.
3. في Supabase ← SQL Editor ← New query: الصق واضغط Run (لازم يظهر Success).
4. من Authentication ← Sign In / Providers: فعّل **Allow anonymous sign-ins**.
5. من Authentication ← Users ← Add user ← Create new user: اكتب إيميلك (نفس إيميل الخطوة 2) ورقمك السري، وفعّل Auto Confirm User.
6. من Project Settings ← API: انسخ Project URL و anon public key والصقهم في ملف supabase-config.js.
7. ارفع كل الملفات على GitHub Pages.

- رابط المحكمين: index.html
- رابط الأدمن: admin.html
