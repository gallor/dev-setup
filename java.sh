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
brew install ant
brew install gradle

# Install Cask
brew install caskroom/cask/brew-cask

brew cask install java
# brew cask install --appdir="~/Applications" intellij-idea
brew cask install --appdir="~/Applications" android-studio
brew cask install --appdir="/Applications" eclipse-jee

# brew install android-sdk

# Remove outdated versions from the cellar.
brew cleanup

# Download maven directly from source
if [-d ~/dev/java/lib ]; then
    curl -o ~/dev/java/lib/maven.zip http://ftp.wayne.edu/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.zip
    curl -o ~/dev/java/lib/maven-archetype.xml http://repo1.maven.org/maven2/archetype-catalog.xml
else
    curl -o ~/Desktop/maven.zip http://ftp.wayne.edu/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.zip
    curl -o ~/Desktop/maven-archetype.xml http://repo1.maven.org/maven2/archetype-catalog.xml
fi
echo "==========================================================="
echo "Ensure MAVEN_HOME is set properly to point to this location"
echo "==========================================================="
