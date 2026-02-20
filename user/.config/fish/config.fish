# `fish_config` – opens web config if you want to tweak interactively

## Set PATH (merge with existing)
set -gx PATH /usr/local/bin $PATH
eval (/opt/homebrew/bin/brew shellenv)
set -gx MACOS_CACHE_DIR $HOME/Library/Caches

## Node user-global modules
mkdir -p ~/.node_modules
npm config set prefix ~/.node_modules
set -gx PATH $HOME/.node_modules/bin $PATH

## Starship prompt
starship init fish | source

## Set editor
if set -q SSH_TTY
    set -gx EDITOR nano
else
    set -gx EDITOR "code --wait"
end

## Init zoxide
zoxide init fish | source

## Aliases

### Shortcuts
alias g="git"
alias npr="npm run"
alias k="kubectl"
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'

### Change directory
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

### List directory contents
alias lsa="ls -lah"
alias l="ls -lah"
alias ll="ls -lh"
alias la="ls -lAh"
