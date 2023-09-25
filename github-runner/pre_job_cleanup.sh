#!/bin/bash
set -e
set -x

sudo chmod 666 /var/run/docker.sock
docker system prune -af
