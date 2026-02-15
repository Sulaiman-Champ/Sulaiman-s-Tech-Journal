#!/bin/bash
#secure-ssh.sh
#author Sulaiman
#creates a new ssh user using $1 parameter
#adds a public key from the local repo or curled from the remote repo
#removes roots ability to ssh in

# Check if username parameter is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

username=$1

# Create user
sudo useradd -m -d /home/$username -s /bin/bash $username

# Create .ssh directory
sudo mkdir -p /home/$username/.ssh

# Copy public key from repo to authorized_keys
repo_path="/Sulaiman-s-Tech-Journal/SYS265/linux/public-keys/id_rsa.pub"
sudo cp $repo_path /home/$username/.ssh/authorized_keys

# Set proper permissions
sudo chmod 700 /home/$username/.ssh
sudo chmod 600 /home/$username/.ssh/authorized_keys
sudo chown -R $username:$username /home/$username/.ssh

echo "User $username created with SSH key authentication"
