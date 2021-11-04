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

# plugins=(
#   docker
#   docker-compose
#   git
#   kubectl
#   node
#   npm
#   golang
#   yarn
# )

# export ZSH="/Users/$USER/.oh-my-zsh"
# source $ZSH/oh-my-zsh.sh

# homebrew managed zsh plugins
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# loads zsh-completions, aws completions
export FPATH="/usr/local/share/zsh-completions:/usr/local/share/zsh/site-functions:/usr/share/zsh/site-functions:/usr/share/zsh/5.7.1/functions:~/.zsh_plugins/wd"
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws

# wd plugin
wd() {
  . ~/.zsh_plugins/wd/wd.sh
}

# keybindings
bindkey '^ ' autosuggest-accept

# tmux colors
export TERM=xterm-256color

# go
export GOHOME="$HOME/go"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export GOPRIVATE="scm.bluebeam.com"

export AWS_PROFILE="dev"
source ~/.credentials

alias vim="nvim"
alias token="go run ~/src/rover/token-client/main.go | pbcopy"

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
