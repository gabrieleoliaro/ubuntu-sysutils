#!/bin/bash
set -e

# Check if the script is being run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

# Check if a username was provided as an argument
if [ $# -eq 0 ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

username="$1"
pem_path="insert path here"

# Create the user
echo "Creating user $username..."
adduser --disabled-password --gecos "" "$username"

# Set the initial password to be identical to the username
echo "Setting initial password to $username..."
echo "$username:$username" | chpasswd

# Add the user to the sudo group
echo "Adding user $username to sudo..."
usermod -aG sudo "$username"

# Configure sudo access without password prompt for the user
echo "Allowing user $user to run sudo without password..."
echo "$username ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/$username"
# Set appropriate permissions for the sudoers file
chmod 440 "/etc/sudoers.d/$username"

# Set up SSH key for the user
echo "Enabling ssh key $pem_path to be used to log in as user $username..."
sudo pem_path="$pem_path" -i -u $username bash << 'EOF'
# Create .ssh directory in the user's home directory
mkdir .ssh
# Change permissions
chmod 700 .ssh
# Retrieve public SSH key from specinfer-project.pem file
public_key="$(ssh-keygen -y -f "$pem_path")"
# Append public key to authorized_keys file
echo "$public_key" >> .ssh/authorized_keys
# Set permissions for authorized_keys file
chmod 600 .ssh/authorized_keys
EOF

echo "User '$username' has been created successfully."
