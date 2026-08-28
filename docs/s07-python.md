# S07 — Python + pytest + requests

Companion to Section 7. Prompts: [`prompts/section-07-python.md`](../prompts/section-07-python.md).
CLI: [`snippets/pytest-commands.sh`](../snippets/pytest-commands.sh),
[`snippets/pytest.ini`](../snippets/pytest.ini).

## The model
Real Python code: `test_techshop.py` using the `requests` library and pytest. This is the tool
AI writes most naturally, and the one closest to what a developer-heavy team uses. Credentials
come from environment variables — never hardcoded.

## What you build
- `BASE_URL = os.getenv("BASE_URL", "http://localhost:3000")`
- An `auth_token` **fixture**: reads `TEST_EMAIL` / `TEST_PASSWORD` from the env, logs in,
  asserts 200, returns the token. Any test needing auth takes this fixture.
- One test function per scenario in `test-ideas.md`, named descriptively
  (`test_login_wrong_password_returns_401`).
- `@pytest.mark.parametrize` for boundary values (e.g. quantity `0, -1, -100`) — **Prompt 2**.

## Run (venv active)
```bash
source venv/bin/activate                    # Windows: venv\Scripts\activate
pytest test_techshop.py -v
pytest test_techshop.py -v --html=pytest-report.html --self-contained-html
pytest test_techshop.py -k login -v          # just the login tests
```

## Key points
- **Prompt 1** generates the suite; **Prompt 4** checks coverage against the spec and fills gaps;
  **Prompt 3** fixes a single wrong assertion; **Prompt 5** runs it and produces the HTML report.
- Failing tests are catching the 5 planted bugs (B1–B5) — expected on the broken app.

## If you're stuck
- **`ModuleNotFoundError: pytest` / `requests`** — the venv is not active, or packages were
  installed into a different Python. Run `source venv/bin/activate`, then
  `pip install pytest requests pytest-html`.
- **Fixture error: "TEST_EMAIL not set"** — environment variables missing in this terminal. Set
  them (see [s03-setup.md](s03-setup.md)) and reopen the terminal, or export them for the session.
- **Every test errors with ConnectionError** — API not running
  (`curl -s http://localhost:3000/health`).
- **`pytest: command not found`** — venv not active, or use `python3 -m pytest ...`.
