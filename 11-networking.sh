#!/bin/bash
# Networking — Connecting, Downloading, SSH
# Run: bash 11-networking.sh

# ============================================
# ip / ifconfig — View network interfaces
# ============================================

echo "=== Network Info ==="

ip addr show
# Shows all network interfaces and IP addresses (modern command)

ip a
# Short form of ip addr show

ifconfig
# Older command (may need: sudo apt install net-tools)

hostname -I 2>/dev/null
# Shows your IP address(es)

# ============================================
# ping — Test connectivity
# ============================================

echo ""
echo "=== ping ==="

ping -c 3 google.com
# Send 3 pings to google.com
# -c 3 = count (stop after 3, otherwise runs forever)

ping -c 3 192.168.1.1
# Ping a local IP address

# If ping works → you have internet connectivity
# If ping fails → check your network connection

# ============================================
# curl — Transfer data from URLs
# ============================================

echo ""
echo "=== curl ==="

curl -s https://httpbin.org/ip
# Make an HTTP GET request, -s = silent (no progress bar)

echo ""

# curl https://api.github.com/users/octocat
# GET request to GitHub API

# curl -o file.html https://example.com
# Download and save as file.html (-o = output file)

# curl -O https://example.com/image.png
# Download with original filename (-O)

# curl -X POST https://api.example.com/data -H "Content-Type: application/json" -d '{"name":"Praveen"}'
# POST request with JSON body

# curl -I https://google.com
# Show only response headers (-I = head request)

# curl -L https://short.url/abc
# Follow redirects (-L)

# ============================================
# wget — Download files
# ============================================

wget https://example.com/file.zip
# Download a file


# ============================================
# ssh — Secure Shell (remote login)
# ============================================

ssh username@server-ip
ssh praveen@192.168.1.100
ssh root@myserver.com

ssh -p 2222 user@server
# Connect on a different port (-p)

# ============================================
# scp — Secure Copy (copy files over SSH)
# ============================================

scp file.txt user@server:/home/user/
# Copy local file to remote server

scp user@server:/home/user/file.txt ./
# Copy remote file to local machine

# ============================================
# Ports and Network Services
# ============================================

echo ""
echo "=== Ports ==="

# Common ports:
# 22   → SSH
# 80   → HTTP
# 443  → HTTPS
# 3000 → Node.js / React dev server
# 3306 → MySQL
# 5432 → PostgreSQL
# 27017 → MongoDB
# 6379 → Redis
# 8080 → Alternative HTTP

# ============================================
# DNS / Host resolution
# ============================================

nslookup google.com
# Look up DNS records for a domain

dig google.com
# Detailed DNS lookup (install: sudo apt install dnsutils)
