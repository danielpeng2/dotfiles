#!/bin/bash

# scripts
ln -fsv $PWD/scripts/* /usr/local/bin

# lockscreen
ln -fsv $PWD/i3/.config/i3/i3lock.service /etc/systemd/system
systemctl enable i3lock.service
