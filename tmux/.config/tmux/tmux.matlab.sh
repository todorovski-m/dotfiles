#!/usr/bin/zsh
# -d flags prevents tmux from attaching the new session
# -s sets the session name
# -t sets the target window
tmux new-session -d -s MatlabIDE 'nvim'
tmux split-window -h -p 40 '/usr/local/MATLAB/R2016b/bin/matlab -nodesktop'
tmux attach-session -t MatlabIDE
