# Use the bindkey command to list all keyboard shortcuts in zsh
# To find the code of a key, execute cat, press enter, press the key, then Ctrl+C
bindkey "^[[H"    beginning-of-line  # Home
bindkey "^[[F"    end-of-line        # End
bindkey "^[[3~"   delete-char        # Delete
bindkey "^[[1;5D" backward-word      # Ctrl+Left
bindkey "^[[1;5C" forward-word       # Ctrl+Right
bindkey "^[[3;5~" kill-word          # Ctrl+Delete
bindkey "^H"      backward-kill-word # Ctrl+Backspace
