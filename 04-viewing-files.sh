#!/bin/bash
# Viewing Files — Reading File Contents
# Run: bash 04-viewing-files.sh

# Create a sample file for demos
cat > sample.txt << 'EOF'
Line 1: Hello Linux!
Line 2: This is a sample file.
Line 3: We are learning to view files.
Line 4: cat, less, head, tail are useful commands.
Line 5: Each command has a different purpose.
Line 6: cat shows everything at once.
Line 7: less lets you scroll through large files.
Line 8: head shows the first few lines.
Line 9: tail shows the last few lines.
Line 10: wc counts lines, words, and characters.
EOF

# ============================================
# cat — Display entire file contents
# ============================================

echo "=== cat ==="
cat sample.txt
# Prints the whole file to the terminal
# Good for small files, bad for large files (floods the screen)

echo ""
cat -n sample.txt
# -n adds line numbers

cat file1.txt file2.txt
# Concatenate (combine) and display multiple files

cat > newfile.txt
# Create a new file and type content (Ctrl+D to save/exit)

cat >> existingfile.txt
# Append content to an existing file

# ============================================
# less — View file with scrolling (for large files)
# ============================================

# less sample.txt
# Opens file in a scrollable viewer
# Navigation:
#   Space / Page Down  → Next page
#   b / Page Up        → Previous page
#   Arrow keys         → Scroll line by line
#   g                  → Go to beginning
#   G                  → Go to end
#   /searchterm        → Search forward
#   ?searchterm        → Search backward
#   n                  → Next search result
#   q                  → Quit

# less is BETTER than cat for large files!
# Tip: Use less for log files, config files, etc.

# ============================================
# more — Older version of less (simpler)
# ============================================

# more sample.txt
# Similar to less but fewer features
# Space to go forward, q to quit
# Can only scroll forward (less can scroll both ways)

# ============================================
# head — Show first N lines
# ============================================

echo "=== head ==="
head sample.txt
# Shows first 10 lines (default)

head -n 3 sample.txt
# Shows first 3 lines

head -5 sample.txt
# Shows first 5 lines (shorthand)

# ============================================
# tail — Show last N lines
# ============================================

echo ""
echo "=== tail ==="
tail sample.txt
# Shows last 10 lines (default)

tail -n 3 sample.txt
# Shows last 3 lines

tail -5 sample.txt
# Shows last 5 lines (shorthand)

# tail -f /var/log/syslog
# -f = follow: shows new lines as they are added in real-time
# VERY useful for monitoring log files!
# Ctrl+C to stop following

tail -f -n 50 logfile.log
# Show last 50 lines, then follow new entries

# ============================================
# wc — Word count (lines, words, characters)
# ============================================

echo ""
echo "=== wc ==="
wc sample.txt
# Output: 10  60  350  sample.txt
#         lines  words  bytes

wc -l sample.txt
# Lines only: 10

wc -w sample.txt
# Words only: 60

wc -c sample.txt
# Bytes only: 350

wc -m sample.txt
# Characters only

# Count lines in multiple files
# wc -l *.txt

# ============================================
# Other Useful Viewing Commands
# ============================================

# nl sample.txt
# Number lines (like cat -n but more options)

# tac sample.txt
# Reverse cat — shows file from bottom to top

# rev sample.txt
# Reverse each line (character by character)

# file sample.txt
# Tells you what type of file it is
echo ""
echo "=== file type ==="
file sample.txt

# stat sample.txt
# Detailed file information (size, permissions, timestamps)
echo ""
echo "=== stat ==="
stat sample.txt

# Clean up
rm -f sample.txt

echo ""
echo "Viewing files complete!"
