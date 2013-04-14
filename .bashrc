# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

PS1='\h:\W \u\$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize

alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# This will open localhost:#### in my default browser
lh() { open http://localhost:$1; }
alias c='clear'

# This alias will remap the ssh command to contain extra options by default. This includes compressd, disable x11 & preventing the ssh timeouts
alias ssh='ssh -x -C -i TCPKeepAlive=no -o ServerAliveInterval=15'

# This is  to open vim in cuurent directory (vim .) to be used as vi - don't need vi anymore anyway
alias vi='vim .'

# This function will parse the git branch to find the name of the git branch in the current directory. This function will then be called in PS1 in order for the git branch to appear on the terminal prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# This customizes the bash prompt
#export PS1="\[\033[01;32m\]\u\033[00;36m\]@\033[01;34m\]\h\033[01;33m\] in folder: \033[01;32m\]\$( pwd )\[\033[36m\] $(parse_git_branch)\[\033[00m\] \n $ "
export PS1="\[\033[32m\][\u\[\033[36m\]@\[\033[32m\]\h]\[\033[00m\] in\[\033[33m\] \$( pwd )\[\033[36m\]\$(parse_git_branch)\[\033[00m\] \n $ "

# if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
# This adds a new line to the end of a terminal prompt so that I can start typing commands on a fresh new line
PS1="\n$PS1"
clear
