#!/bin/bash
# All course secrets and environment variables.
# Add these to your shell profile — NOT inside the project folder.
#
# Mac/Linux (zsh):  open ~/.zshrc and paste the exports below, then run: source ~/.zshrc
# Mac/Linux (bash): open ~/.bashrc and paste the exports below, then run: source ~/.bashrc
# Windows:          Start → Edit the system environment variables → Environment Variables
#                   → User variables → New (add each variable individually)

# ─── TechShop API ─────────────────────────────────────────────────────────────
export BASE_URL=http://localhost:3000

# ─── Test credentials ─────────────────────────────────────────────────────────
export TEST_EMAIL=demo@techshop.com
export TEST_PASSWORD=password123

# ─── Postman API key (generate at Postman → Settings → API Keys) ──────────────
export POSTMAN_API_KEY=your-postman-api-key-here

# ─── After adding, reload your shell profile ──────────────────────────────────
# source ~/.zshrc   (Mac/Linux zsh)
# source ~/.bashrc  (Mac/Linux bash)

# ─── Verify all variables are set ─────────────────────────────────────────────
# echo $BASE_URL
# echo $TEST_EMAIL
# echo $TEST_PASSWORD
# echo $POSTMAN_API_KEY
