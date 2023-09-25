#!/bin/bash
set -e
set -x

docker system prune -af
sudo rm -rf /home/ubuntu/actions-runner/_work /home/ubuntu/actions-runner/_diag
