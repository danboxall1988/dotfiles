#!/bin/bash

# ensure at least one file is added
if [ $# == 0 ]
then
    echo "You forgot to add the files!!!"
    exit 1
fi

# ensure all files exist
for file in $*
do
    if [ ! -f "$file" ]
    then
        echo "file $file does not exist!"
        exit 2
    fi
done

# if all files exist, add them
for file in $*
do
    git add $file
done

# commit and push the files
git commit -m 'update'

git push origin main
