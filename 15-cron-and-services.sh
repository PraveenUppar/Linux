#!/bin/bash
# Cron Jobs and Services — Scheduling and Background Services
# Run: bash 15-cron-and-services.sh (some commands need sudo)

# ============================================
# crontab — Schedule recurring tasks
# ============================================

# Cron runs commands automatically at scheduled times.
# Each user has their own crontab file.

# crontab -e    → Edit your cron jobs
# crontab -l    → List your cron jobs
# crontab -r    → Remove all your cron jobs

# --- Cron Format ---
# ┌───────────── minute (0-59)
# │ ┌───────────── hour (0-23)
# │ │ ┌───────────── day of month (1-31)
# │ │ │ ┌───────────── month (1-12)
# │ │ │ │ ┌───────────── day of week (0-7, 0 and 7 = Sunday)
# │ │ │ │ │
# * * * * * command

# Examples:
# * * * * *     → Every minute
# */5 * * * *   → Every 5 minutes
# 0 * * * *     → Every hour (at minute 0)
# 0 9 * * *     → Every day at 9:00 AM
# 0 9 * * 1     → Every Monday at 9:00 AM
# 0 0 * * *     → Every day at midnight
# 0 0 1 * *     → First day of every month at midnight
# 0 9 * * 1-5   → Weekdays at 9:00 AM

# --- Real Examples ---
# Run backup every day at 2 AM:
0 2 * * * /home/praveen/scripts/backup.sh

# Clean temp files every Sunday at midnight:
# 0 0 * * 0 rm -rf /tmp/*

# Run a health check every 5 minutes:
*/5 * * * * /home/praveen/scripts/healthcheck.sh >> /var/log/health.log 2>&1

# Redirect output to a log file (important!):
* * * * * command >> /var/log/mycron.log 2>&1

echo "Current crontab:"
crontab -l 2>/dev/null || echo "  No cron jobs set"

# ============================================
# systemctl — Manage system services
# ============================================

# Services are background programs (daemons) managed by systemd.
# Examples: nginx, mysql, ssh, docker

echo ""
echo "=== systemctl ==="

# --- Check service status ---
sudo systemctl status nginx
# Shows if service is running, recent logs, etc.

# --- Start / Stop / Restart ---
sudo systemctl start nginx      → Start the service
sudo systemctl stop nginx       → Stop the service
sudo systemctl restart nginx    → Stop then start
sudo systemctl reload nginx     → Reload config without restart

# --- Enable / Disable (start on boot) ---
sudo systemctl enable nginx     → Start automatically on boot
# sudo systemctl disable nginx    → Don't start on boot

# --- Check if service is active ---
systemctl is-active nginx       → Returns "active" or "inactive"
systemctl is-enabled nginx      → Returns "enabled" or "disabled"

# --- List all services ---
# systemctl list-units --type=service
# systemctl list-units --type=service --state=running

echo "Running services (first 10):"
systemctl list-units --type=service --state=running 2>/dev/null | head -10

# ============================================
# journalctl — View system logs
# ============================================

echo ""
echo "=== journalctl ==="

journalctl
# View ALL system logs (can be huge!)

journalctl -u nginx
# Logs for a specific service

journalctl -u nginx -f
# Follow logs in real-time (like tail -f)

journalctl -u nginx --since "1 hour ago"
# Logs from the last hour

# journalctl -u nginx --since "2025-09-20"
# Logs since a specific date

# journalctl -b
# Logs since last boot

# journalctl --disk-usage
# How much disk space logs are using

echo "Recent system logs (last 5):"
journalctl -n 5 --no-pager 2>/dev/null || echo "  (journalctl not available)"