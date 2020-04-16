#!/bin/bash

# vim
ln -fsv $PWD/.vimrc ~/

# zsh
ln -fsv $PWD/.zshrc ~/

# kitty
# ln -fsv $PWD/.config/kitty/kitty.conf ~/.config/kitty

# alacritty
ln -fsv $PWD/.config/alacritty/alacritty.yml ~/.config/alacritty

# tmux
ln -fsv $PWD/.tmux.conf ~/

# urxvt
# ln -fsv $PWD/.Xresources ~/

# scripts
ln -fsv $PWD/.local/bin/* /usr/local/bin

# i3
ln -fsv $PWD/.config/i3/config ~/.config/i3/config

# i3blocks
ln -fsv $PWD/.config/i3blocks/config ~/.config/i3blocks/config
ln -fsv $PWD/.config/i3blocks/i3blocks_scripts ~/.config/i3blocks

# lockscreen
ln -fsv $PWD/.config/i3/i3lock.service /etc/systemd/system
systemctl enable i3lock.service
