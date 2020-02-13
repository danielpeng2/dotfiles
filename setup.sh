#!/bin/bash

# vim
ln -fsv $PWD/.vimrc ~/

# zsh
ln -fsv $PWD/.zshrc ~/

# kitty
ln -fsv $PWD/kitty.conf ~/.config/kitty

# tmux
ln -fsv $PWD/.tmux.conf ~/

# urxvt
# ln -fsv $PWD/.Xresources ~/

# scripts
ln -fsv $PWD/scripts/display_switch /usr/local/bin
ln -fsv $PWD/scripts/i3lockscreen /usr/local/bin 

# i3
ln -fsv $PWD/i3config ~/.config/i3/config
ln -fsv $PWD/i3blocks ~/.config/i3blocks/config
ln -fsv $PWD/i3lock.service /etc/systemd/system
systemctl enable i3lock.service
