#!/usr/bin/env bash


# Check if cURL is installed
printf "Checking if cURL is available \n"


if ! command -v curl &> /dev/null; then
    printf "cURL not found installing \n"
    sudo apt update && sudo apt upgrade -y
    sudo apt install curl -y
else
    printf "cURL found \n"
fi


cd /tmp
# Check for Python PIP

echo "Installing Python PIP \n"

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user


# Install Ansible

python3 -m pip install --user ansible

sudo apt install ansible-core
