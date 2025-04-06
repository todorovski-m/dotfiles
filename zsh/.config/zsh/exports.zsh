export EDITOR="nvim"
export TERMINAL="kitty"

export PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"
export PATH="/usr/local/MATLAB/R2016b/bin:$PATH"
export PATH="/usr/local/MATLAB/R2016b/bin/glnxa64:$PATH"
export PATH="/usr/local/lib/nodejs/node-v12.16.3/bin:$PATH"
export PATH="/home/mirko/.local/bin:$PATH"
export LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH
export FC=gfortran
if [[ $(uname) == "Darwin" ]]; then
  export PATH=$PATH:/Applications/MEGAcmd.app/Contents/MacOS:/opt/homebrew/bin
  export PATH="/Volumes/MacApps/CPLEX_Studio_Community2211/cplex/bin/arm64_osx:$PATH"
  export CPLUS_INCLUDE_PATH="/Users/mirko/Documents/eigen-3.4.0":$CPLUS_INCLUDE_PATH
  export CPLUS_INCLUDE_PATH="/Users/mirko/Documents/nlohmann-json":$CPLUS_INCLUDE_PATH
fi

stty -ixon

export SANE_USB_WORKAROUND=1
