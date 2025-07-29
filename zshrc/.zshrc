# export PATH="/opt/homebrew/bin:$PATH"


export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
zstyle ':omz:update' mode auto
COMPLETION_WAITING_DOTS="true"
plugins=(zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias ll="ls -la"
alias cl="clear"
alias path='echo -e ${PATH//:/\\n}'
alias gs='git status'
alias gl='git log'
alias hs='hg status'

bindkey '^ ' autosuggest-accept
prompt_context() {}
source /etc/bash_completion.d/hgd
