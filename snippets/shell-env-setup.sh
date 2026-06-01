#!/bin/bash
# All environment variables needed for this course.
# Follow the section for your operating system below.

# ══════════════════════════════════════════════════════════════════════════════
# MAC / LINUX
# ══════════════════════════════════════════════════════════════════════════════
#
# 1. Open your shell profile in a text editor:
#      Mac (zsh — default):  open ~/.zshrc
#      Mac/Linux (bash):     open ~/.bashrc
#
# 2. Paste these lines at the bottom of the file:

export BASE_URL=http://localhost:3000
export TEST_EMAIL=demo@techshop.com
export TEST_PASSWORD=password123
export POSTMAN_API_KEY=         # fill in after Section 5

# 3. Save the file, then reload it:
#      source ~/.zshrc     (zsh)
#      source ~/.bashrc    (bash)
#
# 4. Verify — run each line in the terminal, it should print the value:
#      echo $BASE_URL
#      echo $TEST_EMAIL
#      echo $TEST_PASSWORD
#      echo $POSTMAN_API_KEY


# ══════════════════════════════════════════════════════════════════════════════
# WINDOWS
# ══════════════════════════════════════════════════════════════════════════════
#
# Option A — GUI (System Properties)
# 1. Press Win + S, search for "Edit the system environment variables", open it
# 2. Click "Environment Variables"
# 3. Under "User variables", click "New" for each variable below:
#
#    Variable name        Variable value
#    BASE_URL             http://localhost:3000
#    TEST_EMAIL           demo@techshop.com
#    TEST_PASSWORD        password123
#    POSTMAN_API_KEY      (fill in after Section 5)
#
# 4. Click OK on all dialogs, then restart your terminal and IDE
#
# 5. Verify — run each line in Command Prompt or PowerShell:
#    echo %BASE_URL%              (Command Prompt)
#    echo $env:BASE_URL           (PowerShell)
#
#
# Option B — PowerShell (permanent, current user)
# Run these in PowerShell as Administrator:

# [System.Environment]::SetEnvironmentVariable("BASE_URL", "http://localhost:3000", "User")
# [System.Environment]::SetEnvironmentVariable("TEST_EMAIL", "demo@techshop.com", "User")
# [System.Environment]::SetEnvironmentVariable("TEST_PASSWORD", "password123", "User")
# [System.Environment]::SetEnvironmentVariable("POSTMAN_API_KEY", "", "User")
#
# Restart your terminal after running these.
