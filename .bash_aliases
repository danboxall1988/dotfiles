#export PATH="$PATH:/home/dan/.local/bin"
# screenfetch
# neofetch
# for compiling single sfml test files without makefile
# can be used with either 2 arguments, in which case the first
# is the name of the cpp file and the second is the name of the
# output file. Or can be used with just the name of the cpp file,
# in which case the output file will be the name of the cpp file
# but stripped of the filename extension.
sfml() {
    if [ $# == 0 ]
    then 
        printf "not enough arguments\n"
    elif [ $# == 1 ]
    then
        trimmed=$(basename $1 .cpp)
        g++ $1 -o $trimmed -lsfml-graphics -lsfml-window -lsfml-system
    elif [ $# == 2 ]
    then
        g++ $1 -o $2 -lsfml-graphics -lsfml-window -lsfml-system
    else
        printf "too many arguments\n"
    fi
}

# Copy and then move to directory
cpg() {
    if [ -d "$2" ]
    then
        cp $1 $2 && cd $2
    else
        cp $1 $2
    fi
}

# Move and then go to directory
mvg() {
    if [ -d "$2" ]
    then
        mv $1 $2 && cd $2
    else
        mv $1 $2
    fi
}

# Create and go to directory
mkdirg() {
    mkdir -p $1
    cd $1
}

# List contents of directory after moving there
cd () {
    if [ -n "$1" ]
    then
        builtin cd "$@" && ls -a
    else
        builtin cd ~ && ls -a
    fi
}

# Clear the folders that keep filling
alias memclr="sudo > /var/log/syslog && sudo > /var/log/kern.log"

# Vim commands
alias v="vim ~/.vimrc"
alias vb="vim ~/.bash_aliases"
alias vin="vim +PluginInstall +qall"
alias sv="sudo vim"
alias workspace="vim -S"

# Easier than pressing g++
alias gpp="g++"

# Quick terminal commands
alias 'r'="source ~/.bashrc"
alias 'e'="exit"
alias c="clear"
alias install="sudo apt install"
alias remove="sudo apt purge"
alias update="sudo apt update"
alias python="python3"

# Changing directories
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Change to prev directory
alias bd="cd '$OLDPWD'"

# Quick delete of directory
alias rmd="rm -rfv"

# To see if a command is aliased, a file or a built-in command
alias checkcmd="type -t"

# Git commands
alias clone="git clone"
alias push="git push"
alias pull="git pull"
alias commit="git commit -m"
alias add="git add"

# Machine commands
alias off="shutdown -P"
alias reboot="shutdown -r"
