# Colors
export BOLD=$(tput bold)
export RESET=$(tput sgr0)

export BACK=$(tput setaf back)
export RED=$(tput setaf 1)
export GREEN=$(tput setaf 2)
export YELLOW=$(tput setaf 3)
export BLUE=$(tput setaf 4)
export MAGENTA=$(tput setaf 5)
export CYAN=$(tput setaf 6)
export ORANGE=$(tput setaf 7)
export LIGHT_RED=$(tput setaf 9)
export LIGHT_GREEN=$(tput setaf 10)
export LIGHT_YELLOW=$(tput setaf 11)
export LIGHT_BLUE=$(tput setaf 12)
export LIGHT_MAGENTA=$(tput setaf 13)
export LIGHT_CYAN=$(tput setaf 14)
export LIGHT_ORANGE=$(tput setaf 15)

export BG_BACK=$(tput setab back)
export BG_RED=$(tput setab 1)
export BG_GREEN=$(tput setab 2)
export BG_YELLOW=$(tput setab 3)
export BG_BLUE=$(tput setab 4)
export BG_MAGENTA=$(tput setab 5)
export BG_CYAN=$(tput setab 6)
export BG_ORANGE=$(tput setab 7)
export BG_LIGHT_RED=$(tput setab 9)
export BG_LIGHT_GREEN=$(tput setab 10)
export BG_LIGHT_YELLOW=$(tput setab 11)
export BG_LIGHT_BLUE=$(tput setab 12)
export BG_LIGHT_MAGENTA=$(tput setab 13)
export BG_LIGHT_CYAN=$(tput setab 14)
export BG_LIGHT_ORANGE=$(tput setab 15)

# Fancy powerline unicode symbols
export SEPERATOR=""

# Prompt
source "$(dirname "${BASH_SOURCE[0]}")/scripts/git-prompt.sh" # add the __git_ps1 function
export GIT_PS1_SHOWDIRTYSTATE=1 # show unstaged changes as "*" and staged changes as "+"
# export GIT_PS1_SHOWUPSTREAM=1 # show unpushed changes as ">", unpulled changes as "<", diverged remote and local "<>", and same remote and local as "="
export PS1='\[$BOLD\]\[$RED\]\u@\h\[$RESET\] \[$BOLD\]\[$GREEN\]\d \t\[$RESET\] \[$YELLOW\]\W\[$RESET\]\[$CYAN\]`__git_ps1 " (%s)"`\[$RESET\]\n\[$YELLOW\]\!\[$RESET\] \[$BOLD\]\\$\[$RESET\] '
# This is a powerline PS1 - it requires a nerd font
# export PS1='\[$BG_RED$BACK\] \u@\h \[$RED$BG_GREEN$SEPERATOR$BACK\] \W \[$GREEN$BG_YELLOW\]`__git_ps1 "\[$BG_CYAN$SEPERATOR$BACK\] %s \[$CYAN$BG_YELLOW\]"`\[$SEPERATOR$BACK$RESET$BG_YELLOW$BACK\] \! \[$YELLOW$BG_ORANGE$SEPERATOR$BACK\] \$ \[$RESET$ORANGE$SEPERATOR$RESET\] '

# Vars
export PROJECTS="$HOME/projects"
export EDITOR="code"
export BROWSER="firefox"
export GH_USER="coderkearns"
export COPY_CMD="xclip -selection clipboard"
