#!/bin/bash
# Processes — Managing Running Programs
# Run: bash 09-processes.sh

# ============================================
# What is a Process?
# ============================================

# A process is a running instance of a program.
# Every command you run creates a process.
# Each process has a PID (Process ID).

# ============================================
# ps — List running processes
# ============================================

echo "=== ps ==="

ps
# Shows YOUR processes in the current terminal

ps aux
# Shows ALL processes on the system
# a = all users, u = user format, x = include background

ps aux | head -10
# First 10 processes

ps aux | grep bash
# Find bash processes

# ps -ef
# Another format showing parent-child relationships

# ============================================
# top — Real-time process monitor
# ============================================

# top
# Live updating view of processes (like Task Manager)
# Press q to quit
# Press P to sort by CPU
# Press M to sort by memory
# Press k to kill a process (enter PID)

# htop (better version, install: sudo apt install htop)
# htop
# Color-coded, mouse support, easier to use

# ============================================
# PID — Process ID
# ============================================

echo ""
echo "=== PID ==="

echo "This script's PID: $$"
echo "Parent process PID: $PPID"

# pidof bash
# Find PID of a process by name

pgrep node
# Find PIDs of all node processes

# ============================================
# kill — Stop a process
# ============================================

kill PID
# Send SIGTERM (graceful shutdown) to a process

kill -9 PID
# Send SIGKILL (force kill — immediate, no cleanup)

kill -15 PID
# SIGTERM (default, same as kill PID)

# Common signals:
# SIGTERM (15) → Graceful shutdown (process can clean up)
# SIGKILL (9)  → Force kill (process cannot catch this)
# SIGSTOP (19) → Pause a process
# SIGCONT (18) → Resume a paused process
# SIGHUP (1)   → Hangup (often used to reload config)

# killall processname
# Kill ALL processes with that name
killall node     → Kill all Node.js processes

# pkill -f "node server.js"
# Kill processes matching a pattern

# ============================================
# Process Info
# ============================================

echo ""
echo "=== System Info ==="

# uptime — How long the system has been running
uptime

# free — Memory usage
echo ""
free -h
# -h = human readable (MB, GB)

