# Kenny — Work, in good flow

Kenny is a responsive task workspace with a focused dashboard, calendar, project views, and progress insights. It supports Supabase email/password and GitHub sign-in, and stores each signed-in user's tasks in Postgres with row-level security.

## Product features

- Dashboard with focus priorities, delivery stats, activity visualization, and project progress.
- Create and complete tasks; search across tasks; filter by to-do, completed, and overdue status.
- Month calendar, project overview, progress insights, inbox, notification popover, and JSON export.
- Supabase Auth for email/password and GitHub OAuth; signed-in profile and sign-out controls.
- Tasks are private per account through `owner_id`-scoped Postgres Row Level Security policies.
- Responsive navigation and `⌘K` / `Ctrl+K` workspace search.
- Without Supabase environment variables, the app falls back to demo tasks saved in local storage.

## Local development

```bash
npm install
cp .env.example .env.local
# Set VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY in .env.local
npm run dev
```

The Supabase schema migration is in `supabase/migrations/20261117151612_kenny_tasks.sql`. It has been applied to the connected Supabase project. Only the publishable Supabase key is used in the browser; never place a service-role or secret key in frontend environment variables.

Build and type-check:

```bash
npm run build
```

## Deployment

Vercel uses the Vite preset with build command `npm run build` and output directory `dist`. The `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` variables are configured for production, preview, and development. Supabase redirect URLs include Kenny's production host, the main-branch Vercel alias, and localhost for development.

## Scope

Task records and authentication are backed by Supabase. The bundled project cards, activity, and inbox content remain sample UI data; project collaboration and live shared activity are not yet persisted.
