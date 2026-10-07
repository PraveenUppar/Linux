#!/bin/bash
# Disk and Storage — Managing Space and Archives
# Run: bash 13-disk-and-storage.sh

# ============================================
# df — Disk Free (check disk space)
# ============================================

echo "=== df (Disk Space) ==="

df -h
# Show disk usage for all mounted filesystems
# -h = human readable (GB, MB)

df -h /home
# Check space on a specific partition

# ============================================
# du — Disk Usage (check folder sizes)
# ============================================

echo ""
echo "=== du (Directory Size) ==="

du -sh ~/ 2>/dev/null
# Show total size of home directory
# -s = summary (total only), -h = human readable

du -sh */
# Size of each subdirectory

# ============================================
# lsblk — List block devices (disks)
# ============================================

echo ""
echo "=== lsblk (Disk Devices) ==="

lsblk 2>/dev/null
# Shows all disks, partitions, and mount points

# ============================================
# mount — Mount drives/partitions
# ============================================

mount
# Show all mounted filesystems

sudo mount /dev/sdb1 /mnt/usb
# Mount a USB drive to /mnt/usb

sudo umount /mnt/usb
# Unmount the drive

# Clean up
rm -rf archive_test extract_test archive.tar archive.tar.gz testfile.txt

