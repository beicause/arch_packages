#!/bin/bash
# pacman -Qqen > pacman.txt
pacman -S --needed - < ./pacman.txt
