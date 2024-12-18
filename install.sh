#!/usr/bin/env bash
set -e

echo "Setting up dotfiles..."

# Ensure fish
if ! command -v fish >/dev/null; then
  echo "Install fish first: brew install fish"
  exit 1
fi

FISH_PATH=$(which fish)

# Add to shells if needed
grep -q "$FISH_PATH" /etc/shells || echo "$FISH_PATH" | sudo tee -a /etc/shells

# Change default shell
[ "$SHELL" != "$FISH_PATH" ] && chsh -s "$FISH_PATH"

# Export dotfiles path
export DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

fish -c "
  set -gx DOTFILES_DIR '$DOTFILES_DIR'
  source $DOTFILES_DIR/user/.config/fish/functions/deploy_user.fish
  deploy_user
  reload_fish
"

echo "Done. Restart terminal."