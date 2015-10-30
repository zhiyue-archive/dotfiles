#!/usr/bin/env bash

#install ruby
#curl -sSL https://get.rvm.io | bash -s stable   ## install RVM
#source /usr/local/rvm/scripts/rvm 
#rvm get stable
#rvm requirements 
#rvm install 2.2.0 

## install rbenv and ruby
curl https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
rbenv bootstrap-ubuntu-12-04
rbenv install 2.2.0
rbenv global 2.2.0

# install tmuxinator
gem sources --remove https://rubygems.org/
gem sources -a https://ruby.taobao.org/
gem sources -l
gem install tmuxinator


## 2. Install Python headers
git clone https://github.com/yyuu/pyenv.git ~/.pyenv 
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
