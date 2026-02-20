# Dotfiles

## Installation

### 1. Install Homebrew

Check https://brew.sh for latest install instructions.

### 2. Install packages and apps

CLI tools are in `Brewfile`, macOS apps are in `Brewfile.apps` — edit these to customize what gets installed.

### 3. Bootstrap dotfiles

```
./install.sh
```

This installs all packages from both Brewfiles, sets fish as the default shell, and deploys dotfiles via symlinks.

## Setup SSH

### Generate keys

Generate new SSH keys for every hostname (i.e. github.com, bitbucket.org, ...):

```
ssh_keygen -C <email> -f ~/.ssh/id_ed25519.<hostname>
```

e.g.

```
ssh_keygen -C <email> -f ~/.ssh/id_ed25519.github.com
```

If multiple keys are needed for same hostname create another SSH key suffixed with an appropriate identifier, e.g.:

```
ssh_keygen -C <email> -f ~/.ssh/id_ed25519.github.com-my-other-account
```

Save passphrase to password manager.

### Edit SSH config

Create or edit `~/.ssh/config`:

```
# Use identity files instead of SSH
IdentitiesOnly yes

# Default
Host *
    AddKeysToAgent yes
    UseKeychain yes

# Github
Host github.com                                # and suffix if not using default SSH key
    HostName github.com                        # this should always be the actual hostname
    IdentityFile ~/.ssh/id_ed25519.github.com  # the key file to be used for this service
```

### Upload public keys

1. Upload the newly generated public keys to corresponding service.
2. Test connection to the service.
3. Enter the passphrase.
4. Success 🎉

## Create local gitconfig

Create `~/.gitconfig.local` which is linked from the gitconfig in this repo:

```
[user]
    name = Per Töyrä
    email = <email>

# If some repositories should have a specific user
# [includeIf "gitdir:~/.dotfiles"]
#    [user]
#        email = <another email>

# Only needed if specific gitconfigs are needed for certain folders
# [includeIf "gitdir:~/Repos/<some folder>/"]
#    path = ~/Repos/<customer>/.gitconfig
```

## Set macOS defaults

Run to set macOS defaults:

```
./macos
```

## Reboot

Reboot the computer...
