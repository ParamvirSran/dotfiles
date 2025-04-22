export PATH="/opt/homebrew/bin:$PATH"

export CONDA_PROMPT_MODIFIER=""
__conda_setup="$('/Users/parm/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/parm/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/parm/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/parm/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup


export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
CASE_SENSITIVE="true"
zstyle ':omz:update' mode auto     
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

alias vim="nvim"
alias ll="ls -la"
alias gs="git status"
alias gl="git log --oneline --graph --all"
alias cl="clear"
alias path='echo -e ${PATH//:/\\n}'
alias python='python3'
alias py='python3'

bindkey '^ ' autosuggest-accept
prompt_context() {}
