#!/bin/bash
set -e
set -x

# Cd into directory holding this script
cd "${BASH_SOURCE[0]%/*}"

# Create the runner and start the configuration experience
cd actions-runner
./config.sh --unattended --url https://github.com/flexflow/FlexFlow --token <INSERT TOKEN HERE> --labels <LABEL>

echo "ACTIONS_RUNNER_HOOK_JOB_STARTED=/home/ubuntu/pre_job_cleanup.sh" >> /home/ubuntu/actions-runner/.env
echo "ACTIONS_RUNNER_HOOK_JOB_COMPLETED=/home/ubuntu/post_job_cleanup.sh" >> /home/ubuntu/actions-runner/.env
