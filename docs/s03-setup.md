# S03 — Setup (one-time)

Companion to Section 3. Prompts: [`prompts/section-03-setup.md`](../prompts/section-03-setup.md).
CLI references: [`snippets/`](../snippets/) (`ssh-github-setup.sh`, `setup-commands.sh`,
`shell-env-setup.sh`, `env-setup.md`).

Do these once. Everything after depends on them. Works the same on Mac, Windows, and Linux.

## 1. Fork & clone (SSH)
1. Fork the repo on GitHub (button, top-right of the repo page).
2. In Cursor, use **Prompt 1** to set up an SSH key and clone **your fork**:
   `git clone git@github.com:YOUR-USERNAME/apivibetesting.git`
3. Confirm the folders exist: `techshop-api`, `prompts`, `snippets`.

## 2. Python + pytest
```bash
python3 --version            # must be 3.8+
python3 -m venv venv
source venv/bin/activate      # Windows: venv\Scripts\activate   ← you should now see (venv)
pip install pytest requests pytest-html
pytest --version
```

## 3. Robot Framework (with venv active)
```bash
pip install robotframework robotframework-requests
robot --version
```

## 4. Environment variables (do NOT skip)
The suites read credentials and the base URL from the **shell environment** — no `.env` file.
Set these once in your shell profile (see [`snippets/shell-env-setup.md`](../snippets/) /
`env-setup.md`):
- `TEST_EMAIL`, `TEST_PASSWORD` — the TechShop login the tests use
- `BASE_URL` — `http://localhost:3000`
- `POSTMAN_API_KEY` — only needed for Section 5 (Postman MCP)

Verify (Mac/Linux):
```bash
[ -n "$TEST_EMAIL" ] && [ -n "$TEST_PASSWORD" ] && echo "creds set" || echo "creds MISSING"
```

## If you're stuck
- **`Permission denied (publickey)` when cloning** — your SSH key is not added to GitHub. Re-run
  Prompt 1 step 3–4: copy `~/.ssh/id_ed25519.pub` and add it at GitHub → Settings → SSH and GPG
  keys. Test with `ssh -T git@github.com`.
- **`python3: command not found`** — install Python from python.org, then reopen the terminal.
- **`(venv)` disappears / packages "not found" later** — the venv is not active in that terminal.
  Run `source venv/bin/activate` again. A new terminal tab starts without it.
- **Env vars empty in a new terminal** — you set them for the session only. Put them in your
  shell profile (`.zshrc` / `.bashrc`, or Windows System Environment Variables) and reopen the
  terminal. **After changing MCP-related vars, fully restart your IDE.**
