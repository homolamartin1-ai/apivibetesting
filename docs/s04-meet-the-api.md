# S04 — Meet the TechShop API

Companion to Section 4. Prompts: [`prompts/section-04.md`](../prompts/section-04.md). CLI:
[`snippets/run-techshop-api.sh`](../snippets/run-techshop-api.sh).

This section produces two files the rest of the course depends on: **`swagger.json`** (the
contract) and **`test-ideas.md`** (what to test). Both live in your project root.

## 1. Start the API (keep it running)
```bash
cd techshop-api/broken-app
npm install
npm start
```
You should see three lines: API on `http://localhost:3000`, Swagger UI at `/docs`, spec at
`/swagger.json`. Leave this terminal running; open a **second** terminal for everything else.

Verify from the second terminal:
```bash
curl http://localhost:3000/health      # → {"status":"ok","version":"1.0.0","environment":"broken"}
```

## 2. Download the OpenAPI spec
```bash
curl http://localhost:3000/swagger.json -o swagger.json
ls -lh swagger.json                     # ~5–10 KB
```

## 3. Map the spec to test ideas
Use **Prompt 3** — the agent reads `swagger.json` and writes `test-ideas.md`: for each
endpoint, the happy path, at least two negative tests, and the auth requirement. This is your
test plan; every tool in later sections is built from it.

## The 7 endpoints you will test
`POST /auth/login` · `GET /products` · `GET /products/{id}` · `POST /cart` ·
`PUT /cart/{itemId}` · `DELETE /cart/{itemId}` · `POST /orders`

## If you're stuck
- **`npm: command not found`** — install Node.js from nodejs.org, reopen the terminal.
- **`curl ... connection refused`** — the API is not running. Go back to step 1; the `npm start`
  terminal must stay open. Do not close it for the rest of the section.
- **Port 3000 already in use** — another process (or an old server) holds it. Stop it:
  `pkill -f "node.*app"` (Mac/Linux), then `npm start` again.
- **`swagger.json` is empty or tiny** — the download ran before the server was up. Confirm
  `/health` first, then re-run the `curl -o` command.
- **The agent cannot find the spec** — make sure `swagger.json` is in the **project root** (the
  folder you opened in Cursor), not inside `techshop-api/`.
