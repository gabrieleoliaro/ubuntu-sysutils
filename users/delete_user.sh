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

# Check if the user exists
if ! id -u "$username" >/dev/null 2>&1; then
  echo "User '$username' does not exist."
  exit 1
fi

# Delete the user and its home directory
userdel -r "$username"

echo "User '$username' has been deleted successfully."
