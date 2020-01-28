#!/usr/bin/env bash


#git pull origin master;


function doIt() {
    #rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    #    --exclude "README.md" --exclude "LICENSE" -avh --no-perms . ~;
    #source ~/.bashrc;
	if [[ ! -d ~/dev/git/dotfiles ]]; then
		FILES="$(ls -la)"
		for f in $FILES
		do
      if [ -d $(f) ]; then
        echo "Directory, skipping"
      else
        FILE="$(basename $f)"
        ln -s ${HOME}/dev/git/dotfiles/$FILE ${HOME}/$FILE;
      fi
    done
	fi
}

function syncNeovimAndRG() {
    if [[ ! -d ~/.config ]]; then
        mkdir -p ~/.config
    fi
    ln -s ${HOME}/dev/git/nvim ${HOME}/.config/nvim
    ln -s ${HOME}/dev/git/ripgrep ${HOME}/.config/ripgrep
}


if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
    syncNeovimAndRG;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
        syncNeovimAndRG;
    fi;
fi;
unset doIt;
unset syncNeovim;
