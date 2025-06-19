if status is-interactive

    if test "$TERM_PROGRAM" = WezTerm
        tmux
        commandline -f repaint
    end

    set -U fish_greeting # set greeting to empty

    fish_add_path $HOME/src/bin/ $HOME/.local/bin /opt/homebrew/bin/ /home/linuxbrew/.linuxbrew/bin $HOME/go/bin $HOME/.local/bin $HOME/.lmstudio/bin
    if status --is-login
        if test -d /home/linuxbrew/.linuxbrew/
            eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        end
        if test -d /opt/homebrew/
            eval (/opt/homebrew/bin/brew shellenv)
        end
    end

    if test -d /home/linuxbrew/.linuxbrew/share/fish/vendor_completions.d
        set -gx fish_complete_path $fish_complete_path /home/linuxbrew/.linuxbrew/share/fish/vendor_completions.d
    end

    if test -d /opt/homebrew/share/fish/vendor_completions.d
        set -gx fish_complete_path $fish_complete_path /opt/homebrew/share/fish/vendor_completions.d
    end

    set -gx EDITOR nvim
    alias vim="nvim"

    function kubectl
        kubecolor $argv
    end

    # kubectl aliases
    abbr --add --position command k kubectl
    alias kctx="kubectl ctx"
    alias kns="kubectl ns"
    alias kd="kubctl describe"
    alias kg="kubectl get"
    alias kl="kubectl logs"
    # alias kgc="~/src/kgc/kgc.sh"

    # telepresence aliases
    alias tc="telepresence connect"
    alias tq="telepresence quit"

    # git aliases
    alias ga="git add"
    alias gcm="git commit -m"
    alias gd="git diff"
    alias gdc="git diff --cached"
    alias gs="git status"

    # Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
    #complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
    #alias awsp='export AWS_PROFILE=$(aws configure list-profiles | fzf)' # switch aws profiles
    # alias awsls="aws --endpoint-url=http://localhost:4566" # aws cli shortcut for working with localstack

    function gcp
        set -l project (gcloud projects list --format="value(projectId)" | fzf)

        if test -n "$project"
            gcloud config set project "$project"
            echo "Switched to project: $project"
        end
    end

    # node
    fish_add_path -m $HOME/.volta/bin/ # ensure volta is checked before homebrew

    # copilot
    alias suggest='gh copilot suggest'
    alias explain='gh copilot explain'

    # go
    set -gx GO111MODULE on
    set -gx GOHOME $HOME/go
    set -gx GOPROXY 'https://us-central1-go.pkg.dev/hailtrace-host-project/go-packages,https://proxy.golang.org,direct'
    set -gx GONOPROXY none
    set -gx GOPRIVATE 'hailtrace.com/*'

    alias gref='GOPROXY=proxy.golang.org go run github.com/GoogleCloudPlatform/artifact-registry-go-tools/cmd/auth@v0.4.0 refresh'

    # python
    set -gx PYENV_ROOT "$HOME/.pyenv"
    fish_add_path $PYENV_ROOT/bin $PYENV_ROOT/shims

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

    function envfile
        set filename ".env"
        if test (count $argv) -ge 1
            set filename $argv[1]
        end

        if not test -f $filename
            echo "File '$filename' does not exist"
            return 1
        end

        for line in (cat $filename | grep -v '^\s*#' | grep -v '^\s*$')
            set item (string split -m 1 '=' $line)
            if test (count $item) -eq 2
                set -gx $item[1] $item[2]
            end
        end
    end

    alias gorefresh='GOPROXY=proxy.golang.org go run github.com/GoogleCloudPlatform/artifact-registry-go-tools/cmd/auth@v0.4.0 refresh'

    #if test -f "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc"
    #    source "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc"
    #end

    set -gx VOLTA_HOME "$HOME/.volta"

    zoxide init fish | source
    alias cd="z"

    alias ls="eza"

    starship init fish | source
    enable_transience # transient prompt for starship
end
