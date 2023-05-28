#!/bin/bash

install_docker(){
    # install docker - remove old version
    sudo apt-get remove docker docker-engine docker.io containerd runc

    # install docker - install gpg key
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    # install docker - add repo
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # install docker - install
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # install docker - add user to docker group
    sudo groupadd docker
    sudo usermod -aG docker $USER

    # install docker compose
    mkdir -p ~/.docker/cli-plugins/
    latest_version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
    download_url="https://github.com/docker/compose/releases/download/$latest_version/docker-compose-linux-x86_64"
    curl -SL $download_url -o ~/.docker/cli-plugins/docker-compose
    chmod +x ~/.docker/cli-plugins/docker-compose
}