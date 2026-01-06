#!/bin/bash

# Colors for logging
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_info "Starting dotfiles installation..."

# 1. Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew is not installed. Please install it from https://brew.sh/"
    exit 1
fi

# 2. Install dependencies
log_info "Installing dependencies with Homebrew..."
brew install zsh eza bat ripgrep starship neovim fzf zoxide lazygit git-delta

# Optional: Install GUI apps via cask if desired
# brew install --cask wezterm

# 3. Install Zsh Plugins
log_info "Installing Zsh plugins..."

ZSH_PLUGINS_DIR="$HOME/.config/zsh/plugins"
mkdir -p "$ZSH_PLUGINS_DIR"

install_plugin() {
    local name=$1
    local repo=$2
    if [ ! -d "$ZSH_PLUGINS_DIR/$name" ]; then
        log_info "Cloning $name..."
        git clone --depth 1 "$repo" "$ZSH_PLUGINS_DIR/$name"
    else
        log_info "$name already installed."
    fi
}

install_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
install_plugin "zsh-history-substring-search" "https://github.com/zsh-users/zsh-history-substring-search"
install_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting"

# 4. Setup Zsh
CURRENT_SHELL=$(basename "$SHELL")
if [ "$CURRENT_SHELL" != "zsh" ]; then
    log_info "Changing default shell to zsh..."
    chsh -s $(which zsh)
else
    log_info "Default shell is already zsh."
fi

log_success "Installation complete! Please restart your terminal."
