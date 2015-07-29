#!/bin/bash

# refer  spf13-vim bootstrap.sh`
BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

lnif() {
    if [ -e "$1" ]; then
       ln -sf "$1" "$2"
    fi
}

#更新配置的子模块到最新版本
git submodule init
git submodule update
git submodule -q foreach git pull -q origin master


# dir_colors
cd $CURRENT_DIR/config/dircolors-solarized/
lnif $CURRENT_DIR/config/dircolors-solarized/dircolors.256dark $HOME/.dircolors
#eval `dircolors dircolors.256dark`
#echo "export TERM=xterm-256color">>$HOME/.bashrc
#source $HOME/.bashrc



# set up zsh

## 1. use oh-my-zsh
## 2. link .zshrc
## 3. link theme
system_shell=$SHELL
export SHELL="/bin/zsh"
#git clone git://github.com/zsh-users/antigen.git ${HOME}/.antigen
lnif $CURRENT_DIR/zsh/antigen $HOME/.antigen
lnif $CURRENT_DIR/zsh/oh-my-zsh $HOME/.oh-my-zsh
lnif $CURRENT_DIR/zsh/zshrc $HOME/.zshrc
lnif $CURRENT_DIR/zsh/zhiyue.zsh-theme $HOME/.oh-my-zsh/themes/zhiyue.zsh-theme
#source $HOME/.zshrc
export SHELL=$system_shell 

# change terminal theme to solarized
cd $CURRENT_DIR/config/gnome-terminal-colors-solarized/
./set_dark.sh


#Copy tmux config to home:
lnif $CURRENT_DIR/.tmux.conf $HOME/.tmux.conf
echo "cd $CURRENT_DIR/vendor/tmux-mem-cpu-load && cmake . && make && make install"


