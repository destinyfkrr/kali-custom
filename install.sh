#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
apt update -y

sudo apt install seclists
gzip -d /usr/share/wordlists/rockyou.txt.gz

echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDejYsnOXr9DRpeNCfJivIZZ3/kChKxeYHQpAHlMpb40BrGrKlv7uPhfwP6ty4XQqek2WJy7L7dzyrZg6phAFsvvnFV1QjqLGl/Q2vGfT5bL2kItd9QFpb0xA/P6jb+sWglS8Era9kYuylIcQnlWPU39XfVexwLyQ//FTe47OjYDD/KF2xyfyGHkBvG+PfNk19bMelfldM1uP4ApOdkHHsyccHnt358wqMY74+TZTrXIWZ/b4KoJtHoEhW10MLQUWtBqLwIVixp+KfAzQGhlOWvGEs8kFZWfKVAwFK3yl6ZhxMOXAhBsYwEnonw02CJJowb3NRNdLjfRMAN+2ZHaI/xdLxI/rgdC5g6iF6EKdtp8+YEA0NsUJKj6bopsKAPPHAVLPL3zf9eotKXsDEHQ5jdeQnAKe8CT0e7l7Ztoq1kHJ4hQksNORFswLldtE4dFKE56cCA0dwCSUxrbOi4pYbMxhgxiaMRMBgyDRLTPUBUVCL/5kCMY/THM+wMGSZr0XE= destiny@Heshans-Air' >> ~/.ssh/authorized_keys


# Create necessary directories
mkdir -p ~/vpn /opt/tools/netcat /opt/tools/chisel /opt/tools/peass

# Download files
wget -O /opt/tools/peass/linpeas.sh https://github.com/peass-ng/PEASS-ng/releases/download/20240623-7d729c04/linpeas.sh
wget -O /opt/tools/peass/Winpeas.exe https://github.com/peass-ng/PEASS-ng/releases/download/20240623-7d729c04/winPEASany.exe
wget -O /opt/tools/netcat/nc64.exe https://github.com/vinsworldcom/NetCat64/releases/download/1.11.6.4/nc64.exe
wget -O /opt/tools/chisel/chisellinux.gz https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_amd64.gz
wget -O /opt/tools/chisel/chiselarm.gz https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_linux_arm64.gz
wget -O /opt/tools/chisel/chiselwin.exe.gz https://github.com/jpillora/chisel/releases/download/v1.9.1/chisel_1.9.1_windows_amd64.gz

# Move and set permissions
gunzip /opt/tools/chisel/chisellinux.gz
gunzip /opt/tools/chisel/chiselwin.exe.gz
gunzip /opt/tools/chisel/chiselarm.gz
chmod +x /opt/tools/chisel/chisellinux /opt/tools/chisel/chiselarm

# Move the files
mv scripts/* /usr/bin/

# Basic bash aliases
echo "Adding bash aliases..."
echo "alias c='clear'" >> ~/.bashrc
echo "alias upload='python3 -m http.server 1337'" >> ~/.bashrc
source ~/.bashrc

echo "Setup complete! Enjoy your Kali Linux environment."
