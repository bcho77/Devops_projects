# Linux & Networking for DevOps – Cheatsheet

## Linux System Basics

```bash
uname -a                    # Kernel & OS info
hostnamectl                 # Host information
uptime                      # System running time
whoami                      # Current user
id                           # User ID info
```

## File & Directory Management

```bash
ls -lah                     # List files (detailed)
cd /path                    # Change directory
pwd                         # Current directory
cp file1 file2              # Copy file
mv old new                  # Move/rename file
rm -rf dir                  # Delete directory recursively
find / -name file.txt       # Find files
```

## Permissions & Ownership

```bash
chmod 755 file              # Change permissions
chmod -R 644 dir            # Recursive permission change
chown user:group file       # Change owner
stat file                   # File info
```

## Disk & Filesystems

```bash
df -h                       # Disk usage
lsblk                       # Block devices
mount                       # Mounted filesystems
mount /dev/sdb1 /mnt        # Mount disk
umount /mnt                 # Unmount disk
```

## Process Management

```bash
ps aux                      # Running processes
top                         # Real-time process view
htop                        # Enhanced process viewer
kill <pid>                  # Kill process
kill -9 <pid>               # Force kill
```

## Package Management

```bash
apt update && apt upgrade   # Debian/Ubuntu update
yum update                  # RHEL/CentOS update
apk add curl                # Alpine package install
```

## Logs & Monitoring

```bash
journalctl                  # Systemd logs
journalctl -u nginx         # Service logs
tail -f /var/log/syslog     # Follow logs
dmesg                       # Kernel logs
```

## Services (systemd)

```bash
systemctl status nginx      # Service status
systemctl start nginx       # Start service
systemctl stop nginx        # Stop service
systemctl enable nginx      # Enable at boot
systemctl restart nginx     # Restart service
```

---

## Networking Basics

## Network Configuration

```bash
ip a                        # Network interfaces
ip r                        # Routing table
nmcli device status         # NetworkManager status
```

## Connectivity & Troubleshooting

```bash
ping google.com             # Test connectivity
traceroute google.com       # Trace network path
mtr google.com              # Real-time trace
curl http://example.com     # HTTP request
wget http://example.com     # Download file
```

## Ports & Sockets

```bash
ss -tulpn                   # Listening ports
netstat -tulpn              # Legacy port check
lsof -i :80                 # Process using port
```

## DNS

```bash
nslookup google.com         # DNS lookup
dig google.com              # Detailed DNS info
cat /etc/resolv.conf        # DNS configuration
```

## Firewall & Security

```bash
ufw status                  # UFW firewall status
ufw allow 80                # Allow port
iptables -L                 # List iptables rules
firewall-cmd --list-all     # Firewalld rules
```

## Network Performance

```bash
iperf3 -s                   # Start iperf server
iperf3 -c host              # Test bandwidth
tc qdisc show               # Traffic control
```

## SSH & Remote Access

```bash
ssh user@host               # SSH login
ssh -i key.pem user@host    # SSH with key
scp file user@host:/path    # Copy file via SSH
rsync -av dir user@host:/path
```

---

## DevOps Daily Commands

```bash
watch kubectl get pods      # Watch Kubernetes resources
crontab -l                  # List cron jobs
crontab -e                  # Edit cron jobs
nohup cmd &                 # Run in background
screen / tmux               # Session management
```

## Troubleshooting Checklist

* Check logs (`journalctl`, `/var/log`)
* Verify disk & memory (`df`, `free -h`)
* Inspect network (`ip a`, `ss -tulpn`)
* Validate DNS & firewall

---

*This cheatsheet covers essential Linux and networking commands every DevOps engineer should master.*
