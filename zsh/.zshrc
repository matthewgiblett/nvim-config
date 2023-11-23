if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.local/lib/oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_COMPDUMP="$XDG_CACH_HOME/zsh/zcompdump-$ZSH_VERSION"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[[ ! -f "$XDG_CONFIG_HOME"/zsh/.p10k.zsh ]] || source "$XDG_CONFIG_HOME"/zsh/.p10k.zsh


HISTSIZE=130000
SAVEHIST=100000
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export LESSHISTFILE=-
export PATH=/opt/homebrew/bin:$HOME/.local/bin:$NPM_CONFIG_PREFIX/bin:$XDG_DATA_HOME/nvim/mason/bin:$PATH
