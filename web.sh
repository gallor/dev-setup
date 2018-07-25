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

brew install node
brew install go
brew install ruby
brew install gnupg # for verifying rvm key
brew install nvm


npm install -g jshint
# npm install -g grunt-cli
# npm install -g less
# npm install -g deployd

# Remove outdated versions from the cellar.
brew cleanup

# Install RVM
# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# \curl -sSL https://get.rvm.io | bash -s stable

# Set up Ruby Environment
gem update --system

# Install Compass, SCSS and JSON
gem install compass
gem install sass
gem install json

# Make nvm directory
mkdir ~/.nvm

# Install Development Fonts

if test ! $(which git); then
  echo "Installing Git..."
  brew install git
  git clone https://github.com/andreberg/Meslo-Font.git ~/Desktop/Meslo-Font
fi	

wget -P ~/Desktop https://github.com/google/fonts/blob/master/ofl/inconsolata/Inconsolata-Bold.ttf?raw=true
wget -P ~/Desktop https://github.com/google/fonts/blob/master/ofl/inconsolata/Inconsolata-Regular.ttf?raw=true
wget -P ~/Desktop https://github.com/powerline/fonts/blob/master/Inconsolata-g/Inconsolata-g%20for%20Powerline.otf?raw=true
