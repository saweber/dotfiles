export ZSH="/Users/sweber/.oh-my-zsh"

# Otherwise no autocompletions
ZSH_AUTOSUGGEST_STRATEGY=(
  history
  completion
)

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# oh-my-zsh managed
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
)

source $ZSH/oh-my-zsh.sh

# homebrew managed
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

source ~/.nvm_profile
source ~/.credentials

bindkey '^ ' autosuggest-accept

ssh-add -K ~/.ssh/bluebeam_mac

export CONNECTION_STRING=Host=localhost;Port=1433;Database=master;Username=sa;Password=Testing1!;

# for tmux colors
export TERM=xterm-256color

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm

# powerlevel10k - To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# starship theme
# eval "$(starship init zsh)"
