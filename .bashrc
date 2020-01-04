# Git aliases
alias st='git status'
alias log='git log -8 --oneline'
alias add='git add .'
alias com='git commit -sm'
alias amend='git commit --amend --no-edit'
alias push='git push'
alias pull='git pull'
alias br='git branch'
alias check='git checkout'
alias acom='git add .;git commit -sm'
alias cherry='git cherry-pick'
alias aap='add; amend; push;'
alias gd='git diff'

alias h='history | tail -n 12'
alias gr='grep -iRP --color'
alias g='grep -iP --color'
alias f='find -iregex'
alias e='echo'
alias c='lastdir=$PWD;cd'
alias .b='cd $lastdir'
alias ..='cd ..'
alias l='ls -a'
alias ll='ls -alh'
alias h10='head -10'
alias t10='tail -10'
alias hg='history | grep -iP --color'
alias p='pwd'
alias fds='ls -la /proc/$$/fd'
alias v='vim'
alias de='lastdir=$PWD;cd $D'
alias dot='dotnet'
alias dotgen='dot aspnet-codegenerator'
alias dwr='dot watch run &'
alias kil='kill -9 '

# History
shopt -s histreedit
shopt -u histverify
export HISTIGNORE="&:[ ]*"
export HISTSIZE=10000
export HISTFILESIZE=10000
export D=C:/Users/$USERNAME/Desktop

# Extract columns
alias c1='awk '\''{print $1}'\'''
alias c2='awk '\''{print $2}'\'''
alias c3='awk '\''{print $3}'\'''
alias c4='awk '\''{print $4}'\'''
alias c5='awk '\''{print $5}'\'''
alias c6='awk '\''{print $6}'\'''
alias c7='awk '\''{print $7}'\'''
alias c8='awk '\''{print $8}'\'''
alias c9='awk '\''{print $9}'\'''

#set -o noclobber
# c $D

# Cleaning swp files
alias clean='rm `f ".*sw[op]"`'

# Suspending flow control in shell
stty -ixon
stty stop 'undef'
# Bashrc, vimrc shortcuts
alias vrc='vim ~/.vimrc'
alias brc='vim ~/.bashrc'
alias .brc='. ~/.bashrc'

# Fancy useful functions
#range() { for ((i=$1; i<=$2; i++)); do printf "$i\n">> $3; done; }

# Setting path variable for my own scripts
PATH=$PATH:/c/Users/$USERNAME/myscripts

# Fancy prompt look
export PS1="\[\e[40;1;35m\]\t | \w \$ \[\e[m\]"

#Add logs to file
alias Log='v -c "Logs" -c "x"'
