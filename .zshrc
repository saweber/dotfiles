export PATH=/home/ubuntu/.linuxbrew/bin:/home/ubuntu/.pyenv/shims:/home/ubuntu/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export ZSH="/home/ubuntu/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  aws
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

bindkey '^ ' autosuggest-accept
bindkey '^H' backward-word
bindkey '^L' forward-word

# fix permissions issue
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh
source ~/.nvm_profile
source ~/.linuxbrew_profile
source ~/.pyenv_profile
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export EDITOR='vim'
export TERM=xterm-256color
export PYSPARK_PYTHON=python3
export PYSPARK_DRIVER_PYTHON=python3

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias python=python3
alias pip=pip3
alias keyme='export SSH_AUTH_SOCK=/tmp/ssh-agent-$USER-screen'

# # ssh / keyme block
# SOCK="/tmp/ssh-agent-$USER-screen"
# if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
# then
#   rm -f /tmp/ssh-agent-$USER-screen
#   ln -sf $SSH_AUTH_SOCK $SOCK
#   export SSH_AUTH_SOCK=$SOCK
# fi

