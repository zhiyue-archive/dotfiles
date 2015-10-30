#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we're using the latest source-list
apt-get update

#upgrade any already-installed formulae
apt-get upgrade --all

# install sublime text 3
echo "begin install install sublime text 3"
add-apt-repository ppa:webupd8team/sublime-text-3
apt-get update
apt-get install sublime-text-installer
echo "finish installed sublime text 3"

# install git
echo "begin install git"
apt-get install git
echo "finish install git"

# install vim
echo "begin install vim"
apt-get install vim
echo "finish install vim"
