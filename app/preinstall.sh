#!/bin/bash

install_essential(){
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get install -y curl wget ca-certificates gnupg gcc g++ make build-essential git
}
