export PATH="$HOME/.local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
zstyle ':omz:update' mode auto
COMPLETION_WAITING_DOTS="true"
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt share_history

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias ll="ls -la"
alias cl="clear"

# Source local / machine-specific configuration if present (kept out of public git)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

bindkey '^ ' autosuggest-accept
prompt_context() {}
