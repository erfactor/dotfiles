# Updating bash files. Bashrc, vimrc shortcuts
alias update='source ~/BashFiles/update.sh'
alias brc='vim ~/BashFiles/.bashrc; update'
alias vrc='vim ~/BashFiles/.vimrc'
# Windows stuff
alias r='dot run'
alias exp='explorer .'
# Git aliases
alias res='git reset --hard'
alias ress='git reset'
alias cl='git clone'
alias st='git status'
alias lg='clear; git log -8 --oneline'
alias lgs='git log -8 --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias lgg='lg --graph'
alias add='git add .'
alias com='git commit -sm'
alias amend='git commit --amend --no-edit'
alias ps='git push'
alias currentBranch='git branch --show-current'
alias psu='ps --set-upstream origin `currentBranch`'
alias pl='git pull --rebase'
alias fc='git fetch'
alias ln="awk '{print NR \":\" \$0}'"
alias br='git branch | ln'
alias bra='git fetch; git branch -a | ln'
alias deleteBranch='git branch -D'
numberRegex='^[0-9]+$'
brd(){ if [[ $1 =~ $numberRegex ]]; then deleteBranch `git branch | head -$1 | tail -1`; else deleteBranch $1; fi; }
alias ck='lastBranch=`currentBranch`; git checkout'
ckp(){ ck $1; pl; }
alias ckm='ckp master'
alias ckb='ck -b'
alias ac='git add .;git commit -sm'
alias back='tempBranch=`currentBranch`; git checkout $lastBranch; lastBranch=$tempBranch'
acp(){ git add .; git commit -sm "$1"; ps; }
acpu(){ git add .; git commit -sm "$1"; psu; }
alias cherry='git cherry-pick'
alias merge='git merge'
alias mm='ck master; pl; back; git merge master'
alias aap='add; amend; push;'
alias gd='git diff'
alias stage='git reset --soft HEAD^'

alias g='grep -iIE --color'
# alias g='grep -iP --color'
alias gr='g -R'
alias h='history | tail -n 12'
alias f='find -iregex'
alias e='echo'
alias c='lastDir=$PWD;cd'
alias b='tempDir=$PWD; cd $lastDir; lastDir=$tempDir'
alias de='c $Desktop'
alias home='c $HOME'
alias ..='cd ..'
alias l='ls -a'
alias ll='ls -alh'
alias h10='head -10'
alias t10='tail -10'
alias hg='history | grep -iP --color'
alias p='pwd'
alias fds='ls -la /proc/$$/fd'
alias v='vim'
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
export Desktop=C:/Users/$USERNAME/Desktop

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

# Fancy useful functions
#range() { for ((i=$1; i<=$2; i++)); do printf "$i\n">> $3; done; }

# Setting path variable for my own scripts
PATH=$PATH:/c/Users/$USERNAME/myscripts

# Fancy prompt look
export PS1="\[\e[40;1;35m\]\t | \w \$ \[\e[m\]"

#Add logs to file
alias Log='v -c "Logs" -c "x"'
