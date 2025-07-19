#!/bin/bash

echo "======================= Firewall Setup Script (Rocky Linux) ======================="
echo ""
echo " WARNING ⚠️⚠️⚠️⚠️⚠️⚠️⚠️!! PLEASE RUN THIS IF U KNOW ABOUT FIREWALL OTHERWISE THE CONSEQUENCES CAN BE VERY BAD. SO PLEASE RUN AT UR OWN RISK "
echo ""
echo "Intended for Rocky Linux systems using 'firewall'."

echo ""
echo ""

# Ensure running as root

if [ "$EUID" -ne 0 ]
then
	echo "PLEASE RUN THIS SCRIPT AS ROOT(SUDO)!!!"
	exit 1
fi

echo ""
echo ""

# Step 1: Check if firewalld is installed and running
echo "Checking if firewall is active...."
if  ! systemctl is-active --quiet firewalld 
then
	echo "firewalld IS NOT RUNNING. START WITH: sudo systemctl start firewalld"
	exit 1
fi

echo "firewall is active !!!"

echo ""
echo ""

# Step 2: Set default zone
echo "Current default zone:"
echo "# firewall-cmd --get-default-zone"

echo ""
echo ""

# Step 3: Show current rules
echo "Current Rules"
echo "# firewall-cmd --list-all"

echo ""
echo ""

# Step 4: Add rules
echo "Allowing SSH (Port 22)"
echo "# firewall-cmd --zone=public --add-service=ssh --permanent"

echo "Allowing HTTP (Port 80) and HTTPS (Port 443)..."
echo "# firewall-cmd --zone=public --add-service=http --permanent"
echo "# firewall-cmd --zone=public --add-service=https --permanent"

echo ""
echo ""

# Step 5: Reload firewall to apply rules
echo "Reloading firewalld to apply rules..."
echo "# firewall-cmd --reload"

echo ""
echo ""

# Step 6: Verify Rules
echo " Final Config"
echo "# firewall-cmd --list-all"

echo ""
echo ""

echo "======================================================================"

echo "END OF SCRIPT!! PLEASE RUN THIS ONLY IF U KNOW WHAT IS GOING ON HERE!!!!"

exit 0


