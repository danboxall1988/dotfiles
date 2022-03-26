#export PATH="$PATH:/home/dan/.local/bin"

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

alias memclr="sudo > /var/log/syslog && sudo > /var/log/kern.log"
alias v="vim ~/.vimrc"
alias vb="vim ~/.bash_aliases"
alias vin="vim +PluginInstall +qall"
alias gpp="g++"
alias 'r'="source ~/.bashrc"
alias 'e'="exit"
alias install="sudo apt install"
alias remove="sudo apt purge"
alias python="python3"
alias c="clear"
