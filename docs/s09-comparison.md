# S09 — Choosing a Tool

Companion to Section 9. No prompts — this is the decision section. You have now built the **same
tests four ways** against the same API. This guide is the cheat sheet for picking one.

## The four tools at a glance
| Tool | Language | Lives in Git? | AI fit | Best when… |
|------|----------|---------------|--------|-----------|
| **Postman + Newman** | GUI + JSON | exported JSON | via MCP (needs config) | a team already lives in Postman; shareable collections |
| **Bruno** | `.bru` files | yes, natively | excellent (plain text) | you want tests versioned and reviewed in PRs, no cloud |
| **Python + pytest** | Python | yes | best (AI writes code) | a code-comfortable team; maximum flexibility and ecosystem |
| **Robot Framework** | keyword DSL | yes | good (readable) | mixed technical/non-technical readers; readable reports |

## How to choose (the reasoning that lasts)
- **Who reads the tests?** Non-coders too → Robot Framework or Bruno. Developers → pytest.
- **Where do tests live?** Must be in the repo and diff in PRs → Bruno, pytest, Robot (not
  Postman's cloud).
- **What does the team already use?** An existing Postman practice → Postman + Newman in CI.
- **How much power/flexibility?** Complex setup, data, ecosystem → pytest wins.

## Key point
There is no single "best" tool — there is the right tool for a team and a context. The durable
skill is being able to justify the choice. All four caught the same 5 bugs; they differ in
readability, Git integration, AI fit, and CI ergonomics, not in capability here.

## If you're stuck
This section has nothing to run. If a tool's tests behaved differently than another's, re-open
that tool's guide ([s05](s05-postman.md)–[s08](s08-robot.md)) and confirm it was pointed at the
same running API and the same credentials.
