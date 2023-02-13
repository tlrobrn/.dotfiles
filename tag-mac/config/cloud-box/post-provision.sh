#!/usr/bin/env bash

echo "Clone dotfiles"
git clone git@github.com:tlrobrn/.dotfiles.git
cd .dotfiles
git checkout no-nvim-setup
cd ..

echo "Install RCM"
sudo apt-get update
sudo apt-get -y install rcm

echo "RCUP"
RCRC=$HOME/.dotfiles/rcrc rcup -f -t pco
