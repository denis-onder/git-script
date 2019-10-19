#!/usr/bin/env bash

function get_branch_name {
    # main string
    str=`git status | grep branch`
    # delimiter string
    delimiter=" "
    #length of main string
    strLen=${#str}
    #length of delimiter string
    dLen=${#delimiter}
    #iterator for length of string
    i=0
    #length tracker for ongoing substring
    wordLen=0
    #starting position for ongoing substring
    strP=0
    
    array=()
    while [ $i -lt $strLen ]; do
        if [ $delimiter == ${str:$i:$dLen} ]; then
            array+=(${str:strP:$wordLen})
            strP=$(( i + dLen ))
            wordLen=0
            i=$(( i + dLen ))
        fi
        i=$(( i + 1 ))
        wordLen=$(( wordLen + 1 ))
    done
    array+=(${str:strP:$wordLen})
    
    GIT_BRANCH_NAME=${array[-1]}
}

SCRIPT_PATH=`pwd`
cd $SCRIPT_PATH
get_branch_name
echo Commit message:
read GIT_COMMIT_MSG

git add . && git commit -m $GIT_COMMIT_MSG && git push origin $GIT_BRANCH_NAME