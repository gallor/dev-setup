#!/usr/bin/env bash


#git pull origin master;


function doIt() {
    if [[ -d ~/dev/git/dotfiles ]]; then
      pushd ~/dev/git/dotfiles
      FILES="$(ls -a)"
      echo $FILES
      for f in $FILES; do
        if [ -d $f ]; then
          echo $f
          echo "Directory, skipping"
        else
          ln -s ${HOME}/dev/git/dotfiles/$f ${HOME}/$f;
        fi
      done
      popd
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
