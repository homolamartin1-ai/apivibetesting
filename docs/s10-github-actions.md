# S10 — GitHub Actions Pipeline

Companion to Section 10. Prompts: [`prompts/section-10-github-actions.md`](../prompts/section-10-github-actions.md).
Reference workflow: [`snippets/github-actions.yml`](../snippets/github-actions.yml).

## The model
One workflow, `.github/workflows/api-tests.yml`, runs on every push/PR to `main` on
`ubuntu-latest`. It starts the TechShop API in the background, waits for `/health`, then runs
**all four suites** (Newman, Bruno, pytest, Robot). Each suite uses `continue-on-error: true` so
they all run, and a final step fails the job if any suite failed. Reports upload as artifacts.

## Order of operations (do secrets FIRST)
1. **Add repository secrets** (**Prompt 5**) — `TEST_EMAIL`, `TEST_PASSWORD` at
   **Settings → Secrets and variables → Actions → New repository secret**. Without these, the
   pytest/robot steps fail on the very first run. GitHub masks them in logs automatically.
2. **Generate the workflow** (**Prompt 1**) — the full 18-step job.
3. **Commit & push** (**Prompt 4**): `git add .github/workflows/api-tests.yml` → commit → push.
   The push triggers the first run. Watch it in the repo's **Actions** tab.
4. **Debug from annotations** (**Prompt 2**) — paste the red run's error annotations back to the
   agent; it fixes the YAML and tells you any missing secret.
5. **Fail-on-failure + summary** (**Prompt 6**) — the job goes red if any suite is red, and writes
   a results table to the job summary.
6. **Switch to the fixed app** (**Prompt 3 / 7**) — point the workflow at `techshop-api/fixed-app`;
   everything should go green.

## Key points
- Credentials live **only** as GitHub secrets, referenced as
  `${{ secrets.TEST_EMAIL }}` — never in the YAML.
- On the **broken** app the pipeline is red (bugs caught). On the **fixed** app it is green. Both
  are correct outcomes.

## If you're stuck
- **First run fails immediately on pytest/robot** — secrets missing. Add `TEST_EMAIL` /
  `TEST_PASSWORD` (step 1). This is the #1 cause.
- **"connection refused" in CI** — the API step did not start or the wait was too short. Confirm
  the background start step and the `curl --retry` health wait are present (see the reference
  workflow).
- **Job is green even though tests failed** — the final fail-on-failure step is missing. Apply
  **Prompt 6**.
- **Workflow does not run at all** — the file must be at `.github/workflows/api-tests.yml`
  (exact path) on the `main` branch, and the trigger must include your branch.
- **Push rejected** — you are pushing to the upstream repo, not your fork. `git remote -v` should
  show *your* username.
