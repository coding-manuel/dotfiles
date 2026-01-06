# dotfiles

**Minimal, fast, and feature-rich macOS dotfiles.**  
Optimized for developer productivity with a focus on speed, aesthetics, and keyboard-driven workflows.

## 🚀 Features

### **Shell (Zsh)**
- **Fast:** No heavy frameworks (like Oh My Zsh).
- **Plugins:** Autosuggestions, Syntax Highlighting, History Substring Search (managed via script).
- **Tools:**
  - **Starship:** Custom "pill-style" prompt with Docker, Package Version, and Git status.
  - **FZF:** Fuzzy find history (`Ctrl+R`) and files (`Ctrl+T`).
  - **Zoxide:** Smarter `cd` (e.g., `z dot` jumps to dotfiles).
  - **Lazygit:** Terminal UI for git (`lg`).
  - **Eza / Bat / Ripgrep:** Modern replacements for ls, cat, grep.

### **Terminal (WezTerm)**
- **Aesthetic:** Gruvbox Dark Hard theme, dynamic font resizing.
- **Power Features:**
  - Clickable hyperlinks (URLs, Emails).
  - Command Palette (`Ctrl+Shift+P`).
  - Huge scrollback (10k lines).

### **Window Manager (AeroSpace)**
- **Tiling:** i3-like manual tiling.
- **Aesthetics:** Gaps and borders (via JankyBorders integration).
- **Assignments:**
  - Workspace 1: Terminal
  - Workspace B: Browser
  - Workspace C: Chat
- **Apps:** Finder always floats.

### **Git**
- **Delta:** Syntax highlighting for git diffs.
- **Aliases:** `gco`, `gst`, `gl`, `gp` etc.

---

## 🛠️ Install

1.  **Clone as bare repo:**
    ```bash
    git clone --bare git@github.com:<your-username>/dotfiles.git ~/.dotfiles
    alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    dot checkout
    dot config --local status.showUntrackedFiles no
    ```

2.  **Run Setup Script:**
    This script is crucial! It will:
    - Install all dependencies via Homebrew (Git, Zsh, Eza, Bat, etc.).
    - Install Zsh plugins (Autosuggestions, Syntax Highlighting, History Search) into `~/.config/zsh/plugins/`.
    - Setup `git-delta` for better diffs.
    
    ```bash
    chmod +x install.sh
    ./install.sh
    ```

3.  **Restart Shell:**
    ```bash
    exec zsh
    ```

---

## ⌨️ Cheat Sheet

### **AeroSpace (Window Manager)**
| Key | Action |
| :--- | :--- |
| `Alt + Enter` | Open Terminal (WezTerm) |
| `Alt + D` | Open Launcher (Raycast/Spotlight) |
| `Alt + F` | Toggle Floating / Tiling |
| `Alt + /` | Switch Layout (Tiles) |
| `Alt + ,` | Switch Layout (Accordion) |
| `Alt + h/j/k/l` | Focus Window |
| `Alt + Shift + h/j/k/l` | Move Window |
| `Alt + 1..9` | Switch Workspace |
| `Alt + Shift + 1..9` | Move Window to Workspace |

### **Zsh & Terminal**
| Key | Action |
| :--- | :--- |
| `Ctrl + R` | Search History (FZF) |
| `Ctrl + T` | Search Files (FZF) |
| `Alt + .` | Insert Last Argument |
| `Alt + Left/Right` | Jump Word |
| `Ctrl + Shift + P` | WezTerm Command Palette |
| `Ctrl + Click` | Open Link |

### **Aliases**
- `z <dir>`: Jump to directory (zoxide)
- `lg`: Open Lazygit
- `ls`, `ll`, `la`: Enhanced ls (eza)
- `cat`: Enhanced cat (bat)
- `g`: git
