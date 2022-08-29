#!/bin/bash

# MacOS brew path
# Ensure user-installed binaries take precedence
PATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:$PATH"
# MANPATH="${brew_coreutils}/libexec/gnuman:$MANPATH"

# GNU
PATH="${HOMEBREW_PREFIX}/opt/gnu-getopt/bin:$PATH"
PATH="${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="${HOMEBREW_PREFIX}/opt/curl/bin:$PATH"

# kubectl krew
PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# vscode
PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# AWS gossm mfa
export AWS_SHARED_CREDENTIALS_FILE=/Users/jirisrba/.aws/credentials

# terraform M1 workaround
export GODEBUG=asyncpreemptoff=1

# kubetail: only the pod name is colorized
export KUBETAIL_COLORED_OUTPUT=pod

# postgres
PATH="/usr/local/opt/libpq/bin:$PATH"

# local bash scripts $HOME/bin
PATH=$HOME/bin:$PATH

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

# docker
export DOCKER_BUILDKIT=1

# MacOS ansible
export ANSIBLE_NOCOWS=1

# MacOS Java Home
# export JAVA_HOME=$(/usr/libexec/java_home)

# GO
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# cargo
# . "$HOME/.cargo/env"
