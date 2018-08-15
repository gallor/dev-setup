#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# brew install go
# brew install ruby
# brew install gnupg # for verifying rvm key

# Remove outdated versions from the cellar.
brew cleanup

# Install RVM
# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# \curl -sSL https://get.rvm.io | bash -s stable

# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source .bashrc
if test $(which nvmm) then
    echo "Installing Node 8.6..."
    nvm install v8.6.0

npm install -g jshint
# npm install -g grunt-cli
# npm install -g less
# npm install -g deployd

gem update --system

# Install Compass, SCSS and JSON
gem install compass
gem install sass
gem install json

# Make nvm directory
mkdir ~/.nvm

# Install VSCode extensions
if brew cask info visual-studio-code &>/dev/null; then
    code --install-extension Zignd.html-css-class-completion
    code --install-extension hristian-kohler.npm-intellisense
    code --install-extension hristian-kohler.path-intellisense
    code --install-extension baeumer.vscode-eslint
    code --install-extension eerawan.vscode-dash
    code --install-extension onjayamanne.githistory
    code --install-extension zannotti.vscode-babel-coloring
    code --install-extension amodio.gitlens
    code --install-extension ormulahendry.code-runner
    code --install-extension rapeCity.gc-excelviewer
    code --install-extension ookyQR.beautify
    code --install-extension umao.rest-client
    code --install-extension eizongmin.node-module-intellisense
    code --install-extension ici.require-js
    code --install-extension rmlnc.vscode-less
    code --install-extension rmlnc.vscode-scss
    code --install-extension s-python.python
    code --install-extension sjsdiag.debugger-for-chrome
    code --install-extension atrys.vscode-code-outline
    code --install-extension Kief.material-icon-theme
    code --install-extension edhat.java
    code --install-extension leistner.vscode-fileutils
    code --install-extension ourcegraph.javascript-typescript
    code --install-extension scjava.vscode-java-debug
    code --install-extension scjava.vscode-java-pack
    code --install-extension scjava.vscode-java-test
    code --install-extension scjava.vscode-maven
    code --install-extension scodevim.vim
    code --install-extension yze.theme-hybrid-next
fi

# Install Development Fonts

if test ! $(which git); then
  echo "Installing Git..."
  brew install git
  git clone https://github.com/andreberg/Meslo-Font.git ~/Desktop/Meslo-Font
fi	

wget -P ~/Desktop https://github.com/google/fonts/blob/master/ofl/inconsolata/Inconsolata-Bold.ttf?raw=true
wget -P ~/Desktop https://github.com/google/fonts/blob/master/ofl/inconsolata/Inconsolata-Regular.ttf?raw=true
wget -P ~/Desktop https://github.com/powerline/fonts/blob/master/Inconsolata-g/Inconsolata-g%20for%20Powerline.otf?raw=true
