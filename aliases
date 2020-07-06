# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# global bash aliases
alias ls='ls -G -h --color=auto'
alias grep='ggrep'
#alias ls='ls -h --color=auto --group-directories-first'
# alias ll='ls -l'
alias lt='ls -alhrt | tail'
# alias grepi='grep -i'
alias diff='colordiff'
alias err="log show --predicate 'messageType == error' --style syslog --info --last 1m | cut -c 1-22,43-999"
alias nc='netcat'
alias malina='ssh pi@malina.local'    # ssh malina
alias killvscode='pkill -KILL Electron'
alias ack='ack -i'


# git alias
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh
alias gl="git log --graph --pretty=format:'%C(auto)%h -%d %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gst='git status'
# alias gl='git pull'
alias gup='git pull --rebase'
# alias gp='git push'
alias gcmsg='git commit -m'
alias gco='git checkout'
# alias gwip='git add -A; git ls-files --deleted -z | xargs -0 git rm; git commit -m "wip"; git push --all'


# Macos docker desktop aliases
alias docker-start='open --background -a Docker'
alias docker-stop="osascript -e 'quit app \"Docker\"'"
alias run-postgres='docker run --rm --name pg-docker -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=docker -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data -d postgres'


# rsync scripts
# alias rsync-ansible='rsync -Ccazv --exclude='inventory/hosts' --exclude=.DS_Store --exclude=.git -e "ssh -i ~/.ssh/id_rsa.oracle" ~/Scratch/ansible/ oracle@oem12-m.vs.csin.cz:/dba/local/ansible_dev/'
alias rsync-clone='rsync -Ccazv --exclude=.DS_Store --exclude=.git --exclude=venv -e "ssh -i ~/.ssh/id_rsa.oracle"  ~/Scratch/clone/ oracle@toem-m.vs.csin.cz:/dba/clone/'


# CSAS aliases
alias ki='kinit --keychain sol60210@CEN.CSIN.CZ && klist'
alias sql='/Applications/oracle/sqlcl/bin/sql'
alias ss='ssh -l sol60210'
alias so='ssh -l oracle -i ~/.ssh/id_rsa.sol60210@oem'
alias som='ssh -l oracle -i ~/.ssh/id_rsa.oracle oem12-m.vs.csin.cz'
alias sp='ssh -l postgres -i ~/.ssh/id_rsa.oracle'
alias scpo='scp -i ~/.ssh/id_rsa.oracle -C'
