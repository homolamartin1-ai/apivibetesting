# Written Guides

A step-by-step written companion for every hands-on section — the exact commands, expected
output, and troubleshooting you cannot pause a video to copy. **Stuck on a section? Open its
guide here first.**

Everything runs against the local **TechShop API** on `http://localhost:3000`. The single most
common problem in the whole course is *the API server not running* — every guide starts by
checking it.

## Setup (Section 3, one-time)
- [s03-setup.md](s03-setup.md) — SSH + clone, Python/pytest, Robot Framework, environment variables

## Per section
- [s04-meet-the-api.md](s04-meet-the-api.md) — run the API, read the OpenAPI spec, build `test-ideas.md`
- [s05-postman.md](s05-postman.md) — Postman collection via MCP + Newman CLI
- [s06-bruno.md](s06-bruno.md) — Bruno `.bru` files + Bruno CLI
- [s07-python.md](s07-python.md) — pytest + requests suite
- [s08-robot.md](s08-robot.md) — Robot Framework suite
- [s09-comparison.md](s09-comparison.md) — choosing a tool for your team
- [s10-github-actions.md](s10-github-actions.md) — the CI pipeline *(secrets are the usual snag)*
- [s11-bug-reports.md](s11-bug-reports.md) — turning failures into bug reports

## The three things that fix 90% of problems
1. **Is the API running?** `curl -s http://localhost:3000/health` should return
   `{"status":"ok",...}`. If not: `cd techshop-api/broken-app && npm start`.
2. **Are your environment variables set?** `TEST_EMAIL`, `TEST_PASSWORD`, `BASE_URL`
   (and `POSTMAN_API_KEY` for Section 5). See [s03-setup.md](s03-setup.md) and
   [`snippets/env-setup.md`](../snippets/env-setup.md).
3. **Is your virtual environment active?** You should see `(venv)` in the prompt (Sections 7, 8).
   If not: `source venv/bin/activate` (Mac/Linux) or `venv\Scripts\activate` (Windows).
