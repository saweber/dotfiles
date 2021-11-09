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

# homebrew managed zsh plugins
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# wd plugin
source /Users/${USER}/.zsh/wd/wd.plugin.zsh

# loads completions
export FPATH="/usr/local/share/zsh-completions:/usr/local/share/zsh/site-functions:/usr/share/zsh/site-functions:/usr/share/zsh/5.7.1/functions:$(brew --prefix)/share/zsh-completions/src:/Users/$USER/.zsh/wd:/Users/$USER/.zsh/docker:/Users/$USER/.zsh"
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# kubectl completions
source <(kubectl completion zsh)
alias k="kubectl"

# aws cli completions
complete -C '/usr/local/bin/aws_completer' aws

# git completions
compdef git gitk

# keybindings
bindkey '^ ' autosuggest-accept

# tmux colors
export TERM=xterm-256color

# go
export GOHOME="$HOME/go"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export GOPRIVATE="scm.bluebeam.com"

# credentials
export AWS_PROFILE="dev"
source ~/.credentials

# cli aliases
alias vim="nvim"
alias token="go run ~/src/rover/token-client/main.go | pbcopy"
alias cht="cht.sh"

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
