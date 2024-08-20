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

# User configuration
export PATH="/Users/parm/go/bin:/opt/homebrew/bin:$PATH"
export working_dir="/Users/parm/Desktop/dev/onnx"
export MLIR_DIR="$working_dir/llvm-project/build/lib/cmake/mlir"

alias vim="~/nvim-macos-arm64/bin/nvim"
alias nvim="~/nvim-macos-arm64/bin/nvim"
alias ll="ls -la"
alias gs="git status"
alias gl="git log --oneline --graph --all"
alias cl='clear'
alias path='echo -e ${PATH//:/\\n}'
alias ports='netstat -tulanp'
alias python='python3'

prompt_context(){}
