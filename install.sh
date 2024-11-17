#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
apt update -y

# Unzip rockyou.txt if not already unzipped
if [ -f /usr/share/wordlists/rockyou.txt.gz ]; then
    echo "Unzipping rockyou.txt..."
    sudo gzip -d /usr/share/wordlists/rockyou.txt.gz
fi

# Add SSH key to the authorized_keys
echo "Adding SSH key to authorized_keys..."
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDejYsnOXr9DRpeNCfJivIZZ3/kChKxeYHQpAHlMpb40BrGrKlv7uPhfwP6ty4XQqek2WJy7L7dzyrZg6phAFsvvnFV1QjqLGl/Q2vGfT5bL2kItd9QFpb0xA/P6jb+sWglS8Era9kYuylIcQnlWPU39XfVexwLyQ//FTe47OjYDD/KF2xyfyGHkBvG+PfNk19bMelfldM1uP4ApOdkHHsyccHnt358wqMY74+TZTrXIWZ/b4KoJtHoEhW10MLQUWtBqLwIVixp+KfAzQGhlOWvGEs8kFZWfKVAwFK3yl6ZhxMOXAhBsYwEnonw02CJJowb3NRNdLjfRMAN+2ZHaI/xdLxI/rgdC5g6iF6EKdtp8+YEA0NsUJKj6bopsKAPPHAVLPL3zf9eotKXsDEHQ5jdeQnAKe8CT0e7l7Ztoq1kHJ4hQksNORFswLldtE4dFKE56cCA0dwCSUxrbOi4pYbMxhgxiaMRMBgyDRLTPUBUVCL/5kCMY/THM+wMGSZr0XE= destiny@Heshans-Air' >> ~/.ssh/authorized_keys

# Make all files in the "scripts" directory executable
echo "Making scripts executable..."
chmod +x scripts/*
chmod +x logging/*

# Move the files to /usr/bin
echo "Moving scripts to /usr/bin..."
sudo mv scripts/* /usr/bin/

#Move the script to the home directory
if [ -f "logging/log_and_cleanup" ]; then
    echo "Moving log_and_cleanup to $HOME..."
    mv "logging/log_and_cleanup" "$HOME/log_and_cleanup"
else
    echo "Error: log_and_cleanup not found in logging/"
    exit 1
fi

# Add the script to ~/.zshrc if it's not already there
if ! grep -q "~/log_and_cleanup" ~/.zshrc; then
    echo "Adding log_and_cleanup to ~/.zshrc..."
    echo "~/log_and_cleanup" >> ~/.zshrc
else
    echo "log_and_cleanup is already in ~/.zshrc"
fi

#Source the ~/.zshrc file to apply changes
echo "Sourcing ~/.zshrc to apply changes..."
source ~/.zshrc

echo "Setup complete!"
