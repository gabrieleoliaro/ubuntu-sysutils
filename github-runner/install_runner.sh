#!/bin/bash
set -e
set -x

# Cd into directory holding this script
cd "${BASH_SOURCE[0]%/*}"

# Create a folder
mkdir actions-runner && cd actions-runner
# Download the latest runner package
curl -o actions-runner-linux-x64-2.299.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.299.1/actions-runner-linux-x64-2.299.1.tar.gz
# Optional: Validate the hash
echo "147c14700c6cb997421b9a239c012197f11ea9854cd901ee88ead6fe73a72c74  actions-runner-linux-x64-2.299.1.tar.gz" | shasum -a 256 -c
# Extract the installer
tar xzf ./actions-runner-linux-x64-2.299.1.tar.gz
# Install dependencies
sudo apt-get upgrade -y && sudo apt-get update -y
sudo ./bin/installdependencies.sh
