# Install Homebrew or make sure it's up to date
which -s brew
if [[ $? != 0 ]] ; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	brew update
	brew upgrade
fi

# Install formulae
brew install ag
brew install binutils
brew install ccache
brew install cloc
brew install cmake
brew install coreutils --with-default-names
brew install ctags
brew install doxygen
brew install findutils --with-default-names
brew install fish
brew install gdb
brew install git
brew install git-lfs
brew install gnu-sed --with-default-names
brew install go
brew install htop
brew install lcov
brew install libxml2
brew install lua
brew install macvim --with-override-system-vim
brew install ncdu
brew install neofetch
brew install ninja
brew install python
brew install radare2
brew install tig
brew install tree
brew install unrar
brew install valgrind
brew install wget --with-iri
brew install wireshark --with-qt5
brew install xz
brew install zsh

# Install casks
brew cask install vlc
brew cask install slack

# Cleanup
brew cleanup

# Link applications
brew linkapps