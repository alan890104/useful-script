#!/bin/bash

install_ssh(){
    sudo apt-get install -y openssh-server
    sudo apt-get install -y openssh-client
    systemctl enable ssh
    systemctl start ssh
}