#!/bin/bash
# Shell Scripting — Writing Bash Scripts
# Run: bash 14-shell-scripting.sh

# ============================================
# Shebang — First line of every script
# ============================================

# #!/bin/bash
# Tells the system to use bash to run this script.
# Always include this as the first line!

# To make a script executable:
# chmod +x myscript.sh
# ./myscript.sh

# ============================================
# Variables
# ============================================

echo "=== Variables ==="

NAME="Praveen"
AGE=22
COURSE="DevOps"

echo "Name: $NAME"
echo "Age: $AGE"
echo "Course: $COURSE"

# No spaces around = sign!
# Good: NAME="Praveen"
# Bad:  NAME = "Praveen" (syntax error)

# Use ${VAR} when combining with text
echo "Hello ${NAME}!"

# Read-only variable
readonly PI=3.14
# PI=3.15  # Error: readonly variable

# ============================================
# User Input — read
# ============================================

# echo "Enter your name:"
# read user_name
# echo "Hello $user_name!"

# read -p "Enter age: " user_age
# -p = prompt message

# read -s -p "Enter password: " password
# -s = silent (hides input, good for passwords)

# ============================================
# Command Substitution
# ============================================

echo ""
echo "=== Command Substitution ==="

CURRENT_DATE=$(date +%Y-%m-%d)
echo "Today: $CURRENT_DATE"

FILE_COUNT=$(ls | wc -l)
echo "Files in this dir: $FILE_COUNT"

MY_IP=$(hostname -I 2>/dev/null | awk '{print $1}')
echo "My IP: $MY_IP"

# ============================================
# If/Else — Conditional Logic
# ============================================

echo ""
echo "=== If/Else ==="

SCORE=85

if [ $SCORE -ge 90 ]; then
    echo "Grade: A"
elif [ $SCORE -ge 80 ]; then
    echo "Grade: B"
elif [ $SCORE -ge 70 ]; then
    echo "Grade: C"
else
    echo "Grade: F"
fi

# Comparison operators (numbers):
# -eq  equal            [ $a -eq $b ]
# -ne  not equal        [ $a -ne $b ]
# -gt  greater than     [ $a -gt $b ]
# -ge  greater or equal [ $a -ge $b ]
# -lt  less than        [ $a -lt $b ]
# -le  less or equal    [ $a -le $b ]

# String comparisons:
# =   equal             [ "$a" = "$b" ]
# !=  not equal         [ "$a" != "$b" ]
# -z  empty string      [ -z "$a" ]
# -n  not empty         [ -n "$a" ]

# File tests:
# -f  file exists       [ -f "file.txt" ]
# -d  directory exists  [ -d "mydir" ]
# -e  exists (any)      [ -e "path" ]
# -r  readable          [ -r "file" ]
# -w  writable          [ -w "file" ]
# -x  executable        [ -x "file" ]

# File existence check:
if [ -f "/etc/passwd" ]; then
    echo "/etc/passwd exists"
fi

if [ -d "$HOME" ]; then
    echo "Home directory exists"
fi

# ============================================
# Loops
# ============================================

echo ""
echo "=== Loops ==="

# For loop
echo "For loop:"
for i in 1 2 3 4 5; do
    echo "  Number: $i"
done

# Range
echo "Range loop:"
for i in {1..5}; do
    echo "  Count: $i"
done

# C-style for loop
echo "C-style loop:"
for ((i=0; i<3; i++)); do
    echo "  Index: $i"
done

# Loop through files
echo "Files loop:"
for file in *.sh; do
    echo "  Script: $file"
done

# While loop
echo "While loop:"
counter=1
while [ $counter -le 3 ]; do
    echo "  Counter: $counter"
    counter=$((counter + 1))
done

# ============================================
# Functions
# ============================================

echo ""
echo "=== Functions ==="

greet() {
    echo "Hello, $1! Welcome to $2."
}

greet "Praveen" "Linux"
greet "Jane" "DevOps"

# $1, $2, $3 = function arguments
# $# = number of arguments
# $@ = all arguments
# $0 = script name

add_numbers() {
    local result=$(($1 + $2))
    echo $result
}

SUM=$(add_numbers 10 20)
echo "10 + 20 = $SUM"

# ============================================
# Script Arguments ($1, $2, ...)
# ============================================

echo ""
echo "=== Script Arguments ==="

echo "Script name: $0"
echo "First arg: $1"
echo "All args: $@"
echo "Num args: $#"

# Run: bash 14-shell-scripting.sh hello world
# $0 = 14-shell-scripting.sh
# $1 = hello
# $2 = world

# ============================================
# Exit Codes
# ============================================

echo ""
echo "=== Exit Codes ==="

# Every command returns an exit code:
# 0 = success
# Non-zero = failure (1, 2, 127, etc.)

ls /home > /dev/null 2>&1
echo "ls exit code: $?"   # 0 (success)

ls /nonexistent > /dev/null 2>&1
echo "ls fail exit code: $?"   # 2 (failure)

# In your scripts:
# exit 0   → Success
# exit 1   → General error

echo ""
echo "Shell scripting complete!"
