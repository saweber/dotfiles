export ZSH="/Users/sweber/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

ZSH_AUTOSUGGEST_STRATEGY=(
  history
  completion
)

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  aws
  docker
  dotnet
  git
  osx
  node
  npm
  nvm
  sudo
  vi-mode
  wd
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source ~/.nvm_profile
source ~/.credentials

bindkey '^ ' autosuggest-accept

ssh-add -K ~/.ssh/bluebeam_mac

export CONNECTION_STRING=Host=localhost;Port=1433;Database=master;Username=sa;Password=Testing1!;

# so colors work in tmux
export TERM=xterm-256color

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# powerlevel10k - To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# starship theme
# eval "$(starship init zsh)"
