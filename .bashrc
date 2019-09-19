# Git aliases
alias st='git status'
alias log='git log -8 --oneline'
alias add='git add .'
alias com='git commit -sm'
alias amend='git commit --amend --no-edit'
alias push='git push origin HEAD:refs/for/release'
alias br='git branch'
alias check='git checkout'
alias acom='git add .;git commit -sm'
alias cherry='git cherry-pick'
alias aap='add; amend; push;'

alias h='history | tail -n 12'
alias gr='grep -iRP --color'
alias g='grep -iP --color'
alias f='find -iregex'
alias e='echo'
alias c='lastdir=$PWD;cd'
alias .b='cd $lastdir'
alias ..='cd ..'
alias l='ls -a'
alias h10='head -10'
alias t10='tail -10'
alias hg='history | grep -iP --color'
alias p='pwd'
alias fds='ls -la /proc/$$/fd'
alias v='vim'

# History
shopt -s histreedit
shopt -u histverify
export HISTIGNORE="&"
export HISTSIZE=1500
export HISTFILESIZE=1500
export D=C:/Users/r.chabasinsk/Desktop

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

#Prompt
export PS1="\t \$ "
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
range() { for ((i=$1; i<=$2; i++)); do printf "$i\n">> $3; done; }
