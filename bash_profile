# Path
# PATH=/usr/local/bin:$PATH/usr/local/mysql/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

# Add git branch
# https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Colours
# http://misc.flogisoft.com/bash/tip_colors_and_formatting
export PS1='\n\e[1;105;97m \t \e[0;49;35m \u\e[1;34m@\e[0;35m\h\n\e[1;34m/\e[95m\W\e[34m/ $(parse_git_branch) :->\[\e[m\]  '
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Show/Hide system files for Mavericks
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
