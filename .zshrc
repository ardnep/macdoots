# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/Library/Android/sdk/tools/bin"

export PATH="$PATH:$HOME/dev/flutter/bin"
export PATH="$PATH:$HOME/.config/emacs/bin/"
export PATH="$PATH:$(yarn global bin)"
export PATH="$PATH:$HOME/scripts/"

export EDITOR=nvim

ZSH_THEME="bira"

plugins=(
	git
	vi-mode
	zsh-autosuggestions
	zsh-syntax-highlighting
)

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh

# Aliases
alias f="yazi"
alias ls="eza"
alias cat="bat"
alias t="tmux"
alias ta="tmux attach"

# Key bindings
bindkey -s '\es' '^asudo ^e'
bindkey -s '\eg' '^agit ^e'
bindkey -s '\ec' '^asource ^e'
bindkey -M viins jj vi-cmd-mode
bindkey -M vicmd 'k' up-line-or-beginning-search
bindkey -M vicmd 'j' down-line-or-beginning-search

# VI Mode Settings
VI_MODE_SET_CURSOR=true
MODE_INDICATOR="%F{white}N%f"

eval "$(fnm env --use-on-cd --shell zsh)"

. "$HOME/.cargo/env"

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

zle -N y
bindkey '^F' y
