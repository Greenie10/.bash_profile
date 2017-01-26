# Path
# PATH=/usr/local/bin:$PATH/usr/local/mysql/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/git/bin:$PATH

# Add git branch
# https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# Enables a title to be given to terminal tab, no quotes needed
# Eg, title mySpecialTab
function title {
    echo -ne "\033]0;"$*"\007"
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

export PS1='\n\[\033[1;105;97m\] \t \[\033[0;49;35m\] \u\[\033[1;34m\]🌀 \[\033[0;35m\]\h\n\[\033[1;35m\]/\W/\[\033[0;35m\] (\[\033[1;34m\]$(parse_git_branch)\[\033[0;49;35m\]) ► \[\033[0m\]'
# 	0xE43	&#3651; 0xE51	&#3665; &#3631; 0xE2F
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'


# Show/Hide system files for Mavericks
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
# alias gl='git log --all --graph --decorate  $*'
# alias gl='git log --oneline --all --date=local --graph --decorate  $*'
# alias gl='git log --oneline --all --graph --decorate --pretty=format:"%cn committed %h on %cd" $*'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gd='git diff --color-words'
alias th='docker network rm $(docker network ls -q);usher run hot_clean;usher run hot_setup;usher run hot'
alias goodMorning='cd ~/Github;rm -rf titan;git clone git@github.com:findmypast/titan.git;docker network rm $(docker network ls -q);usher run setup'


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTCONTROL=erasedups
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
