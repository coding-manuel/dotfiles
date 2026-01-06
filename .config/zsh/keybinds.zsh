# --------------------
# Keybindings
# --------------------
bindkey -e

# History search (fixes broken arrows)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Ctrl+Arrow word jump
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Alt+. to insert last argument
bindkey '\e.' insert-last-word

# Alt+Arrow word jump
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word

# Alt+Backspace delete word
bindkey '^[^?' backward-kill-word
bindkey '^[\b' backward-kill-word

# --------------------
# FZF Integration
# --------------------
if command -v fzf &> /dev/null; then
  source <(fzf --zsh) 2>/dev/null || {
      # Fallback for older FZF versions or different installs
      [ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
      [ -f /usr/local/opt/fzf/shell/key-bindings.zsh ] && source /usr/local/opt/fzf/shell/key-bindings.zsh
  }
fi
