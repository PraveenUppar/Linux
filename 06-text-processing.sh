#!/bin/bash
# Text Processing — Searching and Filtering Text
# Run: bash 06-text-processing.sh

# Create sample files
cat > access.log << 'EOF'
2025-09-20 10:00:01 GET /home 200 user1
2025-09-20 10:00:05 POST /login 200 user2
2025-09-20 10:00:10 GET /dashboard 200 user1
2025-09-20 10:00:15 GET /api/users 404 user3
2025-09-20 10:00:20 POST /api/data 500 user2
2025-09-20 10:00:25 GET /home 200 user4
2025-09-20 10:00:30 DELETE /api/users/5 403 user3
2025-09-20 10:00:35 GET /about 200 user1
2025-09-20 10:00:40 POST /login 401 user5
2025-09-20 10:00:45 GET /api/products 200 user2
EOF

# ============================================
# grep — Search for patterns in files
# ============================================

echo "=== grep basics ==="

grep "404" access.log
# Find lines containing "404"

grep "user1" access.log
# Find all lines with "user1"

grep -i "get" access.log
# -i = case-insensitive

grep -n "500" access.log
# -n = show line numbers

grep -c "200" access.log
# -c = count matching lines

grep -v "200" access.log
# -v = invert: show lines that DON'T match

echo ""
echo "=== grep advanced ==="

grep "GET\|POST" access.log
# Match GET or POST

grep -E "(404|500|403)" access.log
# -E = extended regex: match any error code

grep -w "GET" access.log
# -w = whole word match only

# grep -r "TODO" ./src/
# -r = recursive: search in all files in a directory

# grep -rl "password" ./config/
# -rl = list only filenames that contain "password"

# ============================================
# find — Search for files and directories
# ============================================

echo ""
echo "=== find ==="

mkdir -p findtest/sub1/sub2
touch findtest/app.js findtest/server.js findtest/style.css
touch findtest/sub1/readme.md findtest/sub1/sub2/data.json

# Find by name
find findtest -name "*.js"
# Find all .js files

find findtest -name "*.md"
# Find all .md files

find findtest -type d
# Find directories only

find findtest -type f
# Find files only

find /home -name "*.log" -size +1M
# Find .log files larger than 1MB

find . -name "*.tmp" -delete
# Find and DELETE all .tmp files (⚠️ careful!)

find . -name "node_modules" -type d -prune
# Find all node_modules directories

find . -mtime -7
# Files modified in the last 7 days

find . -mtime +30
# Files modified more than 30 days ago

# ============================================
# sort — Sort lines of text
# ============================================

echo ""
echo "=== sort ==="

cat > numbers.txt << 'EOF'
banana
apple
cherry
apple
date
banana
cherry
EOF

sort numbers.txt
# Alphabetical sort

sort -r numbers.txt
# Reverse sort

sort -u numbers.txt
# Unique: remove duplicates while sorting

# sort -n file.txt     → Numeric sort
# sort -k2 file.txt    → Sort by 2nd column
# sort -t: -k3 file    → Sort by 3rd column, delimiter is :

# ============================================
# uniq — Remove/count duplicate lines
# ============================================

echo ""
echo "=== uniq (must sort first!) ==="

sort numbers.txt | uniq
# Remove consecutive duplicates (must sort first!)

sort numbers.txt | uniq -c
# Count occurrences of each line

sort numbers.txt | uniq -d
# Show ONLY duplicated lines