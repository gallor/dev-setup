#!/usr/bin/env bash


#git pull origin master;


function doIt() {
    #rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    #    --exclude "README.md" --exclude "LICENSE" -avh --no-perms . ~;
    #source ~/.bashrc;
	if [ -d ~/dev/git/dotfiles ]; then
		FILES="$(ls -la | grep -lr --exclude-dir=.git . ${HOME}/dev/git/dotfiles)"
		for f in $FILES
		do
		FILE="$(basename $f)"
		ln -s ${HOME}/dev/git/dotfiles/$FILE ${HOME}/$FILE;
		done
	fi
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
