#!/bin/bash
# Environment Variables — Configuring Your Shell
# Run: bash 12-environment-variables.sh

# ============================================
# What are Environment Variables?
# ============================================

# Environment variables are key-value pairs available to all processes.
# They configure how the system and programs behave.
# Convention: UPPERCASE names (HOME, PATH, USER)

# ============================================
# Viewing Environment Variables
# ============================================

echo "=== Common Variables ==="

echo "USER: $USER"         # Current username
echo "HOME: $HOME"         # Home directory
echo "SHELL: $SHELL"       # Default shell
echo "PWD: $PWD"           # Current directory
echo "HOSTNAME: $HOSTNAME" # Computer name
echo "LANG: $LANG"         # Language/locale

env
# Print ALL environment variables

printenv
# Same as env

printenv PATH
# Print a specific variable

# ============================================
# Setting Variables
# ============================================

# Regular variable (only in current shell)
MY_NAME="Praveen"
echo "My name: $MY_NAME"

# Export (available to child processes)
export MY_APP_PORT=3000
echo "App port: $MY_APP_PORT"

# Without export: variable is only in current shell
# With export: variable is passed to programs you run from this shell

# Unset (remove a variable)
unset MY_NAME

