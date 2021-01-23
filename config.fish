# fish ENV

# PATH bash scripts
set -gx PATH /opt/homebrew/opt/coreutils/libexec/gnubin $HOME/code/bash /opt/homebrew/bin /usr/local/bin $PATH

# # vscode SQLcl psql
set -gx PATH "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $PATH
set -gx PATH /usr/local/opt/libpq/bin /usr/local/opt/libpq/bin $PATH

# EDITOR
set -gx EDITOR "code -w"

# coreutils getopt
set -gx PATH /opt/homebrew/opt/grep/libexec/gnubin /opt/homebrew/opt/gnu-getopt/bin $PATH

# Findutils bin and man folders
set -x -g PATH /opt/homebrew/opt/coreutils/libexec/gnubin /opt/homebrew/opt/findutils/libexec/gnubin $PATH

set -g -x LANG "en_US.UTF-8"
set -g -x LC_ALL "en_US.UTF-8"

# User bin folder
set -x -g PATH ~/bin $PATH /usr/local/sbin

# MacOS ansible
set -gx ANSIBLE_INVENTORY inventory/hosts
set -gx ANSIBLE_NOCOWS 1

# MacOS Java Home
# set -gx JAVA_HOME $(/usr/libexec/java_home)

# GO
set --universal -x GOPATH $HOME/go
set --universal -x PATH $PATH /usr/local/go/bin $GOPATH/bin

# starship
starship init fish | source
