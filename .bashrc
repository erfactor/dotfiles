# Case insensitive terminal
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Updating bash files. .bashrc, .vimrc shortcuts
alias update='source ~/dotfiles/update.sh'
alias brc='vim ~/dotfiles/.bashrc; update'
alias cbrc='vim ~/dotfiles/.custombashrc; update'
alias vrc='vim ~/dotfiles/.vimrc; update'

# Windows
alias ex='explorer .'

# Flutter
alias run='dart run build_runner build --delete-conflicting-outputs'
alias runw='dart run build_runner watch --delete-conflicting-outputs'
alias fpg='flutter pub get'
alias fpa='flutter pub add'
alias fpad='flutter pub add --dev'
alias dpgl='dart pub global list'
alias dpga='dart pub global activate'
fba(){ flutter build appbundle --flavor=$1 --dart-define=flavor=$1 --build-number $2; cp build/app/outputs/bundle/$1Release/app-$1-release.aab $Desktop; }
alias fr='flutter'
alias dr='dart run'
alias fcl='flutter clean; fpg'
alias fcr='flutter pub cache repair'
alias dcm='dart run dart_code_metrics:metrics analyze lib'
alias dr='dart pub global run'

# Simple
alias l='ls -A --color --group-directories-first' # All except . and ..
alias ll='l -goh' # No owner, group. Human-readable size
alias p='pwd'
alias v='vim'
alias h='history | tail -n 12'
alias hg='history | g'
alias f='find -iregex'
alias e='echo'
alias g='grep -iIE --color -A 5'
alias gr='g -R'
alias rmd='rm -rf'

# cd
alias c='lastDir=$PWD; cd'
alias b='tempDir=$PWD; cd $lastDir; lastDir=$tempDir'
alias de='c $Desktop'
alias home='c $HOME'
alias df='c $HOME/dotfiles'
alias ..='c ..'

# Git
alias rs='git add -NA; git reset --hard'
alias rss='git reset'
alias cl='git clone'
alias st='clear; git status'
alias lg='clear; git log -5 --oneline'
alias lgo='clear; git log -5 --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias lgg='lg --graph --decorate'
alias add='git add -A'
alias com='git commit -sm'
alias con='git commit -s --no-edit'
alias ame='add; git commit --amend'
alias am='ame --no-edit'
alias ps='git push'
alias psf='git push --force-with-lease'
alias currentBranch='git branch --show-current'
alias psu='ps --set-upstream origin `currentBranch`'
alias pl='git pull'
alias plr='git pull --rebase'
alias cont='git rebase --continue'
alias fc='git fetch'
alias printLines="awk '{print NR \":\" \$0}'"
alias br='clear; git branch | printLines'
bra(){ fc; if [[ -z $1 ]]; then git branch -a | printLines; else git branch -a | printLines | g $1; fi; }
alias deleteBranch='git branch -D'
alias saveLastBranch='lastBranch=`currentBranch`'
alias createTempBranch='tempBranch=`currentBranch`'
alias saveTempBranch='lastBranch=$tempBranch'
numberRegex='^[0-9]+$'
brd(){ if [[ $1 =~ $numberRegex ]]; then deleteBranch `git branch | head -$1 | tail -1`; else deleteBranch $1; fi; br; }
ck(){ createTempBranch; if [[ $1 =~ $numberRegex ]]; then git checkout `git branch | head -$1 | tail -1` && saveTempBranch; else git checkout $1 && saveTempBranch; fi; }
cka(){ createTempBranch; if [[ $1 =~ $numberRegex ]]; then git checkout `git branch -a | head -$1 | tail -1 | sed 's/remotes\/origin\///'` && saveTempBranch; else git checkout $1 && saveTempBranch; fi; }
ckp(){ ck $1; pl; }
alias setup_main_branch='git show-branch master &> /dev/null && export MAIN_BRANCH=master || export MAIN_BRANCH=main'
alias ckpm='setup_main_branch; ckp $MAIN_BRANCH'
alias ckd='ckp develop'
alias ckb='saveLastBranch; git checkout -b'
alias back='createTempBranch; git checkout $lastBranch; saveTempBranch'
alias ac='add; com'
acp(){ ac "$1"; ps; }
acpu(){ ac "$1"; psu; }
alias acpf='acp fix'
alias macp='add; con; ps;'
alias cherry='git cherry-pick'
alias merge='git merge'
alias md='merge develop'
alias mmd='ckd; back; md'
alias mm='ckpm; back; git merge $MAIN_BRANCH'
alias aap='add; amend; push;'
alias gd='git diff'
stage(){ git reset --soft HEAD~$1; }
drop(){ git reset --hard HEAD~$1; }

#Auxiliary
alias h10='head -10'
alias t10='tail -10'
alias fds='ls -la /proc/$$/fd'
alias kil='kill -9 '

# Dotnet
alias dot='dotnet'
alias dotgen='dot aspnet-codegenerator'
alias dwr='dot watch run &'

# History
shopt -s histreedit
shopt -u histverify
export HISTIGNORE="&:[ ]*"
export HISTSIZE=10000
export HISTFILESIZE=10000
export Desktop=$HOME/Desktop

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

# Prompt, \t for time
# export PS1="\[\e[40;1;35m\]\t | \w \$ \[\e[m\]"
ps_branch() { currentBranch 2>/dev/null | awk '{print " ("$1")"}'; }
export PS1="\[\033[32m\]\w\[\033[33m\]\$(ps_branch)\[\033[00m\] $ "

# Suspending flow control in shell
stty -ixon
stty stop 'undef'
#set -o noclobber # disable overwriting files with >

# Setup
export PATH=$PATH:$HOME/dotfiles/scripts
source $HOME/dotfiles/flutter_completion.sh

# Random
alias clean='rm `f ".*sw[op]"`'
man(){ $1 --help; }
alias Log='v -c "Logs" -c "x"'
alias flane="bundle exec fastlane"
alias fra='flutter analyze --no-preamble > $HOME/PycharmProjects/pythonProject/errors.txt'
alias frd='dart run dart_code_metrics:metrics analyze lib -r codeclimate | sed "s/\x00//g" | grep issue > $HOME/PycharmProjects/pythonProject/dcm.txt'

# fix ls on macOS
if [[ $OSTYPE == darwin* ]]; then alias ls=gls; fi;
