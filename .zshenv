#!/bin/bash

# You may need to manually set your language environment
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# General
export EDITOR="code --wait"
export VISUAL="code --wait"

# Prioritize Homebrew GNU less
export PATH="/opt/homebrew/bin:$PATH"

# claude code
export PATH="$HOME/.local/bin:$PATH"

# MacOS brew path
# Ensure user-installed binaries take precedence
PATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:$PATH"
# MANPATH="${brew_coreutils}/libexec/gnuman:$MANPATH"

# GNU
PATH="${HOMEBREW_PREFIX}/opt/gnu-getopt/bin:$PATH"
PATH="${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="${HOMEBREW_PREFIX}/opt/curl/bin:$PATH"

# Kubernetes
export KUBECONFIG="${HOME}/.kube/config"
export KUBE_EDITOR="code --wait"

# kubectl krew
export PATH="$HOME/.krew/bin:$PATH"

# kubetail: only the pod name is colorized
export KUBETAIL_COLORED_OUTPUT=pod

# vscode
PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# AWS
export AWS_PAGER=""  # Disable pager for AWS CLI
export AWS_DEFAULT_OUTPUT="json"

# AWS gossm
export AWS_SHARED_CREDENTIALS_FILE="$HOME/.aws/credentials"

# Terraform
export TF_PLUGIN_CACHE_DIR="${HOME}/.terraform.d/plugin-cache"

# postgres
PATH="/usr/local/opt/libpq/bin:$PATH"

# local bash scripts $HOME/bin
PATH=$HOME/bin:$PATH


# docker
export DOCKER_BUILDKIT=1

# MacOS ansible
export ANSIBLE_NOCOWS=1

# GO
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# NVM
export NVM_DIR="$HOME/.nvm"

# ansible
# export PATH="${HOME}/Library/Python/3.11/bin:$PATH"
