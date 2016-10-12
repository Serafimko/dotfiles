#!/bin/bash

printf "_____Installing virtualenv for python $1_____\n\n"

DIRECTORY="$1_env"

case $2 in
    2)
        PYTHON=/usr/bin/python2
        ;;
    3)
        PYTHON=/usr/bin/python3
        ;; 
esac
virtualenv -p $PYTHON $DIRECTORY --no-site-packages
printf "_____Initing git dir_____\n\n"

cd $DIRECTORY
git init

