# Postman MCP Server — Setup Instructions

The Postman MCP server lets Cursor (and other AI IDEs) create and manage
Postman collections directly via the Postman API — no manual import needed.

**Security rule: the API key must be stored as a system environment variable
in your shell profile — NOT in any file inside your project folder.
Cursor indexes your project files. Your shell profile is outside the project
and invisible to Cursor.**

---

## Step 1 — Get Your Postman API Key

1. Open Postman desktop app
2. Click your profile icon (top right) → **Settings**
3. Go to **API Keys**
4. Click **Generate API Key**, give it a name (e.g. `cursor-mcp`)
5. Copy the key — you will only see it once

---

## Step 2 — Store the Key Outside the Project

Set the key as a system environment variable in your shell profile.
This file lives in your home directory — outside any project folder — so
Cursor cannot index or read it.

### Mac / Linux

Open your shell profile in a text editor:

```bash
# zsh (default on Mac)
open ~/.zshrc

# bash
open ~/.bashrc
```

Add this line at the bottom:

```bash
export POSTMAN_API_KEY=your-key-here
```

Reload the profile:

```bash
source ~/.zshrc   # or source ~/.bashrc
```

### Windows

1. Open **Start → Edit the system environment variables**
2. Click **Environment Variables**
3. Under **User variables**, click **New**
4. Variable name: `POSTMAN_API_KEY`
5. Variable value: your key
6. Click OK

---

## Step 3 — Configure the MCP Server

The config file contains no secrets — it simply tells the MCP server
to use `POSTMAN_API_KEY` from the environment it inherits at startup.

### Cursor

Create or edit `~/.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "postman": {
      "command": "npx",
      "args": ["-y", "@postman/mcp-server"],
      "env": {
        "POSTMAN_API_KEY": "${POSTMAN_API_KEY}"
      }
    }
  }
}
```

The ready-to-use file is at `snippets/mcp-config-cursor.json`.

### VS Code + GitHub Copilot

Create `.vscode/mcp.json` in your project:

```json
{
  "servers": {
    "postman": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@postman/mcp-server"],
      "env": {
        "POSTMAN_API_KEY": "${POSTMAN_API_KEY}"
      }
    }
  }
}
```

The ready-to-use file is at `snippets/mcp-config-vscode.json`.

### Windsurf / Antigravity

In the MCP server settings, set:
- Command: `npx -y @postman/mcp-server`
- Environment variable: `POSTMAN_API_KEY` — leave the value blank,
  it will be inherited from your system environment

---

## Step 4 — Restart Your AI IDE

Fully restart so the IDE picks up the updated shell environment.
Verify the MCP is connected:

1. **Cursor Settings → Features → MCP** — Postman server should show a green indicator
2. **In the chat**, type: `What MCP tools do you have available?`
   Postman tools should appear in the response

---

## Available MCP Tools (after setup)

| Tool | What it does |
|------|-------------|
| `create_collection` | Creates a new collection in your workspace |
| `create_folder` | Adds a folder inside a collection |
| `create_request` | Adds a request (with tests) to a folder |
| `run_collection` | Runs a collection via the Postman API |
| `get_collections` | Lists all collections in your workspace |

---

## Troubleshooting

**"Unauthorized"** — The environment variable is not set or the key is wrong.
Run `echo $POSTMAN_API_KEY` in a new terminal to confirm it is set.

**MCP tools not appearing** — Restart the IDE after setting the env variable.
The IDE must launch after the variable is set to inherit it.

**"npx: not found"** — Install Node.js from nodejs.org (includes npx).
