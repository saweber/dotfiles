if status is-interactive
    set -U fish_greeting # set greeting to empty

    fish_add_path $HOME/.local/bin

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

    function nvidia-flatpak-sync
        set driver_ver (rpm -q xorg-x11-drv-nvidia --queryformat '%{VERSION}\n')
        set flatpak_ver (string replace -a '.' '-' $driver_ver)
        echo "Driver: $driver_ver → installing GL extension $flatpak_ver"
        flatpak install -y flathub org.freedesktop.Platform.GL.nvidia-$flatpak_ver
        flatpak install -y flathub org.freedesktop.Platform.GL32.nvidia-$flatpak_ver
    end

    # override default cli commands
    zoxide init fish | source
    alias cd="z"
    alias ls="eza"
    set -gx EDITOR nvim
    alias vim="nvim"
    alias zed="flatpak run dev.zed.Zed"

    # Commands to run in interactive sessions can go here
    mise activate fish | source

    starship init fish | source
    enable_transience # transient prompt for starship
end
