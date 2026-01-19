# install https://github.com/zap-zsh/zap
# install https://starship.rs

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt sharehistory
setopt extendedhistory
setopt hist_ignore_all_dups # do not save duplicate commands to history
setopt hist_find_no_dups # do not find duplicate command when searching

# load and unload environment variables depending on the current directory (.envrc)
eval "$(direnv hook zsh)"

# plugins
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"

compinit

# source
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/exports.zsh
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
    source $HOME/.config/zsh/keys.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

open_file_manager() {
    if [[ $(uname) == "Darwin" ]]; then
        open .
    else
        nohup xdg-open . > /dev/null 2>&1 & disown
    fi
}

# define widgets from function of the same name
zle -N open_file_manager

# bind widgets to keys
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
    bindkey "^J" open_file_manager
fi

function o () {
    nohup xdg-open "$@" > /dev/null 2>&1 & disown
}

# https://unix.stackexchange.com/questions/32508/how-can-i-open-a-new-terminal-in-the-same-directory-of-the-last-used-one-from-a
# save path on cd
function cd {
    builtin cd $@
    pwd > ~/.last_dir
}
# restore last saved path
if [ -f ~/.last_dir ]; then
    last_dir=$(cat ~/.last_dir)
    # cd "$last_dir"
fi

eval "$(starship init zsh)"

# source /home/mirko/.config/broot/launcher/bash/br

if [ -f ~/.private_env_vars ]; then
    source ~/.private_env_vars
fi

# Initialize pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init - zsh)"
# eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.pyenv/versions/3.10.16/bin:$PATH"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval "$(zoxide init zsh)"



. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

# Added by Antigravity
export PATH="/Users/mirko/.antigravity/antigravity/bin:$PATH"
