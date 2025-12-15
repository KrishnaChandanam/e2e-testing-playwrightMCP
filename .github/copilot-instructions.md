<!-- Generated/updated by Copilot agent -->
# Copilot instructions — E2ETest-PlayWrightMCP

Purpose: help an AI coding agent become productive in this repository quickly.

Summary
- This repository currently appears to be empty. If code exists locally for you, start by searching for the files below. If not, follow the "Empty repo" section.

Quick discovery checklist
- Search for evidence of the main components:
  - `package.json` or `pyproject.toml` — project language & scripts
  - `playwright.config.*`, `tests/`, `e2e/` — Playwright end-to-end tests
  - `mcp/`, `server/`, `src/server/` — a Model Context Protocol (MCP) server or helper
  - `.github/workflows/` — CI jobs (how tests run in CI)
  - `Dockerfile`, `docker-compose.yml` — containers used for tests/environments
  - `.env`, `.env.example` — runtime configuration and secrets locations

Commands to try (JS/Node common defaults)
- Install deps: `npm ci` or `npm install`
- Install Playwright browsers (if present): `npx playwright install --with-deps`
- Run tests: `npm test`, `npm run test:e2e`, or `npx playwright test`
- Start MCP server (discover from `package.json` scripts): `npm run start:mcp` or `node ./mcp/index.js`

How to inspect & confirm architecture
- If Playwright exists, open `playwright.config.*` to see:
  - testDir, projects (browsers), baseURL, globalSetup/globalTeardown
  - fixture usage and custom reporters
- If an MCP server exists, look for:
  - protocol docs or `server` handlers (HTTP/WebSocket/IPC)
  - tests that mock or call the MCP endpoints (`tests/mcp` or `e2e/*`)
- Follow data flows by opening representative tests and any `helpers/` or `fixtures/` used there.

Agent behavior rules (project-specific)
- Preserve existing guidance: if `.github/copilot-instructions.md` exists, merge instead of replacing.
- Avoid making structural changes when repo is empty — create scaffolding only with explicit user approval.
- Prefer local reproducibility: run `npm ci` and `npx playwright install` before running tests if CI config references Playwright.
- When adding tests or fixes, follow existing test patterns: use `test.describe` groupings, fixtures from `tests/fixtures.*` if found.

What to document when new patterns are found
- Add short, concrete examples showing how to run the relevant command and a pointer to the file (e.g., "Run E2E: `npm run test:e2e` — see playwright.config.ts and `tests/e2e/login.spec.ts`").
- Note any nonstandard script names or environment variables required by CI (for example: `MCP_URL`, `API_KEY`).
- If the repo uses a local MCP or container-based test harness, document how to start/seed it and any wait-for-healthy checks.

Empty-repo checklist for maintainers (suggested contents)
- Add a `README.md` with quick start and how-to-run tests
- Add `package.json` scripts for `test:e2e`, `start:mcp`, and CI-friendly flags
- Provide a `playwright.config.*` and at least one sample test under `tests/e2e/`

If you have questions or want this tailored to an existing tree, point me at the repository contents or provide a short README and I'll update this file with repo-specific commands and examples.
