# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Editors
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

# PATH
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Starship Config
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# FZF
if command -v rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
