# 🔐 InfraSec-Hardener: Infrastructure Security Automation Scripts

A modular shell-based toolkit designed to harden and monitor fresh Linux servers for secure production deployment. Built with a practical DevOps mindset to automate real-world server initialization and security hardening tasks.

> 🛠️ **Designed & tested on Rocky Linux**

---

## 📁 Project Structure

```
infra-sec-hardener/
├── modules/
│   ├── firewall_setup.sh    # Secure firewall rules (uses firewalld)
│   ├── ssh_hardening.sh     # Disable root login, change port, etc.
│   ├── monitor.sh           # Real-time system resource monitor
│   └── install.sh           # Install required packages
├── logs/                    # Logs from monitoring script
├── bootstrap.sh             # Runs all modules in one go
└── README.md               # Project documentation
```

---

## ✨ Features

### 🛡️ **Firewall Hardening**
- Configures secure firewall rules using `firewalld`
- Allows only essential services like SSH
- Blocks unnecessary ports and services

### 🔑 **SSH Security Enhancement**
- **Disables root login** for enhanced security
- **Changes default SSH port** from `22` to a custom port
- **Implements rate-limiting** with `Fail2Ban` to prevent brute-force attacks
- Configures secure SSH daemon settings

### 📊 **Real-time System Monitoring**
Provides comprehensive insights into:
- **CPU Load** - Current system load and utilization
- **Memory Usage** - RAM consumption and availability
- **Disk Space** - Storage utilization across mounted filesystems
- **Top Processes** - Resource-intensive processes identification

### 📦 **Automated Package Installation**
Installs essential security and monitoring tools:
- `traceroute` - Network diagnostic utility
- `fail2ban` - Intrusion prevention system
- `ss` - Socket statistics utility
- `s-nail` - Mail transfer agent

### 📝 **Comprehensive Logging**
- Stores timestamped monitoring output in `logs/` directory
- Maintains audit trail for system analysis
- Facilitates troubleshooting and compliance reporting

---

## 🚀 Quick Start

### Prerequisites
- Rocky Linux (or compatible RHEL-based distribution)
- Root or sudo privileges
- Git installed on the system

### Installation & Usage

1. **Clone the repository:**
   ```bash
   git clone https://github.com/daaman3110/infra-sec-hardener.git
   cd infra-sec-hardener
   ```

2. **Make scripts executable:**
   ```bash
   sudo chmod +x bootstrap.sh
   sudo chmod +x modules/*.sh
   ```

3. **Run the complete hardening suite:**
   ```bash
   sudo ./bootstrap.sh
   ```

### Individual Module Execution

You can also run specific modules independently:

```bash
# Install required packages
sudo ./modules/install.sh

# Setup firewall rules
sudo ./modules/firewall_setup.sh

# Harden SSH configuration
sudo ./modules/ssh_hardening.sh

# Start system monitoring
./modules/monitor.sh
```

---

## 📋 Module Details

| Module | Purpose | Key Actions |
|--------|---------|-------------|
| `install.sh` | Package installation | Installs security and monitoring tools |
| `firewall_setup.sh` | Firewall configuration | Sets up firewalld rules and policies |
| `ssh_hardening.sh` | SSH security | Configures secure SSH settings |
| `monitor.sh` | System monitoring | Provides real-time system metrics |
| `bootstrap.sh` | Orchestration | Executes all modules in proper sequence |

---

## 🔧 Configuration

### Customizing SSH Port
Edit `modules/ssh_hardening.sh` to modify the custom SSH port:
```bash
# Change this line to your preferred port
NEW_SSH_PORT=2222
```

### Firewall Rules
Modify `modules/firewall_setup.sh` to add or remove firewall rules based on your requirements.

### Monitoring Intervals
Adjust monitoring frequency in `modules/monitor.sh` by modifying the sleep interval.

---

## 📊 Monitoring Output

The monitoring script generates logs in the `logs/` directory with timestamps. Example log structure:
```
logs/
├── monitor_2024-01-15_10-30-45.log
├── monitor_2024-01-15_11-30-45.log
└── ...
```

---

## 🛡️ Security Considerations

- **Always test in a non-production environment first**
- **Backup your current SSH configuration** before running SSH hardening
- **Ensure you have alternative access methods** before changing SSH settings
- **Review firewall rules** to ensure they meet your specific requirements
- **Monitor system performance** after implementing hardening measures

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for:
- Bug fixes
- Feature enhancements
- Documentation improvements
- Additional hardening modules

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


---

**⚠️ Disclaimer:** This toolkit is designed for educational and professional use. Always test in a controlled environment before deploying to production systems.
