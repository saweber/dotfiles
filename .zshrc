export ZSH="/Users/$USER/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
# For zsh-nvm - faster zsh loading
#export NVM_LAZY_LOAD=true
#export NVM_AUTO_USE=true
#export NVM_COMPLETION=true # too slow

# For pasting into zsh - disable autosuggest for large pastes
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# oh-my-zsh - for faster pasting - turns off bracketed-paste-magic and url-quote-magic
export DISABLE_MAGIC_FUNCTIONS=true

# oh-my-zsh managed zsh plugins
plugins=(
  # zsh-nvm # custom plugin
  aws
  docker
  docker-compose
  # dotnet
  git
  kubectl
  osx
  node
  npm
  # nvm
  sudo
  # vi-mode
  wd
  golang
  # python
)

source $ZSH/oh-my-zsh.sh

# homebrew managed zsh plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# homebrew zsh additional completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# keybindings
bindkey '^ ' autosuggest-accept
#bindkey '^b' backward-word
#bindkey '^f' forward-word
#bindkey '^j' backward-kill-line
#bindkey '^k' kill-line
#bindkey '^l' list-choices

# tmux colors
export TERM=xterm-256color

# starship theme
eval "$(starship init zsh)"

# nvm
#[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm

# jvm
# export GRADLE_HOME="$HOME/.gradle"

# begin android simulator
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools

# go
export GOHOME="$HOME/go"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export GOBIN="$GOPATH/bin"
export GOPRIVATE="scm.bluebeam.com"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export AWS_PROFILE="sandbox"
source ~/.credentials
