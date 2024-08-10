#!/bin/bash
pacman -Qqen > pacman.txt
cat pacman.txt
# pacman -S --needed - < ./pacman.txt
