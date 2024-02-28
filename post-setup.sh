#!/usr/bin/env bash

# Update Hblock hosts
printf "Blocking social media, marketing, spam domains \n"
hblock -H /etc/hosts.allow -F /etc/hosts.deny

# Install Linuxbrew
printf "Installing LinuxBrew 🍺"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/bruce/.bashrc

printf "Initialising Jetbrains tool \n"
/opt/jetbrains-toolbox


# Turn Numlock on after login
echo "Numlock=on" | sudo tee -a "/etc/sddm.conf"
