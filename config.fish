if status is-interactive

    if test $TERM_PROGRAM = WezTerm
        tmux
        commandline -f repaint
    end

    set -U fish_greeting # set greeting to empty

    fish_add_path $HOME/src/bin/ $HOME/.local/bin /opt/homebrew/bin/ /home/linuxbrew/.linuxbrew/bin $HOME/go/bin $HOME/.local/bin $HOME/.krew/bin

    set -gx EDITOR nvim
    alias vim="nvim"

    function kubectl
        kubecolor $argv
    end

    abbr --add --position command k kubectl
    alias kctx="kubectl ctx"
    alias kns="kubectl ns"
    alias kd="kubctl describe"
    alias kg="kubectl get"
    alias kl="kubectl logs"
    # alias kgc="~/src/kgc/kgc.sh"

    # Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
    complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
    alias awsp='export AWS_PROFILE=$(aws configure list-profiles | fzf)' # switch aws profiles
    # alias awsls="aws --endpoint-url=http://localhost:4566" # aws cli shortcut for working with localstack

    # depot does not install to a standard directory
    set DEPOT_INSTALL_DIR /home/steven/.depot/bin
    fish_add_path $DEPOT_INSTALL_DIR

    set -gx GO111MODULE on
    # set GOHOME $HOME/go
    # set GOPATH $HOME/go
    # set GOBIN $GOPATH/bin
    set -gx GOPRIVATE github.com

    # source ~/.credentials

    function dark
        set -gx TERM_PROFILE Dark
        set -gx FZF_DEFAULT_OPTS '--color=bg+:#37343a,bg:#2d2a2e,border:#848089,spinner:#e5c463,hl:#9ecd6f,fg:#e3e1e4,header:#7accd7,info:#e5c463,pointer:#7accd7,marker:#7accd7,fg+:#e3e1e4,prompt:#f85e84,hl+:#9ecd6f --height=80% --layout=reverse --info=inline --border --margin=1 --padding=1'
    end

    function light
        set -gx TERM_PROFILE Terminal
        set -gx FZF_DEFAULT_OPTS '--color=bg+:#D9D9D9,bg:#E1E1E1,border:#C8C8C8,spinner:#719899,hl:#719872,fg:#616161,header:#719872,info:#727100,pointer:#E12672,marker:#E17899,fg+:#616161,preview-bg:#D9D9D9,prompt:#0099BD,hl+:#719899 --height=80% --layout=reverse --info=inline --border --margin=1 --padding=1'
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
        cd (find ~ ~/src ~/go/src -maxdepth 1 -type d | grep -v "/\." | sort -u | fzf)
    end
    bind \cg "goto; commandline -f repaint"

    function cht
        cht.sh $argv | bat -p
    end

    # starship init fish | source
end
