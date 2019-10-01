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

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
brew install wget
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew tap homebrew/versions
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
# brew install ringojs # Ringo is a JavaScript platform built on the JVM and optimized for server-side applications
# brew install narwhal

# Install Python
brew install python
echo ==============================================================================
echo Make note of python install location and add to path to override system python
echo ==============================================================================

# Install other useful binaries.
brew install ack # Text search tool akin to grep
brew install ripgrep # recursive search tool by regex pattern
brew install tree # directory structure print out
brew install htop-osx # top with extra functionality
brew install dark-mode # Toggle the OS X Dark Mode from the command-line
brew install git-lfs # Git Large File Storage
brew install git-flow # Automate git branching workflow
brew install imagemagick --with-webp # Image editing
brew install ssh-copy-id # install your public key in a remote machine's authorized_keys
brew install trash # remove file to trash instead of delete
brew install webkit2png # Creates screenshots of webpages
brew install youtube-dl # youtube downloader
brew install exiv2 # image metadata library and tools
brew install cmake # make library
brew install tmux # terminal multiplexer
brew install the_silver_searcher # AG searching support in vim
brew install jq # json converter prettier
brew install nginx # nginx server
brew install task # taskwarrior
brew install tasksh # taskwarrior shell
# brew install lua # Powerful, fast, lightweight, embeddable scripting language
# brew install lynx # Terminal based web browser
# brew install p7zip
# brew install pigz 
# brew install pv # monitor process of data through a pipeline
# brew install rename # Perl based rename functionality
# brew install rhino # JavaScript written entirely in Java

# Exhuberant Ctags: universal ctags is not supported with js patterns for new syntax
brew install ctags-exuberant

# Apps
brew install dash # Docs

# Install Cask
brew tap caskroom/cask

# Utility tools

# Install QuickLook tools
brew cask install qlcolorcode # Preview source code files with syntax highlighting
brew cask install qlstephen # Preview plain text files without a file extension. Example: README, CHANGELOG, etc.
brew cask install qlmarkdown # Preview Markdown files
brew cask install quicklook-json # Preview JSON files
brew cask install qlprettypatch # Preview .patch files
brew cask install quicklook-csv # Preview CSV files
brew cask install betterzipql # Preview archives
brew cask install qlimagesize # Preview image size and dimensions
brew cask install webpquicklook # Preview Webp images
brew cask install suspicious-package # Preview contents of a standard Apple installer package

# System tools
brew cask install colorpicker-antetype
brew cask install functionflip

# Development tool casks
brew cask install --appdir="/Applications" jd-gui 
brew cask install --appdir="/Applications" diffmerge
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" robo-3t
brew cask install --appdir="/Applications" dash3
brew cask install --appdir="/Applications" postman
brew cask install --appdir="/Applications" fork
brew cask install --appdir="/Applications" charles
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" docker

# Misc casks
brew cask install --appdir="/Applications" bettertouchtool
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" keka
brew cask install --appdir="/Applications" google-backup-and-sync
brew cask install --appdir="/Applications" caffeine 
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" calibre
brew cask install --appdir="/Applications" evernote
brew cask install --appdir="/Applications" shifty
brew cask install --appdir="/Applications" handbrake
brew cask install --appdir="/Applications" mpeg-streamclip
brew cask install --appdir="/Applications" marshallofsound-google-play-music-player
brew cask install --appdir="/Applications" ffmpeg

# Remove outdated versions from the cellar.
brew cleanup
