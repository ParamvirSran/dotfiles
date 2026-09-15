#!/usr/bin/env bash
#
# install.sh - Bootstrap installer for personal dotfiles and kickstart.nvim
#

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Setting up dotfiles from $DOTFILES_DIR..."

# 1. Initialize and update submodules
echo "==> Initializing submodules (kickstart.nvim)..."
cd "$DOTFILES_DIR"
git submodule update --init --recursive

# 2. Install TPM (Tmux Plugin Manager) if not installed
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
  echo "==> Cloning Tmux Plugin Manager (TPM)..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# 3. Restow all packages
echo "==> Stowing configuration packages..."
for pkg in */; do
  pkg="${pkg%/}"
  if [[ "$pkg" == .* ]]; then
    continue
  fi
  stow -R "$pkg" 2>/dev/null || stow "$pkg"
done

# 4. Run local machine hook if present (e.g. Cloudtop Piper setup)
if [[ -x "$HOME/.local/bin/dotfiles-local" ]]; then
  echo "==> Running local machine hook..."
  "$HOME/.local/bin/dotfiles-local"
fi

echo "==> Dotfiles installation complete!"
echo "Run 'dotfiles status' to verify your environment."
