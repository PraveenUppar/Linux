#!/bin/bash
# Terminal Basics — Your First Commands
# Run: bash 01-terminal-basics.sh

# ============================================
# What is the Terminal?
# ============================================

# The terminal (CLI) is a text-based way to interact with your computer.
# Instead of clicking buttons, you type commands.
# It's faster and more powerful than a GUI for developers.

# ============================================
# pwd — Print Working Directory (where am I?)
# ============================================

pwd
# Output: /home/praveen (your current location in the filesystem)
# Like looking at the address bar in a file explorer.

# ============================================
# whoami — Who is the current user?
# ============================================

whoami
# Output: praveen

# ============================================
# hostname — Name of the computer
# ============================================

hostname
# Output: praveen-laptop (or whatever your machine is named)

# ============================================
# date — Current date and time
# ============================================

date
# Output: Sat Sep 20 13:00:00 IST 2025

date +"%Y-%m-%d"
# Output: 2025-09-20 (formatted)

date +"%H:%M:%S"
# Output: 13:00:00 (just time)

# ============================================
# echo — Print text to the terminal
# ============================================

echo "Hello Linux!"
# Output: Hello Linux!

echo "My name is $(whoami)"
# Output: My name is praveen (command substitution with $())

echo "Today is $(date +%A)"
# Output: Today is Saturday

# ============================================
# clear — Clear the terminal screen
# ============================================

clear
# Or press Ctrl + L (keyboard shortcut — same thing)

# ============================================
# history — Show previously run commands
# ============================================

history
# Shows numbered list of all commands you've run

# history 10
# Shows last 10 commands

# !50
# Re-run command number 50 from history

# !! 
# Re-run the LAST command (useful: sudo !!)

# Ctrl + R → Search through history (type to search, Enter to run)

# ============================================
# man — Manual pages (documentation)
# ============================================

man ls
# Opens the manual for the 'ls' command
# Press q to quit, arrow keys to scroll, /search to search

man mkdir
# Manual for mkdir

# ============================================
# --help — Quick help for a command
# ============================================

ls --help
# Shorter than man, shows usage and options

mkdir --help

# ============================================
# which — Where is a command located?
# ============================================

which bash
# Output: /usr/bin/bash

which ls
# Output: /usr/bin/ls

which node
# Output: /usr/bin/node (if installed)

# ============================================
# uname — System information
# ============================================

uname
# Output: Linux

uname -a
# Output: Linux praveen-laptop 5.15.0 ... x86_64 GNU/Linux (full info)

# ============================================
# Keyboard Shortcuts
# ============================================

# Ctrl + C  → Cancel/stop the current command
# Ctrl + L  → Clear screen (same as 'clear')
# Ctrl + D  → Exit the terminal
# Ctrl + A  → Move cursor to beginning of line
# Ctrl + E  → Move cursor to end of line
# Ctrl + R  → Search command history
# Tab       → Auto-complete file/folder names (press twice for all options)
# Up Arrow  → Previous command

echo "Terminal basics complete!"
