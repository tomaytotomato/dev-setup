#!/usr/bin/env bash

# Update Hblock hosts
hblock -H /etc/hosts.allow -F /etc/hosts.deny

# Install Linuxbrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/bruce/.bashrc
