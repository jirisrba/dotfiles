# Path to your oh-my-zsh installation.
export ZSH="/Users/jirisrba/.oh-my-zsh"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/SW/Bash:/usr/local/bin:$PATH

# postgres psql
export PATH="/usr/local/opt/libpq/bin:$PATH"

# vscode SQLcl
export PATH="/Applications/oracle/sqlcl/bin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# MacOS brew path
# Ensure user-installed binaries take precedence
brew_coreutils="/usr/local/opt/coreutils"
# brew_coreutils=$(brew --prefix coreutils)
export PATH="${brew_coreutils}/libexec/gnubin:/usr/local/bin:/usr/local/sbin:$PATH"
export MANPATH="${brew_coreutils}/libexec/gnuman:$MANPATH"

# You may need to manually set your language environment
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR="/usr/local/bin/subl -w"
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# MacOS ansible
export ANSIBLE_INVENTORY=inventory/hosts
export ANSIBLE_NOCOWS=1

# MacOS Java Home
# export JAVA_HOME=$(/usr/libexec/java_home)

# Oracle instant client x64
export ORACLE_BASE="${HOME}/Applications/instantclient_19_3"
export ORACLE_HOME="$ORACLE_BASE"
export PATH="$ORACLE_HOME:$PATH"
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$ORACLE_HOME"

# Oracle SQLcl
export SQLCL="/Applications/oracle/sqlcl/bin/sql"
export TNS_ADMIN="${HOME}/oracle"
export SQLPATH="${HOME}/SQL"
# SQLcl

# GO
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# BAT https://github.com/sharkdp/bat
export BAT_THEME="ansi-light"
