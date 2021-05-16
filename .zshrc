export ZSH="/Users/stevenweber/.oh-my-zsh"

plugins=(
  # zsh-nvm # custom plugin
  # aws
  # docker
  # docker-compose
  # dotnet
  git
  golang
  # osx
  # node
  # npm
  # nvm
  sudo
  # vi-mode
  wd
)

export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export DISABLE_MAGIC_FUNCTIONS=true

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export TERM=xterm-256color

bindkey '^ ' autosuggest-accept

source $ZSH/oh-my-zsh.sh
source ~/.credentials

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

eval "$(starship init zsh)"