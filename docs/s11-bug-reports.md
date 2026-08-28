# S11 — Bug Reports, Best Practices & Refactoring

Companion to Section 11. Prompts: [`prompts/section-11-bug-reports.md`](../prompts/section-11-bug-reports.md).

## The model
A failing test is only half the job. Here you turn the failures your suites found into
**developer-ready bug reports** — and then Jira-style tickets — using the agent. The five bugs
your tests caught map to five reports.

## What a good report contains
- **Title** — one sentence, behavioural (`POST /auth/login returns 200 with a token when the
  password is wrong`).
- **Environment** — TechShop API broken-app v1.0.0, `http://localhost:3000`.
- **Steps to reproduce** — the exact HTTP request (method, URL, headers, body).
- **Expected** (what `swagger.json` says) vs **Actual** (status + body), kept separate.
- **Severity** with a one-line reason.

## The 5 bugs you are reporting
| Bug | Endpoint | Defect | Severity |
|-----|----------|--------|----------|
| B1 | `POST /auth/login` | 200 + token even with wrong password (auth bypass) | Critical |
| B2 | `POST /cart` | accepts negative quantity (should 400) | Medium |
| B3 | `GET /products/{id}` | 500 instead of 404 for missing product | High |
| B4 | `DELETE /cart/{itemId}` | no auth required (should 401) | Critical |
| B5 | `POST /orders` | accepts expired card (should 400) | High |

## Steps
1. **Prompt 1 / 2** — generate reports from the pytest and Newman output.
2. **Prompt 3** — reformat as Jira tickets (Summary ≤80 chars, labels `api-testing`,
   `techshop-api`).
3. Review each against the bar: *could a developer reproduce this from the steps alone?*

## Golden rule
**Never put real credentials in a bug report.** Use placeholders — `{{TEST_EMAIL}}`,
`{{TEST_PASSWORD}}`. A report is shared; a secret in it is a leak.

## If you're stuck
- **The agent reports a bug that is actually a test mistake** — check the assertion against
  `swagger.json` first. Only a mismatch between the spec and the API's real behaviour is a bug;
  a wrong expected value in your test is a test fix, not a report.
- **No failures to report** — you are probably on the **fixed** app. Bug reports come from the
  **broken** app (`environment":"broken"` in `/health`).
