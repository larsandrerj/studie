#!/bin/zsh

echo "git pull"
git pull

echo "git add --all"
git add --all

echo "git commit"
git commit -m "$(date)"

echo "git push"
git push

clear
echo "git repository synchronised"
