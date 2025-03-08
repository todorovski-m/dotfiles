export EDITOR="nvim"
export TERMINAL="kitty"

export PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"
export PATH="/usr/local/MATLAB/R2016b/bin:$PATH"
export PATH="/usr/local/MATLAB/R2016b/bin/glnxa64:$PATH"
export PATH="/usr/local/lib/nodejs/node-v12.16.3/bin:$PATH"
export PATH="/home/mirko/.local/bin:$PATH"
if [[ $(uname) == "Darwin" ]]; then
  export PATH=$PATH:/Applications/MEGAcmd.app/Contents/MacOS:/opt/homebrew/bin
fi

stty -ixon

export SANE_USB_WORKAROUND=1
