#!/bin/bash

install_go(){
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf go1.20.4.linux-amd64.tar.gz
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
    source ~/.bashrc
}