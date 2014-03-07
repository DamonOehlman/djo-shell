#!/usr/bin/env bash

# # bootstrap-desktop.sh
# 
# This is a  shell script that is designed to take a barebones ubuntu server
# install, and install the bits and pieces required to make it a functioning
# development desktop environment. Basically I've broken too many desktop
# configurations in the past so I now only work in a rebuildable VM environment
# that I know I can rebuild easily.
#
# To execute this script, run the following:
# 
# To be completed

# install required dependencies to get up and running
sudo apt-get install \

    # git
    git \

    # virtual box video drivers and guest additions
    virtualbox-ose-guest-utils virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms
    
# clone dotfiles
git clone https://github.com/DamonOehlman/dotfiles.git ~/dotfiles

# initialise helpful links
rm -rf ~/.config
ln -s ~/dotfiles/config ~/.config
ln -s ~/dotfiles/.bashrc-custom ~/.bashrc-custom
echo ". ~/.bashrc-custom" >> ~/.bashrc
