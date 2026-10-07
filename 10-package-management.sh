#!/bin/bash
# Package Management — Installing Software
# Run: bash 10-package-management.sh (most commands need sudo)

# ============================================
# APT — Advanced Package Tool (Ubuntu/Debian)
# ============================================

# apt is the package manager for Ubuntu (like npm for Node.js)

# --- Update package lists ---
sudo apt update
# Downloads latest package info from repositories
# ALWAYS run this before installing anything!

# --- Upgrade installed packages ---
sudo apt upgrade
# Updates all installed packages to latest versions

# sudo apt update && sudo apt upgrade -y
# Update + upgrade in one command (-y = auto-yes)

# --- Install a package ---
# sudo apt install packagename
# sudo apt install nginx          → Install Nginx web server
# sudo apt install git            → Install Git
# sudo apt install curl           → Install curl
# sudo apt install nodejs         → Install Node.js

# Install multiple at once:
sudo apt install git curl wget vim

# Install without asking for confirmation:
sudo apt install -y nginx

# --- Remove a package ---
sudo apt remove packagename
# Removes the package but keeps config files

sudo apt purge packagename
# Removes package AND config files (cleaner)

sudo apt autoremove
# Remove unused dependencies (packages no longer needed)

# --- Search for packages ---
# apt search keyword
# apt search "web server"
# apt search nodejs

# --- Show package info ---
apt show packagename
# apt show nginx

# --- List installed packages ---
apt list --installed
# apt list --installed | grep node

# ============================================
# Snap — Universal packages
# ============================================

# Snap packages are self-contained (include all dependencies)

# sudo snap install packagename
# sudo snap install postman     → Install Postman
# sudo snap install code        → Install VS Code
# sudo snap install docker      → Install Docker

# snap list                     → List installed snaps
# sudo snap remove packagename  → Remove a snap
# sudo snap refresh             → Update all snaps

