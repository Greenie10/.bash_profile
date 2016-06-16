# Path
# PATH=/usr/local/bin:$PATH/usr/local/mysql/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

# Add git branch
# https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# Colours
# http://misc.flogisoft.com/bash/tip_colors_and_formatting
# \n              = new line
# \[\033[         = start text formatting instruction
# 1;105;97        = bold;magenta bg;white text (see flogisoft link above)
# m\]             = end of text formatting instruction
# \t              = timestamp
# \u              = username
# \h              = host
# \W              = current directory

export PS1='\n\[\033[1;105;97m\] \t \[\033[0;49;35m\] \u\[\033[1;34m\]@\[\033[0;35m\]\h\n\[\033[1;35m\]/\W/\[\033[0;35m\] (\[\033[1;34m\]$(parse_git_branch)\[\033[0;49;35m\]) :-> \[\033[0m\]'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Show/Hide system files for Mavericks
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
