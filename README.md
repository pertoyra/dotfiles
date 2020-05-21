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
$ ssh_keygen -f ~/.ssh/id_rsa.<hostname>
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
Host github.com 
    HostName github.com 
    IdentityFile ~/.ssh/id_rsa.github.com

# Bitbucket
Host bitbucket.org
    HostName bitbucket.org
    IdentityFile ~/.ssh/id_rsa.bitbucket.org

```

enable ohmyzsh plugins
  -> autojump
  -> zsh-syntax-highlighting
  -> npm
  -> yarn
  -> autojump


copy/link git settings

copy zsh settings

copy vscode settings

set macos defaults
