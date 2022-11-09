#!/bin/bash

#Update and upgrade OS
sudo apt-get update -y && sudo apt-get upgrade -y

#Install Zsh and ohmyzsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Install nvim, clone nvim config and install plugins
sudo apt install neovim -y
git clone https://github.com/snipav1/nvimconfig.git
cp ~/nvimconfig/.config ~/
vim +'PlugInstall --sync' +qa
sudo apt install python3-pip -y

#Install Docker
sudo apt-get update -y
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

#Reboot machine
sudo reboot
