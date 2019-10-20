#!/usr/bin/env bash

# Get path to the directory from which the script is being called
SCRIPT_PATH=`pwd`
cd $SCRIPT_PATH
# Get current git branch
GIT_BRANCH_NAME=`git rev-parse --abbrev-ref HEAD`
# ???
read -p "Commit message: " GIT_COMMIT_MSG
# Profit
git add . && git commit -m "$GIT_COMMIT_MSG" && git push origin $GIT_BRANCH_NAME