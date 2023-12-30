alias v="nvim"
alias f='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias cp="cp -iv"
alias mv="mv -iv"
alias s="~/Dropbox/Mirko/sync_script/my_sync.sh"
alias td="code ~/Dropbox/Mirko/todo/mirko.todo"
alias cigla="ssh mirko@mirkot.synology.me"
alias cigla-sshfs="sshfs mirko@mirkot.synology.me:/ /home/mirko/cigla"
alias samo-monitor="arandr ~/.screenlayout/samo-nadvoresen.sh"
alias gams-studio="~/programs/gams32.2_linux_x64_64_sfx/studio/studio.AppImage"
alias lampp="sudo /opt/lampp/manager-linux-x64.run"
alias find-oldest="find . -type f -printf '%T+ %p\n' | sort | head -n 1"
alias find-newest="find . -type f -printf '%T+ %p\n' | sort | tail -n 1"
alias isomount="sudo mount -t iso9660 -o ro,loop,noauto"
alias md-edit="~/programs/typora/Typora"
alias loto="python /home/mirko/Dropbox/Mirko/Razno/loto_analizator.py"
alias xdg-open="xdg-open &>/dev/null"
alias mouse="/home/mirko/Dropbox/Mirko/Razno/linux-settings/mousewheel.sh"
alias ds="dropbox status"
#alias femm="wine ~/.wine/drive_c/femm42/bin/femm.exe"
#alias ltspice="wine '/home/mirko/.wine/drive_c/Program Files/LTC/LTspiceXVII/XVIIx64.exe'"
alias yt="yt-dlp -f best"
alias ytl="yt-dlp -o \"%(playlist_index)s-%(title)s.%(ext)s\" -f best --ignore-errors"
alias ytf="yt-dlp -o '%(title)s.%(ext)s' -f best --no-overwrites --ignore-errors -a"
alias yta="yt-dlp -o '%(title)s.%(ext)s' --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail"
alias ytal="yt-dlp -o \"%(playlist_index)s-%(title)s.%(ext)s\" --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --ignore-errors"
alias mat="~/.config/tmux/tmux.matlab.sh"
alias oct="~/.config/tmux/tmux.octave.sh"
alias matm="~/.config/tmux/tmux.matlab.mac.sh"
alias octm="~/.config/tmux/tmux.octave.mac.sh"
alias pgn="python /home/mirko/Dropbox/Mirko/Razno/chess/html2pgn.py"
alias fen="python /home/mirko/Dropbox/Mirko/Razno/chess/html2fen.py"
alias chess-pgn="touch ~/Desktop/1.html && while inotifywait -e modify ~/Desktop/1.html; do pgn; done"
alias chess-fen="touch ~/Desktop/1.html && while inotifywait -e modify ~/Desktop/1.html; do fen; done"
alias chess-clear="rm -r ~/Desktop/1.pgn ~/Desktop/1.html ~/Desktop/1_files"
alias chess-book="xdg-open ~/win-data/knigi/chess/How\ to\ Beat\ Your\ Dad\ at\ Chess.pdf && scid"
alias restart-gui="sudo systemctl restart systemd-logind"
# https://openvpn.net/cloud-docs/openvpn-3-client-for-linux/
alias vpn-start="openvpn3 session-start --config /home/mirko/Dropbox/Mirko/Mirko_Todorovski.ovpn"
alias vpn-list="openvpn3 sessions-list"
alias vpn-stop="openvpn3 session-manage --config /home/mirko/Dropbox/Mirko/Mirko_Todorovski.ovpn --disconnect"
alias onedrive-mount="rclone --vfs-cache-mode writes mount \"onedrive\":  ~/onedrive "
alias scigla="sftp mirko@192.168.1.101"
alias kdenlive="/home/mirko/programs/kdenlive/kdenlive-21.04.0-x86_64.appimage"
alias jp="jupyter qtconsole"
alias ls="exa -al --color=always --group-directories-first --icons"
alias manim="conda activate manim"
alias studenti="python ~/Dropbox/Mirko/email_studenti.py"
alias pdf22="~/Dropbox/Mirko/pdf_2x2.sh"
alias wal-light="wal --theme ~/Dropbox/Mirko/Razno/editors/wal/light.json"
alias wal-dark="wal --theme ~/Dropbox/Mirko/Razno/editors/wal/dark.json"
alias for-init="source ~/programs/intel/oneapi/setvars.sh"
alias empty="find . -empty -type d -not -path '*/.git*' -not -path '*/.stfolder'"
alias checkupdates-yay="yay -Qum"
alias du="du -h"
