#!/bin/bash
set -e
set -x

# Cd into directory holding this script
cd "${BASH_SOURCE[0]%/*}"

# Create the runner and start the configuration experience
cd actions-runner
./config.sh --unattended --url https://github.com/flexflow/FlexFlow --token <INSERT TOKEN HERE> --label <LABEL>
