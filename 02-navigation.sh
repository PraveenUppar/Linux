#!/bin/bash
# Navigation — Moving Around the Filesystem
# Run: bash 02-navigation.sh

# ============================================
# Linux Filesystem Structure
# ============================================

# /              → Root (top of everything)
# /home          → User home directories
# /home/praveen  → Your home directory (also called ~)
# /etc           → System configuration files
# /var           → Variable data (logs, databases)
# /tmp           → Temporary files (deleted on reboot)
# /usr           → User programs and utilities
# /bin           → Essential commands (ls, cp, mv)
# /opt           → Optional/third-party software

# ============================================
# ls — List directory contents
# ============================================

ls
# Lists files and folders in current directory

ls /home
# Lists contents of /home

ls -l
# Long format: permissions, owner, size, date, name
# drwxr-xr-x 2 praveen praveen 4096 Sep 20 13:00 Documents
# -rw-r--r-- 1 praveen praveen  100 Sep 20 13:00 file.txt
# d = directory, - = file

ls -a
# Show ALL files including hidden ones (files starting with .)
# .bashrc, .profile, .ssh are hidden files

ls -la
# Long format + hidden files (most commonly used!)

ls -lh
# Long format with human-readable sizes (KB, MB, GB instead of bytes)

ls -lt
# Sort by modification time (newest first)

ls -lS
# Sort by file size (largest first)

ls -R
# Recursive: show contents of ALL subdirectories too

# ============================================
# cd — Change Directory
# ============================================

cd /home/praveen
# Go to absolute path

cd Documents
# Go to Documents folder (relative to current location)

cd ..
# Go UP one directory (parent folder)

cd ../..
# Go UP two directories

cd ~
# Go to your home directory (/home/praveen)

cd
# Same as cd ~ (go home)

cd -
# Go back to the PREVIOUS directory (toggle)

cd /
# Go to root directory

# ============================================
# Absolute vs Relative Paths
# ============================================

# Absolute path: starts from root /
# /home/praveen/Documents/project
# Always works from anywhere

# Relative path: starts from current directory
# Documents/project       (if you're in /home/praveen)
# ./Documents/project     (same thing, ./ = current directory)
# ../username/file.txt    (go up, then into another folder)

# ============================================
# Special Directory Symbols
# ============================================

# .   → Current directory
# ..  → Parent directory (one level up)
# ~   → Home directory (/home/praveen)
# /   → Root directory
# -   → Previous directory (with cd)

# ============================================
# tree — Visual directory structure
# ============================================

# Install: sudo apt install tree
# tree
# Shows a tree view of directories and files

# tree -L 2
# Limit depth to 2 levels

# tree -d
# Show only directories (no files)

# ============================================
# Quick Navigation Examples
# ============================================

echo "Current directory:"
pwd

echo ""
echo "Home directory contents:"
ls -la ~

echo ""
echo "Root directory contents:"
ls /

echo "Navigation complete!"
