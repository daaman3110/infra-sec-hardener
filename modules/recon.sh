#!/bin/bash

# Shows timestamp and hostname
echo ""
echo ""

echo "===================== System Recon Report ======================"
echo "Date: $(date)"
echo "Hostname: $(hostname)"

echo ""
echo ""

# Shows IP Information
echo "===================== IP Address Information ===================="
echo "Internal IPs:"
echo "	-$(ip a | awk '/inet/ {print $2}' | head -1 ) (lo)"
echo "	-$(ip a | awk '/inet/ {print $2}' | awk 'NR==3 {print $1}') (eth0)"
echo "Public IP:"
echo "	-$(curl -s ifconfig.me)"

echo ""
echo ""

# Open Listening Ports
echo "===================== Open Ports (Listening) ================="
echo "$(ss -tuln)"

echo ""
echo ""

# Current logged-in users information
echo "===================== Current Logged-In Users ================="
echo "$(who)"

echo ""
echo ""

# Network Listening Processes
echo "===================== Network-Listening Processes ==============="
if lsof -i -P -n | grep LISTEN > /dev/null
then
	lsof -i -P -n | grep LISTEN | awk '{print $1, $2, $3, $9}'
else
	echo "No Listening services found"
fi

echo ""
echo ""

# Top 5 Processes by CPU
echo "===================== Top 5 Processes by CPU ======================"
echo "$(top -b -n 1 | awk 'NR>5 {print}' | head -7)"

echo ""
echo ""

# Traceroute to Google DNS (8.8.8.8)
echo "===================== Traceroute to 8.8.8.8 ========================"
echo "$(traceroute 8.8.8.8 | awk 'NR>1 {print}')"

echo ""
echo ""

# Recent SSH Logins
echo "===================== Recent Remote/SSH Logins ======================="
echo "$(last | grep pts | head -10)"

echo ""
echo ""

