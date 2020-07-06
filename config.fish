# fish ENV

# PATH bash scripts
set -gx PATH $HOME/code/bash /usr/local/bin $PATH

# # vscode SQLcl psql
set -gx PATH "/Applications/oracle/sqlcl/bin" $PATH
set -gx PATH "/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin" $PATH
set -gx PATH /usr/local/opt/libpq/bin /usr/local/opt/libpq/bin $PATH
set -gx PATH "/Applications/Sublime Text.app/Contents/SharedSupport/bin" $PATH

# EDITOR
set -gx EDITOR "code -w"

# gnu getopt
set -gx PATH /usr/local/opt/gnu-getopt/bin $PATH

# Coreutils bin and man folders
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH

# Findutils bin and man folders
set -x -g PATH /usr/local/opt/findutils/libexec/gnubin $PATH

set -g -x LANG "en_US.UTF-8"
set -g -x LC_ALL "en_US.UTF-8"

# User bin folder
set -x -g PATH ~/bin $PATH /usr/local/sbin

# MacOS ansible
set -gx ANSIBLE_INVENTORY inventory/hosts
set -gx ANSIBLE_NOCOWS 1

# MacOS Java Home
# set -gx JAVA_HOME $(/usr/libexec/java_home)

# Oracle instant client x64
set -gx ORACLE_BASE "$HOME/Applications/instantclient_19_3"
set -gx ORACLE_HOME "$ORACLE_BASE"
set -gx PATH $ORACLE_HOME $PATH
set -gx DYLD_LIBRARY_PATH $DYLD_LIBRARY_PATH $ORACLE_HOME

# Oracle SQLcl
set -gx SQLCL "/Applications/oracle/sqlcl/bin/sql"
set -gx TNS_ADMIN "$HOME/oracle"
set -gx SQLPATH "$HOME/SQL"
# SQLcl
# GO
set --universal -x GOPATH $HOME/go
set --universal -x PATH $PATH /usr/local/go/bin $GOPATH/bin
