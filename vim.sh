# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Check for pip3
if test ! $(which pip3); then
  echo "Installing pip3"
  curl -O https://bootstrap.pypa.io/get-pip.py
  python3 get-pip.py --user
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi

# Install Vim vundle and plugins
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# vim +PluginInstall +qall

# Install Neovim
brew install neovim
# Install fzf for searching
brew install fzf
# Install plug in manager Plug-Vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
# Install Coc extensions
nvim +CocInstall\ coc-lists\ coc-eslint\ coc-json +qall 
# denite 
pip3 install --user pynvim 


# Tmux
brew install tmux # terminal multiplexer
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # tmux plugin manager

# Get Nerd Font to install for devicons
cd ~/Library/Fonts && curl -fLo "InconsolataGo Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/InconsolataGo/Regular/complete/InconsolataGo%20Nerd%20Font%20Complete.ttf

