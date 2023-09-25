#!/bin/bash
set -e
set -x

# Cd into directory holding this script
cd "${BASH_SOURCE[0]%/*}"

# Create the runner and start the configuration experience
cd actions-runner
./config.sh remove --token <INSERT TOKEN HERE>
