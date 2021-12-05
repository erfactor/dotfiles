#!/bin/bash
cd ~/dotfiles
source .bashrc
cp .vimrc .ideavimrc
cp .bash_profile .bashrc .vimrc .ideavimrc .minttyrc ..
cd -
