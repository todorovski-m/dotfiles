export EDITOR="nvim"
export TERMINAL="kitty"

PATH=$PATH:/opt/ibm/ILOG/CPLEX_Studio128/cplex/bin/x86-64_linux:/opt/ibm/ILOG/CPLEX_Studio128/opl/oplide:/opt/gams/gams25.1_linux_x64_64_sfx:/home/mirko/programs/mosek/8/tools/platform/linux64x86/bin
export PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"
export PATH="/usr/local/MATLAB/R2016b/bin:$PATH"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages"
export PATH="/home/mirko/anaconda3/bin:$PATH"  # commented out by conda initialize
export PATH="/usr/local/lib/nodejs/node-v12.16.3/bin:$PATH"
export PATH="$PATH:/home/mirko/programs/julia-1.8.4/bin"
export PATH="$PATH:/home/mirko/.emacs.d/bin"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/mirko/programs/gurobi902/linux64/lib
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export PATH="/home/mirko/.local/bin:$PATH"
export PATH="/usr/local/MATLAB/R2016b/bin/glnxa64:$PATH"

stty -ixon

export SANE_USB_WORKAROUND=1

PATH="/home/mirko/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/mirko/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/mirko/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/mirko/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/mirko/perl5"; export PERL_MM_OPT;
