# ls
alias ls="ls --color=auto -F -t" # Add characters (@, /, etc) to filenames, Colorize, sort by modification time
alias la='ls -a' # Show hidden files
alias ll='ls -al' # Long listing format
alias lsize='ls --human-readable --size -1 -S --classify' # Show filesizes in human readable format

# tree
alias tree="tree -CF" # Add characters (@, /, etc) to filenames, Colorize

# grep
alias grep="grep --color=auto -i" # colorize, ignore case

# Editing
alias edit="$EDITOR"

alias hg='history | grep'
alias copy="xclip -selection clipboard"

# an "alert" alias for long commands: longrunningcommand; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias ps="ps -t"
alias ports="sudo lsof -i -P -n | grep LISTEN" # Shows open ports
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

# sending mail from the CLI
# echo "body" | mail -s "subject" -a attatchment.txt -c cc'd@email.com -b bcc's@email.com recipient@email.com

# Creates a file from a template, and replaces a few variables
create() {
	# template file is the first argument
	# new file is the second argument
	template_file=$1
	new_file=$2
	# if no second argument, use the template file name with a .new extension
	if [ -z "$new_file" ]; then
		new_file=$template_file.new
	fi
	# if the template file doesn't exist in ~/Templates, exit
	if [ ! -f ~/Templates/$template_file ]; then
		echo "Template file ~/Templates/$template_file doesn't exist"
		return
	fi

	# copy ~/Templates/template_file to new_file
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

# Extract from any archive type: `extract my_archive.zip` etc, etc
extract() {
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

# Web Browser
alias browser="$BROWSER"

# Git + Github
alias gh-token="echo $GH_TOKEN | copy"
repo() {
    cp -r ~/Templates/repo $1
    builtin cd $1
    git init -b main

    repo="$1"
    date=$(date "+%Y-%m-%d")

    for file in *.*; do
      sed -i "s/{repo}/$repo/g" $file
      sed -i "s/{date}/$date/g" $file
    done

    echo -e "Make initial changes, then run:\n\n  $ initial-commit\n"
}
alias initial-commit="gh-token;gh repo create; git add .;git commit -m \"initial commit\";git push"
alias branch="git branch --show-current"
function commit-multiline {
	echo "Commit message:"
	cat > /tmp/commit-message.txt
	git commit -F /tmp/commit-message.txt
}
alias mit="license MIT"

# Raspberry Pi
alias pi="ssh raspi" # Check the ~/.ssh/config file the edit the host

# CD
function cd {
	builtin cd "$@"
	ls # list directory after every cd
}
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."

# This file
export ALIASES_FILE="$HOME/.bashrc.d/03_aliases.sh"
alias aliases="cat $ALIASES_FILE"
alias aliases-edit="edit $ALIASES_FILE"

# Fun
alias typeit="pv -qL 200" # cat file | typeit
alias starwars="telnet towel.blinkenlights.nl"
alias toboo="python -m toboo" # github.com/coderkearns/toboo
