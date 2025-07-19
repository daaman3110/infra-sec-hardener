#!/bin/bash

# This script installs all the necessary required tools for rocky Linux but maybe there still could be some that could be left

# Step 1: Check if it is running as root
if [ "$EUID" -ne 0 ]
then
	echo "[ERROR] Please run this script as root (use sudo)"
	exit 1
fi

echo "[INFO] Starting installation of essential tools"

# Step 2: Function to install a package if not install

install_package(){
	PACKAGE=$1
	NAME=$2

	if dnf list installed "$PACKAGE" &> /dev/null
	then
		echo "[OK] $NAME is already installed."
	else
		echo "[INSTALL] Installing $NAME....."
		dnf install -y $PACKAGE
		if [ $? -eq 0 ]
		then
			echo "[OK] $NAME installed successfully."
		else
			echo "[ERROR] Something went really wrong. Could not install $NAME"
		fi
	fi
}

install_package "traceroute" "Traceroute"
install_package "fail2ban" "Fail2Ban (SSH Protection)"
install_package "s-nail" "S-Nail (For mailing purposes)"
install_package "iproute" "ss for recon"

echo "[INFO] All tools checked and installed..."
