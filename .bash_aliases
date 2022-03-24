#export PATH="$PATH:/home/dan/.local/bin"

# for compiling sfml test files without makefile
sfml() {
    if [ $# != 2 ]
    then
        printf "not enough arguments\n"
    else
        g++ $1 -o $2 -lsfml-graphics -lsfml-window -lsfml-system
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
