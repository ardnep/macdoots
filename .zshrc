# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/Library/Android/sdk/tools/bin"

export PATH="$PATH:$HOME/dev/flutter/bin"
export PATH="$PATH:$HOME/.config/emacs/bin/"
export PATH="$PATH:$HOME/scripts/"
export PATH="$PATH:$(yarn global bin)"

export EDITOR=nvim

ZSH_THEME="bira"

plugins=(
	git
	vi-mode
	zsh-autosuggestions
	zsh-syntax-highlighting
  bgnotify
)

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh

# Aliases
alias f="yazi"
alias ls="eza"
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
eval "$(direnv hook zsh)"
if [[ "$CLAUDECODE" != "1" ]]; then
    eval "$(zoxide init --cmd cd zsh)"
fi

. "$HOME/.local/bin/env"
source $HOME/.local/bin/env


# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "`fnm env`"
fi


# bun completions
[ -s "/Users/hypotenuseai/.bun/_bun" ] && source "/Users/hypotenuseai/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Added by Windsurf
export PATH="/Users/hypotenuseai/.codeium/windsurf/bin:$PATH"

# Added by Antigravity
export PATH="/Users/hypotenuseai/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity
export PATH="/Users/hypotenuseai/.antigravity/antigravity/bin:$PATH"

# Pi
export PATH="/Users/hypotenuseai/.local/share/fnm/node-versions/v22.20.0/installation/bin:$PATH"
