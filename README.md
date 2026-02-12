```markdown
# Dotfiles

## 📂 Structure
```text
.
├── .config/
│   ├── fuzzel/      # Launcher
│   ├── kitty/       # Terminal
│   ├── niri/        # Compositor
│   ├── noctalia/    # Theme components
│   ├── nvim/        # Neovim
│   └── tmux/        # Multiplexer
└── README.md

```

## ⚡ Installation

### 1. Install GNU Stow

**Fedora:**

```bash
sudo dnf install stow git

```

**Ubuntu/Debian:**

```bash
sudo apt install stow git

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
git clone [https://github.com/Apika-Francis/dotfiles.git](https://github.com/Apika-Francis/dotfiles.git) ~/.dotfiles

# 2. Enter directory
cd ~/.dotfiles

# 3. Symlink configs
stow .

```
