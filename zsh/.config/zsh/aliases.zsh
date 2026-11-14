alias v="nvim"
alias cp="cp -iv"
alias mv="mv -iv"
alias du="du -h"
alias tm="tmux new -A -s main"
alias empty="find . -empty -type d -not -path '*/.git*' -not -path '*/.stfolder'"

alias s="~/Mirko/sync_script/backup.sh"

alias cigla='ssh cigla'
alias malina='ssh malina'
alias oblak='ssh oblak'
alias oblak-tailscale='ssh oblak-tailscale'
alias scigla="sftp mirko@100.118.233.99"

alias ds="dropbox status"

alias yt="yt-dlp -f best"
alias ytl="yt-dlp -o \"%(playlist_index)s-%(title)s.%(ext)s\" -f best --ignore-errors"
alias ytf="yt-dlp -o '%(title)s.%(ext)s' -f best --no-overwrites --ignore-errors -a"
alias yta="yt-dlp -o '%(title)s.%(ext)s' --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail"
alias ytal="yt-dlp -o \"%(playlist_index)s-%(title)s.%(ext)s\" --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --ignore-errors"

if [[ $(uname) == "Darwin" ]]; then
    alias ls='eza -alh --group-directories-first --icons --git --header --time-style=long-iso --sort=modified --reverse'
else
    alias ls='eza -alh --group-directories-first --icons --git --header --time-style=long-iso --sort=modified --reverse'
fi

alias f2jpg="f2 -r '{x.cdt.YYYY}/{x.cdt.YYYY}-{x.cdt.MM}/{x.cdt.YYYY}-{x.cdt.MM}-{x.cdt.DD}-{x.cdt.hh}-{x.cdt.mm}-{x.cdt.ss}{ext.lw}' -F"
