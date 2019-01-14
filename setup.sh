#!/usr/bin/env bash

function runDots() {
    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until the script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Run sections based on command line arguments
    for ARG in "$@"
    do
        if [ $ARG == "bootstrap" ] || [ $ARG == "all" ]; then
			echo ""
			echo "------------------------------"
			echo "Updating OSX and installing Xcode command line tools"
			echo "------------------------------"
			echo ""
			./osxprep.sh 

            echo ""
            echo "------------------------------"
            echo "Syncing the dev-setup and dotfiles repo to your local machine."
            echo "------------------------------"
            echo ""
			./bootstrap.sh
        fi
        if [ $ARG == "brew" ] || [ $ARG == "all" ]; then
            # Run the brew.sh Script
            # For a full listing of installed formulae and apps, refer to
            # the commented brew.sh source file directly and tweak it to
            # suit your needs.
            echo ""
            echo "------------------------------"
            echo "Installing Homebrew along with some common formulae and apps."
            echo "This might awhile to complete, as some formulae need to be installed from source."
            echo "------------------------------"
            echo ""
            ./brew.sh
        fi
        if [ $ARG == "osx" ] || [ $ARG == "all" ]; then
            # Run the osx.sh Script
            # I strongly suggest you read through the commented osx.sh
            # source file and tweak any settings based on your personal
            # preferences. The script defaults are intended for you to
            # customize. For example, if you are not running an SSD you
            # might want to change some of the settings listed in the
            # SSD section.
            echo ""
            echo "------------------------------"
            echo "Setting sensible OSX defaults."
            echo "------------------------------"
            echo ""
            ./osx.sh
        fi
        if [ $ARG == "pydata" ] || [ $ARG == "all" ]; then
            # Run the pydata.sh Script
            echo "------------------------------"
            echo "Setting up Python data development environment."
            echo "------------------------------"
            echo ""
            ./pydata.sh
        fi
        if [ $ARG == "aws" ] || [ $ARG == "all" ]; then
            # Run the aws.sh Script
            echo "------------------------------"
            echo "Setting up AWS development environment."
            echo "------------------------------"
            echo ""
            ./aws.sh
        fi
        if [ $ARG == "datastores" ] || [ $ARG == "all" ]; then
            # Run the datastores.sh Script
            echo "------------------------------"
            echo "Setting up data stores."
            echo "------------------------------"
            echo ""
            ./datastores.sh
        fi
        if [ $ARG == "web" ] || [ $ARG == "all" ]; then
            # Run the webdev.sh Script
            echo "------------------------------"
            echo "Setting up JavaScript web development environment."
            echo "------------------------------"
            echo ""
            ./web.sh 
        fi
        if [ $ARG == "java" ] || [ $ARG == "all" ]; then
            # Run the android.sh Script
            echo "------------------------------"
            echo "Setting up Java development environment."
            echo "------------------------------"
            echo ""
            ./java.sh
        fi
    done

    echo "------------------------------"
    echo "Completed running setup, restart your computer to ensure all updates take effect"
    echo "------------------------------"
}

function init() {

	# Check for Homebrew,
	# Install if we don't have it
	if test ! $(which brew); then
	  echo "Installing homebrew..."
	  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	
	# Make sure we’re using the latest Homebrew.
	brew update

	# Install Git
	brew install git

	# Cloning git repositories as I will be symlinking the dotfiles to the desktop so that changes can always be committed easily
	mkdir -P ~/dev/{js,java,python,git,lib}/workspace
    mkdir ~/dev/java/lib
	cd ~/dev/git 
	git clone https://github.com/gallor/dev-setup.git
	git clone https://github.com/gallor/dotfiles.git
	# curl -#L https://github.com/gallor/dev-setup/tarball/master | tar -xzv --strip-components=1 --exclude={README.md,LICENSE,CREDITS.md}
	# curl -#L https://github.com/gallor/dotfiles/tarball/master | tar -xzv --strip-components=1 --exclude={README.md,LICENSE,CREDITS.md}
}

echo "------------------------------"
read -p "Is this the first time running this script? (y/n) " -n 1;
echo "------------------------------"
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "------------------------------"
	echo "Init script will run and set up dev folders, git, homebrew and cloned repos"
	init
fi;
if [[ $REPLY =~ [Nn]$ ]]; then
	echo "------------------------------"
	echo "Init script will be skipped"
fi;

echo "------------------------------"
read -p "This script may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "------------------------------"
if [[ $REPLY =~ ^[Yy]$ ]]; then

	echo "------------------------------"
	echo "Please choose from the following list: bootstrap, osx, brew, datastores, web, or java.";
	echo "------------------------------"
	read response
	echo ""
    runDots $response
fi;

unset init;
unset runDots;