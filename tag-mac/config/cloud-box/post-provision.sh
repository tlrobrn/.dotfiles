#!/usr/bin/env bash

echo "Clone dotfiles"
git clone git@github.com:tlrobrn/.dotfiles.git

echo "Install RCM"
sudo apt-get update
sudo apt-get -y install rcm

echo "RCUP"
RCRC=$HOME/.dotfiles/rcrc rcup -t pco
