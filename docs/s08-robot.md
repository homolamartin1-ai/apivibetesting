# S08 — Robot Framework

Companion to Section 8. Prompts: [`prompts/section-08-robot.md`](../prompts/section-08-robot.md).
CLI: [`snippets/robot-commands.sh`](../snippets/robot-commands.sh).

## The model
Keyword-driven, plain-English test cases in `techshop.robot`, using `RequestsLibrary`. The most
readable of the four tools — a non-coder can read a test case top to bottom. Reports are rich
HTML (`report.html`, `log.html`).

## What you build
- **Settings**: import `RequestsLibrary`, `Collections`, `OperatingSystem`.
- **Variables**: `${BASE_URL} %{BASE_URL}`, `${EMAIL} %{TEST_EMAIL}`, `${PASSWORD} %{TEST_PASSWORD}`
  (`%{...}` = read from environment).
- **Keyword** `Get Auth Token`: POST login, assert 200, return the token.
- **Test Cases**: one per scenario, named in English
  (`Login With Wrong Password Returns 401`). `Suite Setup` creates the HTTP session once.

## Run (venv active)
```bash
robot --outputdir robot-results techshop.robot
robot --variable BASE_URL:http://localhost:3000 --outputdir robot-results techshop.robot
robot --test "Login With Wrong Password" techshop.robot     # one test
```
Then open `robot-results/report.html` in your browser.

## Key points
- **Prompt 1** generates the suite; **Prompt 4** fills coverage gaps; **Prompt 2** makes
  `BASE_URL` overridable from the command line; **Prompt 3** extracts shared keywords into
  `techshop_keywords.robot` (imported with `Resource`).
- Failing tests = the planted bugs, as with every other tool.

## If you're stuck
- **`robot: command not found`** — venv not active, or install with
  `pip install robotframework robotframework-requests`.
- **`Variable '${BASE_URL}' not found`** — `BASE_URL` is not in the environment. Either export it
  or pass `--variable BASE_URL:http://localhost:3000` on the command line.
- **`Importing library 'RequestsLibrary' failed`** — `robotframework-requests` is not installed
  in the active venv. Re-install it with the venv active.
- **All requests fail** — API not running (`curl -s http://localhost:3000/health`).
- **Whitespace errors** — Robot is indentation/space-sensitive (cells are separated by 2+ spaces).
  Let the agent regenerate the file rather than hand-editing alignment.
