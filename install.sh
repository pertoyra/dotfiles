#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Installing CLI tools..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

echo "==> Installing apps..."
brew bundle --file="$DOTFILES_DIR/Brewfile.apps"

# Ensure fish is in /etc/shells and set as default
FISH_PATH="$(which fish)"
grep -qF "$FISH_PATH" /etc/shells || echo "$FISH_PATH" | sudo tee -a /etc/shells
[ "$SHELL" != "$FISH_PATH" ] && chsh -s "$FISH_PATH"

# Deploy dotfiles via Fish
fish -c "
  set -gx DOTFILES_DIR '$DOTFILES_DIR'
  source '$DOTFILES_DIR/user/.config/fish/functions/deploy_user.fish'
  deploy_user
"

# Remind about local gitconfig if missing
if [ ! -f "$HOME/.gitconfig.local" ]; then
  echo ""
  echo "ACTION REQUIRED: ~/.gitconfig.local not found."
  echo "Create it with your name and email:"
  echo "  printf '[user]\n\tname = Your Name\n\temail = you@email.com\n' > ~/.gitconfig.local"
fi

echo ""
echo "Done. Restart terminal or run: source ~/.config/fish/config.fish"
