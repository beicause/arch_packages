#!/bin/bash
# pacman -Qqem > aur.txt
cat aur.txt | xargs yay -S --needed --noconfirm
