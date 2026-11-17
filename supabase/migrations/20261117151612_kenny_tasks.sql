create table public.kenny_tasks (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references auth.users(id) on delete cascade,
  title text not null check (char_length(title) between 1 and 160),
  project text not null default 'Product launch',
  due_date date not null default current_date,
  priority text not null default 'Medium' check (priority in ('High', 'Medium', 'Low')),
  is_done boolean not null default false,
  description text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index kenny_tasks_owner_due_idx on public.kenny_tasks (owner_id, due_date);

alter table public.kenny_tasks enable row level security;

create policy kenny_tasks_select_own
  on public.kenny_tasks for select to authenticated
  using ((select auth.uid()) = owner_id);
create policy kenny_tasks_insert_own
  on public.kenny_tasks for insert to authenticated
  with check ((select auth.uid()) = owner_id);
create policy kenny_tasks_update_own
  on public.kenny_tasks for update to authenticated
  using ((select auth.uid()) = owner_id)
  with check ((select auth.uid()) = owner_id);
create policy kenny_tasks_delete_own
  on public.kenny_tasks for delete to authenticated
  using ((select auth.uid()) = owner_id);

grant select, insert, update, delete on public.kenny_tasks to authenticated;
