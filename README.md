# Dotfiles

## Installation
Install homebrew
```    
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install homebrew packages
```
$ brew install \
     n \
     git \
     gh \
     rmtrash \
     ack \
     autojump \
     tree \
     wget \
     mono \
     michaeldfallen/formula/git-radar \
     zsh-syntax-highlighting \
     github/gh/gh
```

Install Node LTS 
```
$ sudo n lts
```

Install brew casks
```
$ brew tap homebrew/cask-versions
$ brew tap homebrew/cask-fonts
$ brew cask install \
       azure-data-studio \
       docker \
       firefox \
       font-fira-code \
       gitup \
       google-chrome \
       google-chrome-canary \
       postman \
       slack \
       the-unarchiver \
       visual-studio-code \
       viscosity
```

install ohmyzsh
```
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install dotnet core sdk from https://dot.net.

## Setup SSH
### Generate keys
Generate new SSH keys for every hostname (i.e. github.com, bitbucket.org, ...):
```
$ ssh_keygen -f ~/.ssh/id_rsa.<hostname+customer>
```
e.g.
```
$ ssh_keygen -f ~/.ssh/id_rsa.github.com-parkero
```

Save passphrase to 1Password.

### Edit SSH config
Create or edit `~/.ssh/config`:
```
# Use identity files instead of SSH
agentIdentitiesOnly yes

# Default
Host * 
    AddKeysToAgent yes 
    UseKeychain yes

# Github
Host <hostname+customer, e.g. "github.com-parkero> 
    HostName <real hostname> 
    IdentityFile ~/.ssh/id_rsa.<hostname+customer>
```

## Copy dotfiles
Copy dotfiles stored in this repo to home folder:
```
$ cd <this repo>
$ cp -R user/. ~
```

## Create local gitconfig
Create `~/.gitconfig.local` which is linked from the gitconfig in this repo:
```
[user]
    name = Per Töyrä
    email = <email>

# Only needed if specific gitconfigs are needed for certain folders
# [includeIf "gitdir:~/Repos/<customer>/"]
#    path = ~/Repos/<customer>/.gitconfig
```

## Copy VS Code settings
Only needed until sync is implemented in vscode:
```
$ cp -R vscode/. ~/Library/Application\ Support/Code/User
```

## Install macOS Terminal theme
Double click the terminal theme file `Bright Lights.terminal` to install.

## Set macOS defaults
Run to set macOS defaults:
```
./macos
```

## Reboot
Reboot the computer...
