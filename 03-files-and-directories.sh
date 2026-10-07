#!/bin/bash
# Files and Directories — Creating, Copying, Moving, Deleting
# Run: bash 03-files-and-directories.sh

# ============================================
# touch — Create empty files
# ============================================

touch myfile.txt
# Creates an empty file called myfile.txt
# If file exists, updates its timestamp

touch file1.txt file2.txt file3.txt
# Create multiple files at once

touch notes.md index.html style.css
# Create files with different extensions

# ============================================
# mkdir — Create directories (folders)
# ============================================

mkdir myfolder
# Create a single directory

mkdir dir1 dir2 dir3
# Create multiple directories

mkdir -p projects/backend/src
# -p creates parent directories too (nested)
# Creates: projects/ → projects/backend/ → projects/backend/src/

mkdir -p app/{src,public,config}
# Create multiple subdirectories using brace expansion
# Creates: app/src, app/public, app/config

# ============================================
# cp — Copy files and directories
# ============================================

cp myfile.txt myfile_copy.txt
# Copy a file

cp myfile.txt myfolder/
# Copy file into a directory

cp myfile.txt myfolder/renamed.txt
# Copy and rename

cp file1.txt file2.txt file3.txt myfolder/
# Copy multiple files to a directory

cp -r myfolder myfolder_backup
# -r = recursive: copy a directory and ALL its contents
# MUST use -r for directories!

cp -i myfile.txt myfolder/
# -i = interactive: ask before overwriting

# ============================================
# mv — Move or rename files/directories
# ============================================

mv myfile.txt newname.txt
# Rename a file (move to same location with new name)

mv newname.txt myfolder/
# Move file into a directory

mv myfolder/newname.txt .
# Move file from myfolder to current directory

mv dir1 renamed_dir
# Rename a directory

mv file1.txt file2.txt myfolder/
# Move multiple files to a directory

mv -i file.txt myfolder/
# -i = ask before overwriting

# ============================================
# rm — Remove (delete) files
# ============================================

rm file3.txt
# Delete a file (PERMANENT — no trash bin!)

rm file1.txt file2.txt
# Delete multiple files

rm -i notes.md
# -i = ask for confirmation before deleting

rm -f myfile.txt
# -f = force: don't ask, don't error if file doesn't exist

# ============================================
# rm -r — Remove directories
# ============================================

rm -r dir2
# Delete a directory and ALL its contents

rm -rf dir3
# Force delete directory — no confirmation, no errors
# ⚠️ DANGEROUS! Double-check the path before running!
# NEVER run: rm -rf /  (deletes EVERYTHING on the system)

rmdir myfolder_backup
# Remove an EMPTY directory only (safer than rm -r)

# ============================================
# Brace Expansion — Shortcuts
# ============================================

touch test_{1..5}.txt
# Creates: test_1.txt test_2.txt test_3.txt test_4.txt test_5.txt

mkdir day_{mon,tue,wed,thu,fri}
# Creates: day_mon day_tue day_wed day_thu day_fri

touch {app,server,config}.js
# Creates: app.js server.js config.js

# ============================================
# Wildcards (Glob Patterns)
# ============================================

# ls *.txt         → All .txt files
# ls *.js          → All .js files
# ls file?.txt     → file1.txt, file2.txt (? = single character)
# ls test_[1-3]*   → test_1.txt test_2.txt test_3.txt
# rm *.tmp         → Delete all .tmp files
# cp *.sh scripts/ → Copy all .sh files to scripts/

# ============================================
# Demo: Create a project structure
# ============================================

echo "Creating project structure..."
mkdir -p demo-project/{src,public,config,tests}
touch demo-project/src/{app.js,server.js,routes.js}
touch demo-project/public/{index.html,style.css}
touch demo-project/config/{db.js,env.js}
touch demo-project/{package.json,README.md,.gitignore}

echo "Project structure:"
ls -la demo-project/
echo ""
echo "Source files:"
ls demo-project/src/

# Clean up
rm -rf demo-project myfolder dir1 renamed_dir day_*
rm -f myfile_copy.txt index.html style.css test_*.txt *.js

echo "Files and directories complete!"
