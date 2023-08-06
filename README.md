# Bash DotFiles
- .bash_profile
- .bashrc 
- .vimrc
- .minttyrc

Clone it into your $HOME folder and run `cd dotfiles; source update.sh`

On Windows:
- Install [git and bash](https://gitforwindows.org)

On MacOs
1. Install [brew](https://brew.sh/), then set PATH for it
2. Install bash and coreutils `brew install bash coreutils`
3. Create .custombashrc with contents:
```
eval "$(/opt/homebrew/bin/brew shellenv)"
# Flutter specific
export JAVA_HOME="/Applications/Android Studio Preview.app/Contents/jbr/Contents/Home"
export PATH=$PATH:$JAVA_HOME/bin:$HOME/src/flutter/bin:$HOME/.pub-cache/bin
```