#!/bin/bash
cd ~/dotfiles
test -f .custombashrc && cat .bashrc .custombashrc > ~/.bashrc || cp .bashrc ~/.bashrc
source ~/.bashrc
cp .vimrc .ideavimrc
cp .bash_profile .vimrc .ideavimrc .minttyrc ..
cd -
