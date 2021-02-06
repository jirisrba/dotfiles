#!/bin/bash

# bash scripts
export PATH=$HOME/code/bash:/usr/local/bin:/usr/local/sbin:$PATH

# vscode
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# postgres
export PATH="/usr/local/opt/libpq/bin:$PATH"

# MacOS brew path
# Ensure user-installed binaries take precedence
# brew_coreutils=$(brew --prefix coreutils)
brew_coreutils="/opt/homebrew/opt/coreutils"
export PATH="${brew_coreutils}/libexec/gnubin:${brew_coreutils}/gnu-getopt/bin:$PATH"
# export MANPATH="${brew_coreutils}/libexec/gnuman:$MANPATH"

# You may need to manually set your language environment
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR="code -w"
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# export MANPATH="/usr/local/man:$MANPATH"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# MacOS ansible
export ANSIBLE_INVENTORY=inventory/hosts
export ANSIBLE_NOCOWS=1

# MacOS Java Home
# export JAVA_HOME=$(/usr/libexec/java_home)

# GO
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
