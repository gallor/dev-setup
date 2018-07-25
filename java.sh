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

# Java related brews
brew install jenv # Java environment manager
brew install maven
brew install ant
brew install gradle

# Install Cask
brew install caskroom/cask/brew-cask

brew cask install java
brew cask install java9
brew cask install --appdir="~/Applications" intellij-idea
# brew cask install --appdir="~/Applications" android-studio
brew cask install --appdir="/Applications" eclipse-jee

brew install android-sdk

# Remove outdated versions from the cellar.
brew cleanup
