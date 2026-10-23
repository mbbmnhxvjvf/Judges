-- الصق الملف ده كله في Supabase ← SQL Editor واضغط Run
-- غيّر ADMIN_EMAIL_HERE لإيميل الأدمن بتاعك قبل التشغيل

create table questions (
  id text primary key,
  text text not null,
  position int not null default 0
);

create table judges (
  id uuid primary key,
  name text not null default '',
  deleted jsonb not null default '[]',
  added jsonb not null default '[]'
);

alter table questions enable row level security;
alter table judges enable row level security;

create function is_admin() returns boolean
language sql stable as $$
  select coalesce(
    (auth.jwt() ->> 'email') = 'ADMIN_EMAIL_HERE'
    and coalesce((auth.jwt() ->> 'is_anonymous')::boolean, false) = false,
    false)
$$;

-- الأسئلة: الكل يقرأ، الأدمن فقط يكتب
create policy q_read  on questions for select using (true);
create policy q_write on questions for all using (is_admin()) with check (is_admin());

-- كل محكم يقرأ ويكتب صفه هو فقط، والأدمن يقرأ ويحذف الكل
create policy j_own        on judges for all    using (id = auth.uid()) with check (id = auth.uid());
create policy j_admin_read on judges for select using (is_admin());
create policy j_admin_del  on judges for delete using (is_admin());
