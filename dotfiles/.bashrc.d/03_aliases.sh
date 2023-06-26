### ENV VAR-BASED ###
function edit {
    "$EDITOR" "$@"
}

function browse {
    "$BROWSER" "$@"
}

function projects {
    cd "$PROJECTS"
}

### OVERLOADS AND SIMPLE OPTIONS ###

# ls
alias ls="ls --color=auto -F -t" # Add characters (@, /, etc) to filenames, Colorize, sort by modification time
alias la="ls -a" # Show hidden files
alias ll="ls -al" # Long listing format
alias lsize="ls --human-readable --size -1 -S --classify" # Show filesizes in human readable format

# tree
alias tree="tree -CF" # Add characters (@, /, etc) to filenames, Colorize

# grep
alias grep="grep --color=auto -i" # colorize, ignore case


### GIT ###
function gh-token {
    # Copy my github token to the clipboard

    echo $GH_TOKEN | $COPY_CMD
}

function my {
    # Clone one of my repos easily (using $GH_USER)
    # Usage: my <repo-name> [<destination>]

    gh-token
    git clone https://github.com/$GH_USER/$1 $2
}

alias push="gh-token; git push"
alias branch="git branch --show-current"

### MISC ###
alias hg='history | grep'
alias ps="ps -t"
alias ports="sudo lsof -i -P -n | grep LISTEN" # Shows open ports
alias pi="ssh raspi" # Check the ~/.ssh/config file the edit the host

alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."

# This file
export ALIASES_FILE="$HOME/.bashrc.d/03_aliases.sh"
alias aliases="cat $ALIASES_FILE"
alias aliases-edit="edit $ALIASES_FILE"


### DATABASE ###
alias psql-user="sudo -u postgres psql"


### FUN ###
alias typeit="pv -qL 200" # cat file | typeit
alias starwars="telnet towel.blinkenlights.nl"
alias toboo="python -m toboo" # github.com/coderkearns/toboo


### FUNCTIONS ###
function cd {
	builtin cd "$@"
	ls # list directory after every cd
}

function touch {
	# Automatically create missing directories to speed things up: EX touch ./new/dir/that/doesnt/exist/myfile.txt will create ./new, ./new/dir, ...

	# --help or -h:
	if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
		/usr/bin/touch --help
		return
	fi
	for arg in "$@"
	do
		mkdir -p $(dirname $arg)
		/usr/bin/touch $arg
	done
}

function create {
    # Create a file from a template and replace some variables
    # usage: create <~/Templates/ file> <new file>

	template_file=$1
	new_file=$2

    # if the template file doesn't exist in ~/Templates, exit
	if [ ! -f ~/Templates/$template_file ]; then
		echo "Template file ~/Templates/$template_file doesn't exist"
		return
	fi

	# if no second argument, use the template file name with a .new extension
	if [ -z "$new_file" ]; then
		new_file=$template_file.new
	fi

	cp ~/Templates/$template_file $new_file

	# replace the following variables in the new file
	# %USER% with the current user
	# %DATE% with the current date (in YYYY-MM-DD format)
	# %TIME% with the current time (in HH:MM:SS AM/PM format)
	# %NAME% with the current file name
	sed -i -e "s/%USER%/$USER/g" $new_file
	sed -i -e "s/%DATE%/$(date +%Y-%m-%d)/g" $new_file
	sed -i -e "s/%TIME%/$(date '+%I:%M:%S %p')/g" $new_file
	sed -i -e "s/%NAME%/$(basename $new_file)/g" $new_file

	echo "Created '$new_file' from '$template_file' template"
    edit $new_file
}

function extract {
    # Extract from any archive type
    # usage: extract <archive>

	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)  tar xjf $1;;
			*.tar.gz)   tar xzf $1;;
            *.tar.xz)   tar xf $1;;
			*.bz2)      bunzip2 $1;;
			*.gz)       gunzip $1;;
			*.tar)	    tar xf $1;;
			*.tbz2)		tar xjf $1;;
			*.tgz)		tar xzf $1;;
			*.zip)	    unzip $1;;
			*.Z)		uncompress $1;;
			*.7z)		7z x $1;;
            *.rar)      unrar x $1;;
			*)			echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}


### COPIERS ###
function copy {
    $COPY_CMD $@
}
function copy-branch {
  git branch --show-current | $COPY_CMD
}

function copy-path {
  pwd | $COPY_CMD
}
