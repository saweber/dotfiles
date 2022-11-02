if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



# For pasting into zsh - turns off bracketed-paste-magic and url-quote-magic
# export DISABLE_MAGIC_FUNCTIONS=true

# zsh autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7f7f7f"
# For pasting into zsh - disable autosuggest for large pastes
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# zsh syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# loads completions
fpathCompletions="$(brew --prefix)/share/zsh-completions/src:/Users/$USER/.zsh:/home/$USER/.zsh"
if ! grep -q "$fpathCompletions" <<< "$FPATH"; then
  FPATH="$FPATH:$fpathCompletions";
fi
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# kubectl completions and alias
if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
  alias k="kubectl"
fi

# add krew to path
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# kubectl default editor
export KUBE_EDITOR="nvim"

cm-logs () {
   # Namespace can be overridden by adding another -n
   kubectl logs -l app=cost-analyzer -c cost-model --tail=-1 -n kubecost $@
}

# aws cli completions
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  complete -C "/usr/bin/aws_completer" aws
else
  complete -C "$(brew --prefix)/bin/aws_completer" aws
fi

# switch aws profiles
alias awsp='export AWS_PROFILE=$(aws configure list-profiles | fzf)'

# aws cli shortcut for working with localstack
# alias awsls="aws --endpoint-url=http://localhost:4566"

# git completions
compdef git gitk

# for using gpg to sign git commits
if [[ "$OSTYPE" == "darwin"* ]]; then
  export GPG_TTY=$(tty)
fi

# goto directory
g() {
  cd $(find ~ ~/src ~/go/src ~/src/kubecost ~/src/kubecost/cost-model -maxdepth 1 -type d | grep -v "/\." | fzf);
}

zle -N g g
bindkey -s '^g' 'g\n'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# go
export GOHOME="$HOME/go"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export GOPRIVATE="github.com"
PATH="$GOBIN:$PATH"

# credentials
source ~/.credentials

# cli aliases
alias vim="nvim"
alias cht="cht.sh"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi

# powerlevel10k theme
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# use volta for node, yarn
export VOLTA_HOME="$HOME/.volta"
PATH="$VOLTA_HOME/bin:$PATH"

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

# The next line enables shell command completion for brew installed gcloud.
if [ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

# The next line enables shell command completion for apt-get installed gcloud.
if [ -f '/usr/share/google-cloud-sdk/completion.zsh.inc' ]; then 
  source '/usr/share/google-cloud-sdk/completion.zsh.inc'
fi
