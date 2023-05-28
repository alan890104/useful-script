#!/bin/bash

command_exists() {
    local command_to_check="$1"

    if command -v "$command_to_check" &> /dev/null; then
        echo -e "\e[32m[Exist]\e[0m $command_to_check"
    else
        echo -e "\e[31m[Not Found]\e[0m $command_to_check"
    fi
}