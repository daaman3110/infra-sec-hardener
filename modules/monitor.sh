#!/bin/bash

# Log File Path
LOG_FILE="../logs/system_monitor.log"

{
# Step 1: Timestamp for proper tracking
echo "================================= [$(date)]=================================="

echo ""
echo ""

# Step 2: CPU Load Average Stats
echo "CPU Load Average (1, 5, 15 mins):"
echo "$(uptime | awk '{print $9, $10, $11}')"

echo ""
echo ""

# Step 3: Memory stats
echo "Memory Usage:"
echo "Total: $(free -t -m | awk 'NR==4 {print $2}') MB"
echo "Used: $(free -t -m | awk 'NR==4 {print $3}') MB"
echo "Free: $(free -t -m | awk 'NR==4 {print $4}') MB"

echo ""
echo ""

# Step 4: Disk Usage Stats
echo "Disk Usage:"
df -h /

echo ""
echo ""

# Step 5: Top 5 Processes by CPU
echo "Top 5 Processes by CPU:"
ps -eo pid,user,%cpu,comm --sort=-%cpu | head -6

echo ""
echo ""

# Step 6: Top 5 Processes by Memory
echo "Top 5 Processes by Memory:"
ps -eo pid,user,%mem,comm --sort=-%cpu | head -6

echo ""
echo ""

echo "=============================================================================="

} >> "$LOG_FILE"
