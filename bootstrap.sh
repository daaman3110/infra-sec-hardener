#!/bin/bash

# ================================
# Bootstrap Script for Project
# ================================
# This script prepares the environment by:
# - Creating required directories
# - Setting permissions
# - Cleaning old logs (optional)
# - Providing a clean setup for other modules

LOG_DIR="./logs"
CRONTAB_FILE="./crontab.txt"
MODULES_DIR="./modules"

echo "Starting bootstrap process..."

# 1. Create logs directory if it doesn't exist
if [ ! -d "$LOG_DIR" ]; then
    echo "Creating logs directory at $LOG_DIR"
    mkdir "$LOG_DIR"
else
    echo "Logs directory already exists."
fi

# 2. Set permissions for logs (read-write for owner only)
chmod 700 "$LOG_DIR"
echo "Set secure permissions on logs directory."

# 3. Create crontab.txt if it doesn't exist
if [ ! -f "$CRONTAB_FILE" ]; then
    echo "Creating placeholder for crontab.txt"
    touch "$CRONTAB_FILE"
else
    echo "crontab.txt already exists."
fi

# 4. Clean up logs older than 7 days (optional)
find "$LOG_DIR" -type f -mtime +7 -exec rm -f {} \;
echo "Cleaned old logs older than 7 days."

# 5. Make all scripts in modules executable
if [ -d "$MODULES_DIR" ]; then
    chmod +x "$MODULES_DIR"/*.sh 2>/dev/null
    echo "Made all module scripts executable."
fi

echo "Bootstrap complete!!"

