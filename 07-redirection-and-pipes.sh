#!/bin/bash
# Redirection and Pipes — Controlling Input/Output
# Run: bash 07-redirection-and-pipes.sh

# ============================================
# Standard Streams
# ============================================

# Every command has 3 streams:
# stdin  (0) → Input  (keyboard by default)
# stdout (1) → Output (terminal by default)
# stderr (2) → Errors (terminal by default)

# Redirection lets you change where these streams go.

# ============================================
# > — Redirect output to a file (OVERWRITE)
# ============================================

echo "Hello World" > output.txt
# Creates output.txt with "Hello World"
# If file exists, it's OVERWRITTEN!

ls -la > filelist.txt
# Save directory listing to a file

cat output.txt

# ============================================
# >> — Redirect output to a file (APPEND)
# ============================================

echo "Line 1" > log.txt
echo "Line 2" >> log.txt
echo "Line 3" >> log.txt
# >> adds to the end instead of overwriting

echo "Log contents:"
cat log.txt


# ============================================
# | — Pipe (send output of one command to another)
# ============================================

echo ""
echo "=== Pipes ==="

# Pipes connect commands: output of command1 → input of command2

ls -la | head -5
# List files, show only first 5 lines

echo ""
cat log.txt | wc -l
# Count lines in log.txt using pipe

echo ""
echo "Sorting pipe example:"
echo -e "banana\napple\ncherry\napple" | sort | uniq
# Sort → remove duplicates

echo ""
echo "Grep through pipe:"
echo -e "error: disk full\ninfo: server started\nerror: timeout\ninfo: request ok" | grep "error"
# Filter only error lines

# Real-world pipe examples:
ps aux | grep node           #→ Find running Node.js processes
cat access.log | grep "500"  #→ Find server errors in log
history | grep "git"         #→ Find git commands you've run
ls -la | sort -k5 -n -r     #→ List files sorted by size (largest first)


# ============================================
# Chaining Commands
# ============================================

echo ""
echo "=== Chaining ==="

# ; — Run commands sequentially (regardless of success/failure)
echo "First"; echo "Second"; echo "Third"

# && — Run next command ONLY if previous succeeded
echo "Step 1 OK" && echo "Step 2 runs because Step 1 succeeded"

# mkdir newdir && cd newdir && echo "Inside new directory"
# Each step only runs if the previous one worked

# || — Run next command ONLY if previous FAILED
ls /nonexistent 2>/dev/null || echo "Directory not found, running fallback"

# Combine: try something, fallback if it fails
# command1 && echo "Success" || echo "Failed"

