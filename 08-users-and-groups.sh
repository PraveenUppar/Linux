#!/bin/bash
# Users and Groups — Managing Access
# Run: bash 08-users-and-groups.sh (some commands need sudo)

# ============================================
# sudo — Run as superuser (administrator)
# ============================================

# sudo command
# Runs the command with root (admin) privileges
# You'll be asked for YOUR password

# sudo apt update              → Update package lists
# sudo systemctl restart nginx → Restart a service
# sudo !!                      → Re-run last command with sudo

# ============================================
# Current User Info
# ============================================

echo "=== Current User ==="
whoami
# Your username

id
# User ID (uid), group ID (gid), and all groups
# uid=1000(praveen) gid=1000(praveen) groups=1000(praveen),27(sudo)

groups
# List groups you belong to

# ============================================
# User Management (need sudo)
# ============================================

# --- Create a user ---
sudo adduser newuser
# Interactive: asks for password, full name, etc.

# --- Delete a user ---
sudo deluser username
sudo userdel -r username    #(-r removes home directory too)

# --- Change password ---
passwd                      #(change YOUR password)
sudo passwd username        #(change another user's password)

# --- Modify a user ---
sudo usermod -aG groupname username    (add user to a group)
sudo usermod -l newname oldname        (rename user)
sudo usermod -s /bin/zsh username      (change shell)

# ============================================
# Group Management (need sudo)
# ============================================

# --- Create a group ---
sudo groupadd developers

# --- Delete a group ---
sudo groupdel developers

# --- Add user to group ---
sudo usermod -aG developers praveen
# -a = append (don't remove from other groups)
# -G = group to add to

# --- Remove user from group ---
sudo gpasswd -d praveen developers

# --- List group members ---
getent group developers

