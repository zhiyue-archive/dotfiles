#!/usr/bin/env bash

#  Ask for the administrator password upfront.
sudo -v

#  Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#install some tools
apt-get install curl
apt-get install wget
apt-get install git

#  install zsh
apt-get install zsh
chsh -s /bin/zsh  #set up default shell to zsh

# install tmux
apt-get install tmux

# install ctags
apt-get install ctags


#   YouCompleteMe 依赖
## 1. Install development tools and CMake
apt-get install build-essential cmake 
apt-get install libffi-dev
apt-get install python-dev
