#!/usr/bin/env bash

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if ! [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted!"
    exit 0
fi;

cd "$(dirname "${BASH_SOURCE}")"

git pull origin main
rsync --exclude ".git/" --exclude "README.md" --exclude "LICENSE" --exclude "install.sh" -avh --no-perms . ~
source ~/.bash_profile

echo "Dotfiles installed successfully!"
