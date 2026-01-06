# Guard: interactive shells only
[[ $- != *i* ]] && return

# Load env
source ~/.config/zsh/env.zsh

# --------------------
# History
# --------------------
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY

# --------------------
# Options
# --------------------
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP

# --------------------
# Completion
# --------------------
autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# --------------------
# Plugins
# --------------------
source ~/.config/zsh/plugins.zsh

# --------------------
# Keybindings
# --------------------
source ~/.config/zsh/keybinds.zsh

# --------------------
# Aliases
# --------------------
source ~/.config/zsh/aliases.zsh

# --------------------
# Tools
# --------------------
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

# --------------------
# Functions
# --------------------
mkcd() { mkdir -p "$1" && cd "$1" }

# --------------------
# Prompt
# --------------------
eval "$(starship init zsh)"
