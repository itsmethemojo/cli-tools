#!/bin/bash

#TODO add support for deep reverse search ../../.git etc

if [ ! -f .git/config ]; then
  echo 'no git repo';
  exit;
fi
REPOPATH=$(cat .git/config | grep -A1 '[remote "origin"]' | grep "github" | awk -F= '{print $2}')
#TODO difference between https checkout und ssh
GITHUB_PATH=$(echo $REPOPATH | awk -F: '{print $2}' | awk -F'.' '{print $1}')
BRANCH=$(git branch | grep \* | awk '{print $2}')

# TODO make runner customizable
firefox --new-tab "https://github.com/$GITHUB_PATH/tree/$BRANCH" &
