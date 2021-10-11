# Case insensitive terminal
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
# Updating bash files. Bashrc, vimrc shortcuts
alias update='source ~/BashFiles/update.sh'
alias brc='vim ~/BashFiles/.bashrc; update'
alias vrc='vim ~/BashFiles/.vimrc'
# Windows stuff
alias r='dot run'
alias exp='explorer .'
# Flutter stuff
alias run='flutter pub run build_runner build --delete-conflicting-outputs'
alias runw='flutter pub run build_runner watch'
alias fpg='flutter pub get'
alias fcl='flutter clean'
alias fcr='flutter pub cache repair'

# Simple
alias l='ls -AG'
alias ll='l -lh'
alias p='pwd'
alias v='vim'
alias h='history | tail -n 12'
alias hg='history | g'
alias f='find -iregex'
alias e='echo'
alias g='grep -iIE --color'
alias gr='g -R'

# cd
alias c='lastDir=$PWD; cd'
alias b='tempDir=$PWD; cd $lastDir; lastDir=$tempDir'
alias de='c $Desktop'
alias home='c $HOME'
alias bf='c $HOME/BashFiles'
alias ..='c ..'

# Git aliases
alias rs='git reset --hard'
alias rss='git reset'
alias cl='git clone'
alias st='clear; git status'
alias lg='clear; git log -8 --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias lgo='clear; git log -8 --oneline'
alias lgg='lg --graph'
alias add='git add .; git restore --staged yookos-protocol 2> /dev/null'
alias com='git commit -sm'
alias con='git commit -s --no-edit'
alias amend='add; git commit --amend --no-edit'
alias ps='git push'
alias currentBranch='git branch --show-current'
alias psu='ps --set-upstream origin `currentBranch`'
alias pl='git pull'
alias plr='git pull --rebase'
alias cont='git rebase --continue'
alias fc='git fetch'
alias ln="awk '{print NR \":\" \$0}'"
alias br='clear; git branch | ln'
bra(){ fc; if [[ -z $1 ]]; then git branch -a | ln; else git branch -a | ln | g $1; fi; }
alias deleteBranch='git branch -D'
alias saveLastBranch='lastBranch=`currentBranch`'
alias createTempBranch='tempBranch=`currentBranch`'
alias saveTempBranch='lastBranch=$tempBranch'
numberRegex='^[0-9]+$'
brd(){ if [[ $1 =~ $numberRegex ]]; then deleteBranch `git branch | head -$1 | tail -1`; else deleteBranch $1; fi; br; }
ck(){ createTempBranch; if [[ $1 =~ $numberRegex ]]; then git checkout `git branch | head -$1 | tail -1` && saveTempBranch; else git checkout $1 && saveTempBranch; fi; }
cka(){ createTempBranch; if [[ $1 =~ $numberRegex ]]; then git checkout `git branch -a | head -$1 | tail -1 | sed 's/remotes\/origin\///'` && saveTempBranch; else git checkout $1 && saveTempBranch; fi; }
ckp(){ ck $1; pl; }
alias ckm='ckp master'
alias ckd='ckp dev'
alias ckb='saveLastBranch; git checkout -b'
alias back='createTempBranch; git checkout $lastBranch; saveTempBranch'
alias ac='add; com'
acp(){ ac "$1"; ps; }
acpu(){ ac "$1"; psu; }
alias acpf='acp fix'
alias macp='add; con; ps;'
alias cherry='git cherry-pick'
alias merge='git merge'
alias md='merge dev'
alias mmd='ckd; back; md'
alias mm='ckp master; back; git merge master'
alias aap='add; amend; push;'
alias gd='git diff'
stage(){ git reset --soft HEAD~$1; }


#Auxiliary
alias h10='head -10'
alias t10='tail -10'
alias fds='ls -la /proc/$$/fd'
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

#Yookos
alias logs='kubectl logs -f yookos-api-f9546989d-9zh65'

#set -o noclobber

# Cleaning swp files
alias clean='rm `f ".*sw[op]"`'

# Suspending flow control in shell
stty -ixon
stty stop 'undef'

# Fancy useful functions
#range() { for ((i=$1; i<=$2; i++)); do printf "$i\n">> $3; done; }

# PATH
PATH=$PATH:$HOME/myscripts:$HOME/src/flutter/bin:/c/src

# Prompt
# \t for time
# export PS1="\[\e[40;1;35m\]\t | \w \$ \[\e[m\]"

git_branch() {
 currentBranch 2> /dev/null | awk '{print " ("$1")"}'
}
export PS1="\[\033[32m\]\w\[\033[33m\]\$(git_branch)\[\033[00m\] $ "

#Add logs to file
alias Log='v -c "Logs" -c "x"'
