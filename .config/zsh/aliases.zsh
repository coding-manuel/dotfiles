# --------------------
# Core Aliases
# --------------------
alias ls='eza --icons --group-directories-first'
alias ll='eza -lh --git'
alias la='eza -lah --git'
alias cat='bat'
alias grep='rg'
alias vim='nvim'
alias vi='nvim'

# --------------------
# Navigation
# --------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# --------------------
# Git
# --------------------
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gc='git commit -m'
alias gca='git commit -am'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias glog='git log --oneline --graph --decorate --all'

# Lazygit
alias lg='lazygit'

# --------------------
# Mac Utilities
# --------------------
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias showhidden='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
