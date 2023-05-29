#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script with sudo or as root."
    exit 1
fi

source ./app/preinstall.sh
source ./app/python.sh
source ./app/docker.sh
source ./app/node.sh
source ./app/go.sh
source ./app/ssh.sh

# Essential
install_essential

# Python
install_pyenv
install_pipenv
install_poetry

# Docker
install_docker

# Node
install_node_essentail

# Go
install_go

# SSH
install_ssh

# Check
source ~/.check.sh
source ~/.bashrc

commands=("git" "gcc" "g++" "make" "curl" \
          "pyenv" "pipenv" "poetry" "docker" \
          "node" "yarn" "go" "ssh" "code")
for cmd in "${commands[@]}"; do
    command_exists "$cmd"
done
