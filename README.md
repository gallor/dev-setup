dev-setup
============

## Motivation

Setting up a new developer machine can be an **ad-hoc, manual, and time-consuming** process.  This repo aims to **simplify** the process with **easy-to-understand instructions** and **dotfiles/scripts** that **automate the setup** of:

* **OS X updates and Xcode Command Line Tools**
* **Developer tools**: Vim, bash, tab completion, curl, git, GNU core utils, Python, Ruby, etc
* **Developer apps**: iTerm2, Visual Studio Code, VirtualBox, Vagrant, Docker, Chrome, etc
* **VIM**: NVIM and TMUX development
* **AWS**: Amazon Web Services (AWS CLI, AWS SAM CLI)
* **Common data stores**: MySQL, PostgreSQL, MongoDB, Redis, and Elasticsearch
* **Javascript web development**: Node.js, JSHint, and Less
* **Java development**: Java, Eclipse, SDKManager 

You can also automate the process by [running a single setup script](#single-setup-script) to install and configure specified sections.

Credits: This repo builds on the awesome work from [Mathias Bynens](https://github.com/mathiasbynens) and [Nicolas Hery](https://github.com/nicolashery) and [Donne Martin](https://github.com/donnemartin).

## Section 1: Installation

### Single Setup Script

#### Running with Git

##### Clone the Repo

    $ git clone https://github.com/gallor/dev-setup.git && cd dev-setup

##### Run the setup.sh Script with Command Line Arguments

Since you probably don't want to install every section, the `setup.sh` script supports command line arguments to run only specified sections.  Simply pass in the scripts that you want to install.  Below are some examples.

Run all:

    $ ./setup.sh all

Runs all scripts

    $ ./setup.sh bootstrap osxprep brew osx

Run `bootstrap.sh`, `osxprep.sh`, `brew.sh`, and `osx.sh`, and `datastores.sh`:

    $ ./setup.sh bootstrap osxprep brew osx datastores

#### Running without Git

    $ curl -O https://raw.githubusercontent.com/gallor/dev-setup/master/setup.sh && ./setup.sh [Add ARGS Here]

**For more customization, you can [clone](#clone-the-repo) or [fork](https://github.com/gallor/dev-setup/fork) the repo and tweak the `.dots` script and its associated components to suit your needs.**

#### Scripts

* [setup.sh](https://github.com/gallor/dev-setup/blob/master/setup.sh)
    * Runs specified scripts
* [osxprep.sh](https://github.com/gallor/dev-setup/blob/master/osxprep.sh)
    * Updates OS X and installs Xcode command line tools
* [bootstrap.sh](https://github.com/gallor/dev-setup/blob/master/bootstrap.sh)
    * Syncs dev-setup to your local home directory `~`
* [brew.sh](https://github.com/gallor/dev-setup/blob/master/brew.sh)
    * Installs common Homebrew formulae and apps
* [vim.sh](https://github.com/gallor/dev-setup/blob/master/vim.sh)
    * Sets up NVIM and Tmux
* [aws.sh](https://github.com/gallor/dev-setup/blob/master/aws.sh)
    * Sets up AWS CLI
* [datastores.sh](https://github.com/gallor/dev-setup/blob/master/datastores.sh)
    * Sets up common data stores
* [web.sh](https://github.com/gallor/dev-setup/blob/master/web.sh)
    * Sets up JavaScript web development
* [java.sh](https://github.com/gallor/dev-setup/blob/master/java.sh)
    * Sets up Java and Android development

**Notes:**

* `setup.sh` will initially prompt you to enter your password.
* `setup.sh` might ask you to re-enter your password at certain stages of the installation.
* If OS X updates require a restart, simply run `setup.sh` again to resume where you left off.
* `setup.sh` will also prompt you if this is the first time you're running this script. If yes all dotfiles (currently in another repo) are synced to your local machine so `bootstrap.sh` can properly sync all the files.
* This repo is located at the [dotfiles](https://github.com/gallor/dotfiles.git) repo. I chose to split them out into different repos for to keep my dotfiles separate from computer setup.
* When installing the Xcode command line tools, a dialog box will confirm installation.
    * Once Xcode is installed, follow the instructions on the terminal to continue.
* `setup.sh` runs `brew.sh`, which takes awhile to complete as some formulae need to be installed from source.
* **When `setup.sh` completes, be sure to restart your computer for all updates to take effect.**

### bootstrap.sh script

The `bootstrap.sh` script will sync the dev-setup repo to your local home directory.  This will include customizations for Vim, bash, curl, git, tab completion, aliases, a number of utility functions, etc.  Section 2 of this repo describes some of the customizations.

#### Running with Git

First, fork or clone the repo.  The `setup.sh` script will pull in the latest version and copy the files to your home folder `~`:

    $ source setup.sh

To update later on, just run that command again.

Alternatively, to update while avoiding the confirmation prompt:

    $ set -- -f; source bootstrap.sh

#### Running without Git

To sync dev-setup to your local home directory without Git, run the following:

    $ cd ~; curl -#L https://github.com/gallor/dev-setup/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,LICENSE}

To update later on, just run that command again.

#### Optional: Specify PATH

If `~/.path` exists, it will be sourced along with the other files before any feature testing (such as detecting which version of `ls` is being used takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### brew.sh script

When setting up a new Mac, you may want to install [Homebrew](http://brew.sh/), a package manager that simplifies installing and updating applications or libraries.

Some of the apps installed by the `brew.sh` script include: Chrome, Firefox, VS Code, Dropbox, Evernote, Skype, Slack, VirtualBox, Vagrant, etc.  **For a full listing of installed formulae and apps, refer to the commented [brew.sh source file](https://github.com/gallor/dev-setup/blob/master/brew.sh) directly and tweak it to suit your needs.**

Run the `brew.sh` script:

    $ ./brew.sh

The `brew.sh` script takes awhile to complete, as some formulae need to be installed from source.

### datastores.sh script

To set up common data stores, run the `datastores.sh` script:

    $ ./datastores.sh

### web.sh script

To set up a JavaScript web development environment, Run the `web.sh` script:

    $ ./web.sh

### java.sh script

To set up an Android development/java environment, run the `java.sh` script:

    $ ./java.sh

