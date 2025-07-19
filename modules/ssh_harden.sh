#!/bin/bash

echo "=========================== SSH Hardening Script ============================"
echo ""
echo "WARNING ⚠️⚠️⚠️⚠️⚠️!!!! THIS MODIFIES SSH CONFIG"
echo ""
echo "⚠️⚠️⚠️ PLEASE PLEASE ONLY RUN IF U UNDERSTAND SSH CONFIG FILE CUZ RUNNING THIS SCRIPT WITHOUT KNOWING ANYTHING CAN LOCK U OUT OF UR OWN SYSTEM ☠️☠️☠️"
echo ""
echo "AND YES STILL FOR THE SAFETY ALL THE COMMANDS ARE COMMENTED"
echo ""

# Step 1: Backup the original SSH config
SSH_CONFIG="/etc/ssh/sshd_config"
BACKUP_FILE="/etc/ssh/sshd_config.bak$(date +%F-%H%M%S)"
echo "[*] Backing up original SSH Config to $BACKUP_FILE"
echo "sudo cp "$SSH_CONFIG" "$BACKUP_FILE""

echo ""
echo ""

# Step 2: Disabling Root Login
echo "[*] Disabling direct root login"
echo "sudo sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' "$SSH_CONFIG""
echo "sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' "$SSH_CONFIG""

echo ""
echo ""

# Step 3: Removing password login and allowing only key-based login
echo "[*] Enforcing SSH key-based login only"
echo "sudo sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication no/' "$SSH_CONFIG""
echo "sudo sed -i 's/^PasswordAuthentication.*/PasswordAuthentication no/' "$SSH_CONFIG""

echo ""
echo ""

# Step 4: Change the default SSH Port from 22 to 4444(You can obv change to any port no. u want)
NEW_PORT=4444
echo "[*] Changing SSH Port from 22 to $NEW_PORT"
echo "sudo sed -i 's/^#Port .*/Port $NEW_PORT/' "$SSH_CONFIG""
echo "sudo sed -i 's/^Port .*/Port $NEW_PORT/' "$SSH_CONFIG""

echo ""
echo ""

# Step 5: Reload the firewall to allow the new SSH port (and ensure old one is not blocked).
echo "[*] Adding firewall rule for the port $NEW_PORT"
echo "sudo firewall-cmd --permanent --add-port={$NEW_PORT}/tcp"
echo "sudo firewall-cmd --reload"

echo ""
echo ""

# Step 6: Restart the SSH Service
echo "[*] Restarting SSH Service"
echo "sudo systemctl restart sshd"

echo ""
echo ""
echo "========================= SSH Hardening Script Complete =============================="
