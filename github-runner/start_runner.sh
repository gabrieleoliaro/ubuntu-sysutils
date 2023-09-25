#!/bin/bash
set -e
set -x

# Cd into directory holding this script
cd "${BASH_SOURCE[0]%/*}"

# Copy runner service into system folder
sudo cp runner.service /etc/systemd/system/runner.service

# Start the service now and at each boot time
sudo systemctl daemon-reload
sudo systemctl enable runner
sudo systemctl start runner
