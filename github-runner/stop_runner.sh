#!/bin/bash
set -e
set -x

# Cd into directory holding this script
cd "${BASH_SOURCE[0]%/*}"

# Stop the service
sudo systemctl disable runner
sudo systemctl stop runner
