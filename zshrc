# Custom generated infocmp color file; see links in README - this is to get italics working inside of tmux
export TERMINFO='/usr/share/terminfo/'
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo
# open tmux by default
if [ "$TMUX" = "" ]; then tmux; fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
fi

# powerlevel10k theme
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# linux - ensure that Ctrl-Left Arrow and Ctrl-Right Arrow navigate by word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# linux - does not save history by default
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# For pasting into zsh - turns off bracketed-paste-magic and url-quote-magic
# export DISABLE_MAGIC_FUNCTIONS=true

# credentials
# source ~/.credentials

# zsh autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7f7f7f"
# For pasting into zsh - disable autosuggest for large pastes
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# zsh syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# use bat to highlight man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# add krew to path
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# kubectl default editor
export KUBE_EDITOR="nvim"
alias k="kubectl"

# use default aws profile - for p10k prompt
export AWS_PROFILE="default"
# switch aws profiles
alias awsp='export AWS_PROFILE=$(aws configure list-profiles | fzf)'
# aws cli shortcut for working with localstack
# alias awsls="aws --endpoint-url=http://localhost:4566"

# go
export GOHOME="$HOME/go"
export GOPATH="$HOME/go:$HOME/src"
export GOBIN="$GOPATH/bin"
export GOPRIVATE="github.com"
PATH="$GOBIN:$PATH"

# aliases
alias vim="nvim"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi
# goto directory
g() {
  cd $(find ~ ~/src ~/go/src ~/src/kubecost -maxdepth 1 -type d | grep -v "/\." | sort -u | fzf);
}
zle -N g g
bindkey -s '^g' 'g\n'

# override profile to dark based on OS setting - for syncing vim
if [[ "$OSTYPE" == "darwin"* ]]; then

  i() {
    if [[ $ITERM_PROFILE == "Dark" ]]; then
      export ITERM_PROFILE="Terminal"
    else
      export ITERM_PROFILE="Dark"
    fi
  }

  dark() {
    val=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
    if [[ $val == "Dark" ]]; then
      i
    fi
  }
  
  dark
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

# Completions start
# before re-enabling, check that we need something from zsh-completions
# zsh-completions plugin completions
# fpathCompletions="$(brew --prefix)/share/zsh-completions/src:/Users/$USER/.zsh:/home/$USER/.zsh"
fpathCompletions="/Users/$USER/.zsh:/home/$USER/.zsh"
if ! grep -q "$fpathCompletions" <<< "$FPATH"; then
  FPATH="$FPATH:$fpathCompletions";
fi
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# aws completions
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  complete -C "/usr/bin/aws_completer" aws
else
  complete -C "$(brew --prefix)/bin/aws_completer" aws
fi

# gcloud completions
if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
elif [ -f '/usr/share/google-cloud-sdk/completion.zsh.inc' ]; then 
  source '/usr/share/google-cloud-sdk/completion.zsh.inc'
fi

# kubectl completions
if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
fi

# git completions
compdef git gitk
# Completions end
