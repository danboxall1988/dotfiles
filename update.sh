#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

fails=0     #fail counter
wins=0     #file counter


# ensure at least one file is added
if [ $# == 0 ]
then
    printf "\n${RED}Failed:${NC} You forgot to add the files!!!\n"
    exit 1
fi


printf "\n"


# ensure all files exist
for file in $*
do
    if [ ! -f "$file" ]
    then
        ((++fails))
        printf "file ${RED}$file${NC} does not exist!\n"
    else
        ((++wins))
    fi
done
printf "\n\n fails = $fails\n\n"


# if any of the files are non-existent, exit
if [ $fails != 0 ]
then
    printf "\n${RED}Failed:${NC} $fails files did not exist!\n"
    exit 2
fi


# if all files exist, add them
for file in $*
do
    git add $file
done


# commit and push the files
git commit -m 'update'
git push origin main


printf "\n${RED}SUCCESS!${NC} $wins files updated\n"
