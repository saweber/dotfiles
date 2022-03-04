# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# For pasting into zsh - disable autosuggest for large pastes
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# For pasting into zsh - turns off bracketed-paste-magic and url-quote-magic
export DISABLE_MAGIC_FUNCTIONS=true

# zsh autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

# zsh syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh vi mode
source $(brew --prefix)/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# loads completions
fpathCompletions="$(brew --prefix)/share/zsh-completions/src:/Users/$USER/.zsh:/home/$USER/.zsh"
if ! grep -q "$fpathCompletions" <<< "$FPATH"; then
  FPATH="$FPATH:$fpathCompletions";
fi
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# kubectl completions
if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
  alias k="kubectl"
fi

# aws cli completions
complete -C "$(brew --prefix)/bin/aws_completer" aws

# switch aws profiles
alias awsd="export AWS_PROFILE=dev"
alias awsq="export AWS_PROFILE=qa"
alias awsp="export AWS_PROFILE=prod"
alias awss="export AWS_PROFILE=sandbox"
alias awst="export AWS_PROFILE=test"

# git completions
compdef git gitk

#goto directory
g() {
  cd $(find ~ ~/src ~/go/src -maxdepth 1 -type d | grep -v "/\." | fzf);
}

# zsh-vi-mode overwrites bindings, must wait until after init
function zvm_after_init() {
  # fzf
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  zvm_bindkey viins '^@' autosuggest-accept

  zle -N g g
  bindkey -s '^g' 'g\n'
  bindkey -s '^t' '~/tmux-sessionizer.sh\n'
}

# go
export GOHOME="$HOME/go"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export GOPRIVATE="scm.bluebeam.com"

PATH="$GOBIN:$PATH"

# credentials
export AWS_PROFILE="sandbox"
source ~/.credentials

# cli aliases
alias vim="nvim"
alias token="go run ~/src/rover/token-client/main.go | pbcopy"
alias cht="cht.sh"
alias npm="pnpm"

# powerlevel10k theme
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export VOLTA_HOME="$HOME/.volta"

PATH="$VOLTA_HOME/bin:$PATH"

