# Custom generated infocmp color file; see links in README - this is to get italics working inside of tmux
export TERMINFO='/usr/share/terminfo/'
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo

# open tmux by default - if not already open or in IntelliJ
if [ "$TMUX" = "" ] && [ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]; then tmux; fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  PATH="$PATH:/home/linuxbrew/.linuxbrew/bin:/home/$USER/.local/bin"
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  PATH="$PATH:/Users/$USER/.local/bin"
fi

# powerlevel10k theme
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function zvm_after_init() {
  # fzf goes here, otherwise fzf for history search does not work
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  export FZF_DEFAULT_OPTS='--color=bg+:#37343a,bg:#2d2a2e,border:#848089,spinner:#e5c463,hl:#9ecd6f,fg:#e3e1e4,header:#7accd7,info:#e5c463,pointer:#7accd7,marker:#7accd7,fg+:#e3e1e4,prompt:#f85e84,hl+:#9ecd6f --height=80% --layout=reverse --info=inline --border --margin=1 --padding=1'

  zvm_bindkey viins '^@' autosuggest-accept
  bindkey '^ ' autosuggest-accept

  zle -N g g
  bindkey -s '^g' 'g\n'

  # linux - ensure that Ctrl-Left Arrow and Ctrl-Right Arrow navigate by word
  bindkey "^[[1;5C" forward-word
  bindkey "^[[1;5D" backward-word
}

# linux - does not save history by default
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# For pasting into zsh - turns off bracketed-paste-magic and url-quote-magic
# export DISABLE_MAGIC_FUNCTIONS=true

# load secure credentials
source ~/.credentials

# zsh autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7f7f7f"
# For pasting into zsh - disable autosuggest for large pastes
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# zsh syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh vi mode
source $(brew --prefix)/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# use bat to highlight man pages
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export MANPAGER="sh -c 'bat -l man -p'" # partial fix for AWS docs
# export MANROFFOPT="-c"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export KUBE_EDITOR="nvim"
alias k="kubectl"

export AWS_PROFILE="default"
alias awsp='export AWS_PROFILE=$(aws configure list-profiles | fzf)' # switch aws profiles
# aws cli shortcut for working with localstack
# alias awsls="aws --endpoint-url=http://localhost:4566"

# go
export GOHOME="$HOME/go"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export GOPRIVATE="github.com"
export GO111MODULE="on"
PATH="$GOBIN:$PATH"

# aliases
alias vim="nvim"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi

# goto directory
g() {
  cd $(find ~ ~/src ~/go/src ~/src/kubecost ~/src/waterfowl -maxdepth 1 -type d | grep -v "/\." | sort -u | fzf);
}
zle -N g g
bindkey -s '^g' 'g\n'

# for using MacOS dark/light theme to control nvim
if [[ "$OSTYPE" == "darwin"* ]]; then
  theme() {
    val=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
    if [[ $val == "Dark" ]]; then
      export ITERM_PROFILE="Dark"
      export FZF_DEFAULT_OPTS='--color=bg+:#37343a,bg:#2d2a2e,border:#848089,spinner:#e5c463,hl:#9ecd6f,fg:#e3e1e4,header:#7accd7,info:#e5c463,pointer:#7accd7,marker:#7accd7,fg+:#e3e1e4,prompt:#f85e84,hl+:#9ecd6f --height=80% --layout=reverse --info=inline --border --margin=1 --padding=1'
    else
      export ITERM_PROFILE="Terminal"
      export FZF_DEFAULT_OPTS='--color=bg+:#D9D9D9,bg:#E1E1E1,border:#C8C8C8,spinner:#719899,hl:#719872,fg:#616161,header:#719872,info:#727100,pointer:#E12672,marker:#E17899,fg+:#616161,preview-bg:#D9D9D9,prompt:#0099BD,hl+:#719899 --height=80% --layout=reverse --info=inline --border --margin=1 --padding=1'
    fi
  }

  theme
fi

# get kcm logs
cm-logs () {
# Namespace can be overridden by adding another -n
kubectl logs -l app=cost-analyzer -c cost-model --tail=-1 -n kubecost $@
}

# cht.sh
cht() {
  cht.sh "$1" | bat -p
}

# use volta for node, yarn
export VOLTA_HOME="$HOME/.volta"
PATH="$VOLTA_HOME/bin:$PATH"

# for using gpg to sign git commits
if [[ "$OSTYPE" == "darwin"* ]]; then
  export GPG_TTY=$(tty)
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Completions
fpathCompletions="$(brew --prefix)/share/zsh/site-functions:/Users/$USER/.zsh:/home/$USER/.zsh"
if ! grep -q "$fpathCompletions" <<< "$FPATH"; then
  FPATH="$FPATH:$fpathCompletions";
fi
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# gcloud completions
if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
elif [ -f '/usr/share/google-cloud-sdk/completion.zsh.inc' ]; then
  source '/usr/share/google-cloud-sdk/completion.zsh.inc'
fi

if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# azure completions
if [ -f "$(brew --prefix)/etc/bash_completion.d/az" ]; then
  source "$(brew --prefix)/etc/bash_completion.d/az"
fi

