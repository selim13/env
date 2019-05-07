#!/bin/bash

# Cli snippets for fresh system bootstraping

# Create stuff
mkdir -p ~/bin ~/opt

# Install stuff
sudo apt update
sudo apt install -y \
    build-essential \
    vim \
    htop \
    tmux \
    iotop \
    git \
    wget \
    curl \
    zsh \
    tree \
    mysql-client

# Install gui stuff
sudo apt install -y \
    redshift-gtk \
    fonts-firacode \
    mplayer \
    ffmpeg \
    inkscape \
    gimp

# vscode
# jetbrains toolbox/phpstorm
# tg https://telegram.org/dl/desktop/linux
# eagle https://www.autodesk.com/products/eagle/free-download

usermod -s /usr/bin/zsh selim13

[ ! -d ~/.oh-my-zsh ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
[ ! -d ~/.zgen ] && git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
[ ! -d ~/.fzf ] && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# Node stuff
[ ! -x "$(command -v nvm)" ] && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm install --lts

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install --no-install-recommends yarn

# Docker
if [ ! -x "$(command -v docker)" ]; then
    curl -fsSL get.docker.com | CHANNEL=test sh
    sudo usermod -aG docker $USER
    sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
        && sudo chmod +x /usr/local/bin/docker-compose
    base=https://github.com/docker/machine/releases/download/v0.16.0 &&
        curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
        sudo install /tmp/docker-machine /usr/local/bin/docker-machine
fi

# Kicad
sudo add-apt-repository --yes ppa:js-reynaud/kicad-5.1
sudo apt update
sudo apt install --install-suggests kicad

# KeepassXC
sudo add-apt-repository ppa:phoerious/keepassxc
sudo apt update

# Figma
# https://github.com/ChugunovRoman/figma-linux
sudo apt-key adv --recv-key --keyserver keyserver.ubuntu.com 70F3445E637983CC
sudo add-apt-repository ppa:chrdevs/figma

# Spotify
# https://www.spotify.com/int/download/linux/
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client