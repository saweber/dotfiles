if status is-interactive

    if test $TERM_PROGRAM = WezTerm
        tmux
        commandline -f repaint
    end

    # Don't need this anymore? - for tmux italics on MacOS
    # switch (uname)
    #     case Darwin
    #         set TERMINFO /usr/share/terminfo/
    #         set TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo
    # end

    fish_add_path $HOME/src/bin/ $HOME/.local/bin /opt/homebrew/bin/ $HOME/go/bin $HOME/.local/bin

    set EDITOR nvim
    alias vim="nvim"

    alias k="kubectl"
    fish_add_path $HOME/.krew/bin
    alias kubectx="kubectl ctx"
    alias kubens="kubectl ns"

    set AWS_PROFILE default
    alias awsp='export AWS_PROFILE=$(aws configure list-profiles | fzf)' # switch aws profiles
    # alias awsls="aws --endpoint-url=http://localhost:4566" # aws cli shortcut for working with localstack

    # set GO111MODULE on
    # set GOHOME $HOME/go
    # set GOPATH $HOME/go
    # set GOBIN $GOPATH/bin
    set GOPRIVATE github.com

    source ~/.credentials

    function dark
        set -gx TERM_PROFILE Dark
        set FZF_DEFAULT_OPTS '--color=bg+:#37343a,bg:#2d2a2e,border:#848089,spinner:#e5c463,hl:#9ecd6f,fg:#e3e1e4,header:#7accd7,info:#e5c463,pointer:#7accd7,marker:#7accd7,fg+:#e3e1e4,prompt:#f85e84,hl+:#9ecd6f --height=80% --layout=reverse --info=inline --border --margin=1 --padding=1'
    end
    function light
        set -gx TERM_PROFILE Terminal
        set FZF_DEFAULT_OPTS '--color=bg+:#D9D9D9,bg:#E1E1E1,border:#C8C8C8,spinner:#719899,hl:#719872,fg:#616161,header:#719872,info:#727100,pointer:#E12672,marker:#E17899,fg+:#616161,preview-bg:#D9D9D9,prompt:#0099BD,hl+:#719899 --height=80% --layout=reverse --info=inline --border --margin=1 --padding=1'
    end

    function theme
        switch (uname)
            case Darwin
                set -l val (defaults read -g AppleInterfaceStyle 2>/dev/null)
                if test "$val" = Dark
                    dark
                else
                    light
                end
            case "*"
                dark
        end
    end
    theme

    function goto
        cd (find ~ ~/src ~/go/src ~/src/kubecost -maxdepth 1 -type d | grep -v "/\." | sort -u | fzf)
    end
    bind \cg "goto; commandline -f repaint"

    # cht.sh
    function cht
        cht.sh $argv | bat -p
    end

    # starship init fish | source
end

# fish vi mode is weird - does not work with numbers, breaks a lot of keybindings
#function fish_user_key_bindings
# Execute this once per mode that emacs bindings should be used in
# fish_default_key_bindings -M insert

# Then execute the vi-bindings so they take precedence when there's a conflict.
# Without --no-erase fish_vi_key_bindings will default to
# resetting all bindings.
# The argument specifies the initial mode (insert, "default" or visual).
# fish_vi_key_bindings --no-erase insert
# end
