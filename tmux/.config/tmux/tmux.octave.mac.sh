#!/bin/zsh
# -d flags prevents tmux from attaching the new session
# -s sets the session name
# -t sets the target window
tmux new-session -d -s OctaveIDE 'nvim'
tmux split-window -h -p 40 '/opt/homebrew/bin/octave --no-gui'
tmux attach-session -t OctaveIDE
