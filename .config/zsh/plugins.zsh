# Ensure XDG_CONFIG_HOME is set
: ${XDG_CONFIG_HOME:=$HOME/.config}

ZSH_PLUGINS="$XDG_CONFIG_HOME/zsh/plugins"

# Plugin list (path relative to $ZSH_PLUGINS)
plugins=(
    zsh-autosuggestions/zsh-autosuggestions.zsh
    zsh-history-substring-search/zsh-history-substring-search.zsh
    # Syntax highlighting MUST be last
    zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
)

# Load plugins
for plugin in $plugins; do
    if [ -f "$ZSH_PLUGINS/$plugin" ]; then
        source "$ZSH_PLUGINS/$plugin"
    else
        echo "[dotfiles] Error: Plugin not found at $ZSH_PLUGINS/$plugin"
    fi
done
