# Colors
export bold=$(tput bold)
export normal=$(tput sgr0)

export red=$(tput setaf 1)
export green=$(tput setaf 2)
export yellow=$(tput setaf 3)
export blue=$(tput setaf 4)
export magenta=$(tput setaf 5)
export cyan=$(tput setaf 6)
export orange=$(tput setaf 7)
export light_red=$(tput setaf 9)
export light_green=$(tput setaf 10)
export light_yellow=$(tput setaf 11)
export light_blue=$(tput setaf 12)
export light_magenta=$(tput setaf 13)
export light_cyan=$(tput setaf 14)
export light_orange=$(tput setaf 15)

# Prompt
source "$(dirname "${BASH_SOURCE[0]}")/scripts/git-prompt.sh"
export PS1='\[$bold\]\[$red\]\u@\h\[$normal\] \[$bold\]\[$green\]\d \t\[$normal\] \[$yellow\]\W\[$normal\]\[$cyan\]`__git_ps1 " (%s)"`\[$normal\]\n\[$yellow\]\!\[$normal\] \[$bold\]\\$\[$normal\] '

# Github
export GH_USER="coderkearns"

# Used by some programs. The edit and browse commands also use these.
export BROWSER="firefox"
export EDITOR="code"
export PROJECTS="$HOME/projects"
