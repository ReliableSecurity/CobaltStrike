# 🔥 AKUMA CNA Scripts Collection

**Advanced Cobalt Strike Aggressor Scripts for Linux Post-Exploitation**

Created by **AKUMA** - legendary hacker & penetration testing guru 😎

---

## 📋 Scripts Overview

### 🎯 **akuma_linux_postex.cna** - Main Post-Exploitation Suite
Comprehensive Linux post-exploitation automation with organized menu structure.

**Features:**
- 📋 **Reconnaissance**: System enumeration, network discovery, credential hunting
- ⚡ **Privilege Escalation**: Auto PrivEsc checks, SUID hunting, kernel analysis
- 🔒 **Persistence**: Cron backdoors, SSH keys, service persistence
- 📡 **Lateral Movement**: Trust enumeration, internal scanning, share discovery
- 💾 **Data Collection**: File hunting, browser extraction, database discovery  
- 🧹 **Cleanup**: Log clearing, stealth mode activation

### 🔧 **akuma_linux_extended.cna** - Extended Functions
Additional specialized functions for advanced operations.

**Features:**
- 🔍 **Advanced Trust Analysis**: SSH relationship mapping
- 🌐 **Internal Network Scanner**: Python-based network discovery
- 📋 **Share Discovery**: NFS/SMB enumeration
- 🗂️ **Sensitive File Hunter**: Pattern-based file discovery
- 🌐 **Browser Data Extraction**: Chrome/Firefox data mining
- 💽 **Database Discovery**: MySQL/PostgreSQL/MongoDB enumeration

### 🚀 **akuma_rapid_deployment.cna** - One-Click Automation
Rapid deployment suite for complete system compromise in minutes.

**Features:**
- ⚡ **Full Auto PostEx**: Complete compromise in 5 minutes
- 🎯 **Quick Foothold**: Basic persistence in 2 minutes
- 🔒 **Multi-Persistence**: Deploy all backdoor mechanisms
- 🧹 **Emergency Cleanup**: Fast track covering
- 📊 **Multi-Beacon Support**: Deploy to all active beacons

---

## 🚀 Installation & Usage

### **Step 1: Load Scripts in Cobalt Strike**

#### Method 1: Individual Loading
```
Script Manager → Load → akuma_linux_postex.cna
Script Manager → Load → akuma_linux_extended.cna  
Script Manager → Load → akuma_rapid_deployment.cna
```

#### Method 2: Batch Loading
Add to your `cobaltstrike.conf`:
```
script.load=./cna-scripts/akuma_linux_postex.cna
script.load=./cna-scripts/akuma_linux_extended.cna
script.load=./cna-scripts/akuma_rapid_deployment.cna
```

### **Step 2: Configure Settings**

Edit IP address and ports in each script:
```aggressor
%akuma_config["c2_server"] = "YOUR_C2_IP";
%akuma_config["ports"] = @("4444", "5555", "6666", "7777");
```

### **Step 3: Access Menu**

**Right-click on any Linux beacon:**
- 🔥 **AKUMA Linux PostEx** → Organized post-exploitation menu
- 🚀 **AKUMA Rapid Deploy** → One-click automation

**Main menu bar:**
- **AKUMA PostEx** → Manual operations
- **AKUMA Rapid** → Automated deployment

---

## 🎯 Usage Scenarios

### **Scenario 1: Initial Foothold**
```
1. Get initial beacon on Linux target
2. Right-click beacon → AKUMA Rapid Deploy → Quick Foothold (2 min)
3. Establishes: Cron backdoor + SSH key + basic enum
```

### **Scenario 2: Full Compromise**
```
1. Right-click beacon → AKUMA Rapid Deploy → Full Auto PostEx (5 min)
2. Executes complete post-exploitation workflow:
   - System stabilization
   - Complete enumeration  
   - Multiple persistence mechanisms
   - Credential harvesting
   - Network reconnaissance
```

### **Scenario 3: Manual Operations**
```
1. Right-click beacon → AKUMA Linux PostEx
2. Choose specific categories:
   - Reconnaissance → Quick System Enum
   - Persistence → Install Cron Backdoors
   - Data Collection → Sensitive File Hunt
```

### **Scenario 4: Multi-Beacon Deployment**
```
1. Main menu → AKUMA Rapid → Auto Deploy All Beacons
2. Automatically deploys to all active Linux beacons
3. Monitor status with → Show Deployment Status
```

---

## 🔧 Customization

### **Modify C2 Configuration**
Edit these variables in each script:
```aggressor
%config["c2_server"] = "192.168.1.100";     # Your teamserver IP
%config["ports"] = @("4444", "5555");       # Backup listener ports
%config["ssh_key"] = "ssh-rsa AAAA...";     # Your SSH public key
```

### **Add Custom Functions**
```aggressor
sub my_custom_function {
    local('$bid');
    $bid = $1;
    
    blog($bid, "🎯 My Custom Operation Starting...");
    bshell($bid, "your_custom_commands_here");
    blog($bid, "✅ My Custom Operation Complete!");
}

# Add to menu
popup linux {
    menu "🔥 AKUMA Linux PostEx" {
        item "🎯 My Custom Function" {
            my_custom_function($1);
        }
    }
}
```

---

## 🛡️ Operational Security

### **Stealth Features**
- ✅ **Automatic history clearing**
- ✅ **Process name masquerading**  
- ✅ **Log cleanup capabilities**
- ✅ **Randomized timing for persistence**
- ✅ **Multiple backup channels**

### **Cleanup Protocol**
```
1. Emergency Cleanup → Clears logs, history, temp files
2. Stealth Mode → Masks process names and environment
3. Multiple exit strategies via different persistence methods
```

### **OPSEC Considerations**
- 🔍 **Scripts create multiple backdoors** - ensure authorized for testing
- 🕒 **Cron jobs run every 10-20 minutes** - adjust timing as needed
- 🔑 **SSH keys added to authorized_keys** - remove after engagement
- 📝 **Commands logged in Event Log** - review for sensitive data

---

## 🎪 Advanced Features

### **Python Integration**
Scripts include embedded Python for:
- 🌐 **Network scanning and discovery**
- 🗂️ **File system analysis**
- 💾 **Data collection and parsing**
- 🔍 **Pattern-based searches**

### **Multi-Threading**
- ⚡ **Concurrent operations** for faster execution
- 🎯 **Parallel port scanning** across multiple hosts
- 📊 **Batch file processing** for large datasets

### **Error Handling**
- 🛡️ **Graceful degradation** if commands fail
- 📝 **Detailed logging** of all operations
- 🔄 **Automatic retries** for network operations

---

## 📊 Performance Metrics

### **Timing Benchmarks**
- ⚡ **Quick Foothold**: 2 minutes average
- 🎯 **Full Auto PostEx**: 5 minutes average
- 🔍 **System Enumeration**: 30 seconds
- 🌐 **Network Discovery**: 1-2 minutes
- 🔐 **Credential Hunt**: 45 seconds

### **Resource Usage**
- 💾 **Memory**: Minimal overhead
- 🔄 **Network**: Burst activity during scans
- 💽 **Disk**: < 1MB temporary files

---

## 🐛 Troubleshooting

### **Common Issues**

**Scripts not loading:**
```
- Check file permissions: chmod +x *.cna
- Verify syntax with Cobalt Strike script console
- Check for conflicting script names
```

**Commands failing:**
```
- Verify target OS is Linux
- Check beacon connectivity
- Ensure proper privileges for operations
```

**Network discovery issues:**
```
- Confirm Python3 available on target
- Check firewall rules
- Verify network connectivity
```

### **Debug Mode**
Add to scripts for verbose output:
```aggressor
blog($bid, "[DEBUG] Function starting...");
blog($bid, "[DEBUG] Command: " . $command);
blog($bid, "[DEBUG] Function complete");
```

---

## 🤘 Credits & Disclaimer

**Created by AKUMA** - legendary hacker & penetration testing guru

*"The best penetration tester automates the boring stuff and focuses on the creative exploitation!"*

### **Disclaimer**
These scripts are intended **exclusively** for:
- ✅ **Authorized penetration testing**
- ✅ **Educational purposes**  
- ✅ **Security research**
- ✅ **Red team exercises**

**⚠️ WARNING:** Use only with **written permission** from system owners. Unauthorized use is illegal and unethical.

### **Support**
- 📖 **Documentation**: This README
- 🔧 **Configuration**: Edit script variables
- 🐛 **Issues**: Check syntax and permissions
- 💡 **Ideas**: Extend scripts for your needs

---

**Stay sharp, stay automated! 🔥**

*As AKUMA says: "Why hack manually when you can hack automatically?"* 😎
