# Dotfiles & Development Environment

Personal, modular dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/), unified under the **Catppuccin Macchiato** palette. Built for high performance, portability across Linux workstations, and clean modular version control.

---

## Toolchain & Stack

- **Terminal**: [Alacritty](https://alacritty.org/) with Catppuccin Macchiato colors.
- **Multiplexer**: [Tmux](https://github.com/tmux/tmux) with [TPM](https://github.com/tmux-plugins/tpm), Catppuccin theme, and vim-tmux-navigator.
- **Editor**: [Neovim](https://neovim.io/) (v0.12+) powered by a modern [Kickstart](https://github.com/ParamvirSran/kickstart.nvim) fork using built-in `vim.pack`.
- **Shell**: Zsh with [Oh-My-Zsh](https://ohmyz.sh/), syntax highlighting, autosuggestions, and portable local overrides (`~/.zshrc.local`).
- **Package Management**: GNU Stow for symlink organization into `$HOME`.

---

## 1. Quick Start / Installation

### Prerequisites
- **Git** and **GNU Stow** (`sudo apt install git stow` or `sudo pacman -S git stow`)
- **Neovim $\ge$ 0.12** (required for upstream `vim.pack` package management)
- **Tree-sitter CLI** (`cargo install tree-sitter-cli` or `npm install -g tree-sitter-cli`)
- **Tmux** ($\ge 3.0$) and **Zsh**

### One-Command Setup
On any fresh machine, clone recursively and run the bootstrap script:

```bash
git clone --recurse-submodules https://github.com/ParamvirSran/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

### What `install.sh` Does
1. **Initializes Submodules**: Recursively fetches the `kickstart.nvim` submodule under `nvim/.config/nvim`.
2. **Installs TPM**: Clones Tmux Plugin Manager to `~/.tmux/plugins/tpm` if not already present.
3. **Stows Packages**: Symlinks all configuration packages (`alacritty`, `git`, `nvim`, `tmux`, `zshrc`, `bin`) into `$HOME`.
4. **Provisions Operations CLI**: Links the `dotfiles` helper script directly into `~/.local/bin/dotfiles`.
5. **Executes Machine Hooks**: Automatically triggers `~/.local/bin/dotfiles-local` if configured for private/work environment integrations.

---

## 2. The `dotfiles` Operations CLI

The repository includes a dedicated CLI utility located at `bin/.local/bin/dotfiles` (stowed to `~/.local/bin/dotfiles`), accessible globally from any shell prompt.

### Command Reference

```bash
dotfiles <command> [arguments]
```

| Command | Description | What It Does Under the Hood |
| :--- | :--- | :--- |
| `dotfiles sync`<br>*(alias: `pull`)* | Pulls updates and syncs environment | 1. Pulls the latest commits from `origin/main` (fast-forward or rebase).<br>2. Updates git submodules (`kickstart.nvim`).<br>3. Restows all configuration packages (`stow -R */`).<br>4. Executes `~/.local/bin/dotfiles-local` if present on the machine. |
| `dotfiles push [message]` | Commits & pushes both submodule & dotfiles | 1. Checks if `kickstart.nvim` submodule has changes. If so, commits and pushes to `origin/config` and synchronizes `origin/master`.<br>2. Checks if `dotfiles` has changes or updated submodule references. Commits and pushes to `origin/main`. |
| `dotfiles status` | Environment & repo health check | 1. Displays active Neovim binary path and version.<br>2. Verifies Tmux binary and TPM installation status.<br>3. Shows Git branch, latest commit, and working tree cleanliness for both `kickstart.nvim` and `dotfiles`. |
| `dotfiles stow` | Restows symlinks | Re-runs GNU Stow on all packages (`alacritty`, `git`, `nvim`, `tmux`, `zshrc`, `bin`) to refresh broken or missing symlinks in `$HOME`. |
| `dotfiles rebase-upstream` | Syncs Neovim with official Kickstart | 1. Fetches the latest commits from upstream `nvim-lua/kickstart.nvim`.<br>2. Rebases your `config` branch on `upstream/master`.<br>3. Pushes with lease to `origin/config` and fast-forwards `origin/master`.<br>4. Updates and pushes the submodule pointer in the parent `dotfiles` repo. |

### Common Daily Workflows

#### Updating your environment across machines
```bash
dotfiles sync
```

#### Saving and pushing changes
```bash
# Edit files in dotfiles or nvim, then push in one step:
dotfiles push "Add new tmux shortcut and lualine tweak"
```

#### Checking system status
```bash
dotfiles status
```

---

## 3. Package Structure

```
dotfiles/
├── alacritty/          # Terminal emulator configuration
│   └── .config/alacritty/alacritty.toml
├── bin/                # Personal CLI tools (stowed to ~/.local/bin)
│   └── .local/bin/dotfiles
├── git/                # Global Git configuration
│   └── .gitconfig
├── nvim/               # Neovim configuration (Git submodule)
│   └── .config/nvim/   # Fork of nvim-lua/kickstart.nvim
├── tmux/               # Terminal multiplexer configuration
│   └── .tmux.conf
├── zshrc/              # Shell configuration
│   └── .zshrc
├── install.sh          # Bootstrap installer for fresh setups
└── README.md
```

---

## 4. Local & Private Machine Customization

To keep this repository 100% public and free of machine-specific credentials or employer-internal paths:

- **Shell Overrides**: Add private aliases or paths to `~/.zshrc.local`. It is sourced automatically by `.zshrc` and ignored by Git.
- **Neovim Overrides**: Place machine-specific plugins or LSP configs in `~/.config/nvim/lua/local.lua` and `~/.config/nvim/lsp/`. They are loaded via `pcall(require, 'local')` and ignored by Git.
- **Automation Hook**: Create `~/.local/bin/dotfiles-local` to execute custom sync tasks whenever `dotfiles sync` runs.
