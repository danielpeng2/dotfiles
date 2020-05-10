#!/bin/bash

# vim
ln -fsv $PWD/.vimrc ~/
# zsh
ln -fsv $PWD/.zshrc ~/
# tmux
ln -fsv $PWD/.tmux.conf ~/

# nvim
ln -fsv $PWD/.config/nvim/init.vim ~/.config/nvim
# coc
ln -fsv $PWD/.config/coc/coc-settings.json ~/.vim/
ln -fsv $PWD/.config/coc/coc-settings.json ~/.config/nvim
# alacritty
ln -fsv $PWD/.config/alacritty/alacritty.yml ~/.config/alacritty
# i3
ln -fsv $PWD/.config/i3/config ~/.config/i3/config
# i3blocks
ln -fsv $PWD/.config/i3blocks/config ~/.config/i3blocks/config
ln -fsv $PWD/.config/i3blocks/i3blocks_scripts ~/.config/i3blocks
# zathura
ln -fsv $PWD/.config/zathura/zathurarc ~/.config/zathura

# scripts
ln -fsv $PWD/.local/bin/* /usr/local/bin

# lockscreen
ln -fsv $PWD/.config/i3/i3lock.service /etc/systemd/system
systemctl enable i3lock.service
