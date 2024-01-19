#!/bin/bash

# Get user selection via fzf from greek.txt file.
chosen=$(cat ~/.config/greek/greek.txt | fzf | sed "s/ .*//")

# Exit if none chosen.
[ -z "$chosen" ] && exit

printf "$chosen" | pbcopy
