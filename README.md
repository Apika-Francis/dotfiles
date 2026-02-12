```markdown
# Dotfiles

## 📂 Structure
```text
.
├── .config/
│   ├── fuzzel/      # Launcher
│   ├── kitty/       # Terminal
│   ├── niri/        # Compositor (Window Manager)
│   ├── noctalia/    # Shell/Bar components
│   ├── nvim/        # Neovim (Lua-based)
│   └── tmux/        # Multiplexer
└── README.md

```

## 📦 Dependencies

### Core & Wayland

Required for Niri keybindings and system functions.

| Tool | Package (Fedora) | Usage |
| --- | --- | --- |
| **Compositor** | `niri` | The window manager |
| **Launcher** | `fuzzel` | App launcher |
| **Bar/Shell** | `noctalia-shell` | Desktop shell (requires `quickshell`) |
| **Terminal** | `kitty`, `tmux` | Terminal & Multiplexer |
| **Utilities** | `bemoji` | Emoji picker |
| **Screenshot** | `grim`, `slurp`, `swappy` | Capture & Edit |
| **System** | `libnotify`, `wireplumber`, `brightnessctl`, `playerctl` | Notifications, Audio, Brightness, Media |

### Editor (Neovim)

Required for plugins (Telescope, Treesitter, Mason) to function correctly.

* **Build Tools:** `gcc`, `make`, `unzip`, `git`
* **Search:** `ripgrep`, `fd-find`
* **Clipboard:** `wl-clipboard`

---

## ⚡ Installation

### 1. Install Packages (Fedora)

```bash
# Core Tools
sudo dnf install git stow niri fuzzel kitty tmux neovim ripgrep fd-find gcc-c++ make unzip wl-clipboard

# Wayland Utilities
sudo dnf install bemoji grim slurp swappy libnotify wireplumber brightnessctl playerctl

# Fonts
sudo dnf install jetbrains-mono-nerd-fonts

```

### 2. Backup Existing Configs

**⚠️ Important:** Move your current configurations to avoid conflicts.

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.config/kitty ~/.config/kitty.bak
# Repeat for other folders present in the structure above

```

### 3. Clone & Stow

Clone the repo to your home directory and create symlinks.

```bash
# 1. Clone to ~/.dotfiles
git clone https://github.com/Apika-Francis/dotfiles.git ~/dotfiles

# 2. Enter directory
cd ~/dotfiles

# 3. Symlink configs
stow .

```
