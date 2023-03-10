# !/bin/bash
# https://dev.to/mafflerbach/use-pass-and-rofi-to-get-a-fancy-password-manager-2k37

shopt -s nullglob globstar

# switch for autotyping
typeit=0
if [[ $1 == "--type" ]]; then
    typeit=1
    shift
fi

# get all the saved password files
prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

# shows a list of all password files and saved the selected one in a variable
password=$(printf '%s\n' "${password_files[@]}" | rofi -dmenu "$@" -theme $HOME/.config/rofi/themes/spotlight.rasi)
[[ -n $password ]] || exit

# pass -c copies the password on the clipboard, while the additional output from pass is piped in to /dev/null
if [[ $typeit -eq 0 ]]; then
    pass show -c "$password" | head -n1  2>/dev/null
else
    # If we want to use autotype we save the user name and the password in variables
    # The actual password files are simple text files: the password has to be on the first line
    passw=$(pass show $password | head -n1)
    uname=$(pass show $password | grep login: | awk '{print $2}')
    # xdotool types the username on the active spot (cli or inputfield from a browser)
    xdotool type "$uname"
    # type a TAB (for moving forward in browser input fields)
    xdotool key Tab
    # type the password in the active input
    xdotool type "$passw"
    xdotool key Tab
fi
