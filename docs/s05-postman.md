# S05 — Postman + Newman

Companion to Section 5. Prompts: [`prompts/section-05-postman.md`](../prompts/section-05-postman.md).
CLI: [`snippets/newman-commands.sh`](../snippets/newman-commands.sh). MCP config:
[`snippets/mcp-config-cursor.json`](../snippets/mcp-config-cursor.json) /
[`mcp-config-vscode.json`](../snippets/mcp-config-vscode.json).

## The model
The agent builds the Postman collection **directly in your Postman workspace via the Postman
MCP** — no manual clicking. Then you export it to `techshop.postman_collection.json` and run it
headless from the terminal with **Newman**.

## Order of operations (this matters)
1. **Configure the MCP first** (**Prompt 4**). The key is read from `POSTMAN_API_KEY` — never
   typed into chat. Then **fully restart your IDE**.
2. Verify the MCP loaded: ask the agent *"what MCP tools do you have available?"* — Postman tools
   should appear, green status in Settings → MCP.
3. **Create the collection** (**Prompt 1**) from `swagger.json` + `test-ideas.md`: a folder per
   tag (Auth, Products, Cart, Orders), a `pm.test` per request, the login token saved to
   `{{authToken}}`, `{{base_url}}` throughout.
4. **Export** to `techshop.postman_collection.json` (**Prompt 2**).
5. **Run with Newman** (**Prompt 5**):
```bash
npm install -g newman newman-reporter-html
newman run techshop.postman_collection.json \
  --env-var base_url=http://localhost:3000 \
  --reporters cli,html --reporter-html-export newman-report.html
```

## What you should see
Failing tests here are **good** — they are catching the planted bugs (e.g. B1: login with a wrong
password returns 200 instead of 401). Use **Prompt 3** only to fix a test whose *assertion* is
wrong versus the spec — not to hide a real bug.

## If you're stuck
- **Postman tools do not appear** — the MCP did not load. Confirm `POSTMAN_API_KEY` is set
  (`echo` a "is set / NOT set" check, never the value), that the config file exists
  (`~/.cursor/mcp.json` or `.vscode/mcp.json`), and **fully restart** the IDE (not just reload).
- **`newman: command not found`** — the global install failed or npm's global bin is not on PATH.
  Re-run `npm install -g newman`; on permission errors use a Node version manager (nvm) rather
  than `sudo`.
- **Every request fails with a connection error** — the API is not running
  (`curl -s http://localhost:3000/health`) or you passed the wrong `base_url`.
- **Auth-required requests return 401** — the login request did not save `{{authToken}}`, or it
  runs after the requests that need it. Ensure the Auth/login request is first in the run order.
