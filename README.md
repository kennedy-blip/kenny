# Kenny — Work, in good flow

Kenny is a polished, responsive project and task workspace built to help small teams make steady progress without the noise. The product currently ships as a front-end app with seeded sample workspace data and browser-local persistence.

## Features

- A calm dashboard with focus priorities, delivery stats, team activity, and project progress.
- Task management with create, complete, search, and filters for to-do, completed, and overdue work.
- Project overview, month calendar with task due dates, progress insights, and a team activity inbox.
- Responsive navigation, keyboard shortcut (`⌘K` / `Ctrl+K`) for search, notification popover, and JSON workspace export.
- Task data persists in `localStorage`; no account or backend configuration is required to try the app.

## Run locally

```bash
npm install
npm run dev
```

Then open the local Vite URL. To type-check and create a production build:

```bash
npm run build
```

## Deployment

This Vite app can be deployed to Vercel with the default Vite preset: build command `npm run build`, output directory `dist`.
