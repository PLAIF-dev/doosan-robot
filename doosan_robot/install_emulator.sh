#!/bin/bash

emulator_version="3.0.1"
emulator_image="doosanrobot/dsr_emulator:$emulator_version"


pulling() {
    printf " $1"
    printf "\n Downloading..."
    docker pull "$2" > /dev/null 2>&1
    while [ $? -ne 0 ]; do
        sleep 1
        docker pull "$2" > /dev/null 2>&1
    done
    echo "\n -> Completed $1"
}
## all container names have 'emulator' as suffix to detect and run it. see run_drcf.sh  
if docker ps -a --format '{{.Names}}' | grep -q emulator; then
    echo "$emulator_name is already installed"
else
    # Pull dsr_emulator image
    pulling "pull dsr_emulator version : $emulator_version" "$emulator_image"

fi
