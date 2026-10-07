#!/bin/bash
# File Permissions — Who Can Read, Write, Execute
# Run: bash 05-file-permissions.sh

# ============================================
# Understanding Permissions
# ============================================

# Every file/directory has 3 permission types:
#   r (read)    → View file contents / list directory
#   w (write)   → Modify file / add/delete in directory
#   x (execute) → Run file as program / enter directory

# Permissions apply to 3 groups:
#   Owner (u)   → The user who owns the file
#   Group (g)   → Users in the file's group
#   Others (o)  → Everyone else

# ls -l output:
# -rwxr-xr-- 1 praveen developers 4096 Sep 20 13:00 script.sh
# │├─┤├─┤├─┤   │        │
# │ │   │  │   owner    group
# │ │   │  └── others: r-- (read only)
# │ │   └───── group:  r-x (read + execute)
# │ └───────── owner:  rwx (read + write + execute)
# └─────────── type:   - (file) or d (directory) or l (link)

# ============================================
# chmod — Change permissions
# ============================================

# Create test files
touch testfile.txt
mkdir testdir

# --- Symbolic mode (letters) ---

chmod u+x file    → Add execute for owner
chmod g+w file    → Add write for group
chmod o-r file    → Remove read for others
chmod a+r file    → Add read for ALL (a = all)
chmod u+rwx file  → Add all permissions for owner
chmod go-wx file  → Remove write+execute for group and others

chmod u+x testfile.txt
echo "After u+x:"
ls -l testfile.txt

chmod a+r testfile.txt
chmod go-wx testfile.txt
echo "After a+r, go-wx:"
ls -l testfile.txt

# --- Octal mode (numbers) — MORE COMMON ---

# Each permission has a number:
#   r = 4
#   w = 2
#   x = 1
#   - = 0

# Add them up for each group:
#   rwx = 4+2+1 = 7
#   rw- = 4+2+0 = 6
#   r-x = 4+0+1 = 5
#   r-- = 4+0+0 = 4
#   --- = 0+0+0 = 0

# chmod 755 file → Owner: rwx(7), Group: r-x(5), Others: r-x(5)
# chmod 644 file → Owner: rw-(6), Group: r--(4), Others: r--(4)
# chmod 700 file → Owner: rwx(7), Group: ---(0), Others: ---(0)
# chmod 600 file → Owner: rw-(6), Group: ---(0), Others: ---(0)

# Common permission patterns:
# 755 → Scripts, executables, directories
# 644 → Regular files (readable by all, writable by owner)
# 700 → Private directories (only owner can access)
# 600 → Private files (SSH keys, secrets)
# 777 → Everyone can do everything (⚠️ avoid in production!)

chmod 755 testfile.txt
echo "After chmod 755:"
ls -l testfile.txt

chmod 644 testfile.txt
echo "After chmod 644:"
ls -l testfile.txt

# Directories:
chmod 755 testdir
echo "Directory permissions:"
ls -ld testdir

# Recursive: apply to all files inside
# chmod -R 755 mydir/

# ============================================
# chown — Change owner and group
# ============================================

chown newowner file
chown newowner:newgroup file
chown :newgroup file          (change group only)
chown -R newowner:newgroup dir/  (recursive)

# Examples (need sudo):
sudo chown root testfile.txt
sudo chown praveen:developers testfile.txt

echo ""
echo "Current ownership:"
ls -l testfile.txt

# ============================================
# chgrp — Change group only
# ============================================

# chgrp groupname file
sudo chgrp developers testfile.txt

# ============================================
# umask — Default permissions for new files
# ============================================

# umask sets which permissions are REMOVED from new files.
# Default umask: 0022
# Files created:  666 - 022 = 644 (rw-r--r--)
# Dirs created:   777 - 022 = 755 (rwxr-xr-x)

echo ""
echo "Current umask:"
umask

# umask 027
# New files: 640 (rw-r-----), New dirs: 750 (rwxr-x---)

# ============================================
# Making a script executable
# ============================================

echo '#!/bin/bash' > myscript.sh
echo 'echo "Hello from my script!"' >> myscript.sh

echo "Before chmod +x:"
ls -l myscript.sh

chmod +x myscript.sh
echo "After chmod +x:"
ls -l myscript.sh

echo "Running script:"
./myscript.sh

# Clean up
rm -f testfile.txt myscript.sh
rmdir testdir

echo ""
echo "File permissions complete!"
