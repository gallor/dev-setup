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
if test ! $(which nvm); then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
    source ~/.bashrc;
fi

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
    code --install-extension shan.code-settings-sync 
fi

echo "===================="
echo "To sync VSCode"
echo "Copy Gist Id"
echo "77359f81323c0b512ebe3a6df1db6ef1"
echo "to download settings"
echo "===================="

# Install Development Fonts

if test ! $(which git); then
  echo "Installing Git..."
  brew install git
  git clone https://github.com/andreberg/Meslo-Font.git ~/Desktop/Meslo-Font
fi	
