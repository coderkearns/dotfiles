# Colors
export BOLD=$(tput bold)
export RESET=$(tput sgr0)

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

# Prompt
source "$(dirname "${BASH_SOURCE[0]}")/scripts/git-prompt.sh" # add the __git_ps1 function
export GIT_PS1_SHOWDIRTYSTATE=1 # show unstaged changes as "*" and staged changes as "+"
export GIT_PS1_SHOWUPSTREAM=1 # show unpushed changes as ">", unpulled changes as "<", diverged remote and local "<>", and same remote and local as "="
export PS1='\[$BOLD\]\[$RED\]\u@\h\[$RESET\] \[$BOLD\]\[$GREEN\]\d \t\[$RESET\] \[$YELLOW\]\W\[$RESET\]\[$CYAN\]`__git_ps1 " (%s)"`\[$RESET\]\n\[$YELLOW\]\!\[$RESET\] \[$BOLD\]\\$\[$RESET\] '

# Github
export GH_USER="coderkearns"

# Used by some programs. The browse, edit, and projects commands also use these.
export BROWSER="firefox"
export EDITOR="code"
export PROJECTS="$HOME/projects"
