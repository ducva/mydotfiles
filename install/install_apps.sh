#!/usr/bin/env bash

echo "set default application dir"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew tap homebrew/cask-versions

#  editors
brew cask install visual-studio-code-insiders

# ultilties
brew cask install alfred

# cvs
brew cask install sourcetree
brew install git-extras

# communications
brew cask install skype
brew cask install slack-beta

# browser
brew cask install google-chrome-beta

# terminals
brew cask install alacritty
brew cask install iterm2-beta

# cleanup
brew cleanup
rm -f -r /Library/Caches/Homebrew/*
