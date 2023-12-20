# FIXMES
# fzf
# default to tmux
# PATH var
# theme switching
# remap autosuggest to ctrl space?
# editor nvim
# krew
# alias k
# source credentials
# aws profile
# awsp
# go env vars
# pbcopy / paste
# goto dir / ctrl g
# completions
if status is-interactive
    # Commands to run in interactive sessions can go here
    alias vim="nvim"
    alias k="kubectl"

    # cht.sh
    function cht
        cht.sh $argv | bat -p
    end
    #starship init fish | source
end

# fish vi mode is weird - does not work with numbers, breaks a lot of keybindings
#function fish_user_key_bindings
# Execute this once per mode that emacs bindings should be used in
#fish_default_key_bindings -M insert

# Then execute the vi-bindings so they take precedence when there's a conflict.
# Without --no-erase fish_vi_key_bindings will default to
# resetting all bindings.
# The argument specifies the initial mode (insert, "default" or visual).
#fish_vi_key_bindings --no-erase insert
#end
