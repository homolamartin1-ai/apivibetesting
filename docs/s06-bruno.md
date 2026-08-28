# S06 — Bruno

Companion to Section 6. Prompts: [`prompts/section-06-bruno.md`](../prompts/section-06-bruno.md).
CLI: [`snippets/bruno-commands.sh`](../snippets/bruno-commands.sh).

## The model
Bruno stores tests as plain **`.bru` files in your Git repo** — no cloud account, no MCP. The
agent writes them directly from `swagger.json` + `test-ideas.md`, and you run them with the
Bruno CLI (`bru`). This is the "it lives in your repo, diffs in a PR" tool.

## What you build
```
techshop-bruno/
├── environments/local.bru        # baseUrl=http://localhost:3000, authToken=(empty)
├── auth/        login-valid.bru, login-wrong-password.bru, ...
├── products/    get-products.bru, get-product-not-found.bru, ...
├── cart/        add-to-cart.bru, cart-negative-quantity.bru, ...
└── orders/      create-order.bru, order-expired-card.bru, ...
```
The login happy-path `.bru` has a post-request script that reads the token and sets the
`authToken` environment variable, so later requests authenticate automatically.

## Run
```bash
npm install -g @usebruno/cli
bru --version
bru run techshop-bruno/ --env local           # whole collection
bru run techshop-bruno/auth/ --env local       # one folder
```

## Key points
- **Prompt 1** generates the collection; **Prompt 2** fills any gaps versus the spec;
  **Prompt 3** fixes a single `.bru` whose assertion does not match `swagger.json`.
- Use `{{baseUrl}}` and `{{authToken}}` — never a hardcoded URL or token.
- Failing tests = planted bugs being caught. That is the point.

## If you're stuck
- **`bru: command not found`** — re-run `npm install -g @usebruno/cli`; check npm's global bin is
  on PATH (`npm bin -g`).
- **All auth requests 401** — the login request did not populate `authToken`, or you ran a
  subfolder (`cart/`) without running `auth/` first in the same session. Run the whole collection
  once, or ensure the environment's `authToken` is set.
- **`--env local` not found** — you are not running from the project root, or
  `techshop-bruno/environments/local.bru` is missing. Run `bru run` from the repo root.
- **Connection refused** — API not running (`curl -s http://localhost:3000/health`).
