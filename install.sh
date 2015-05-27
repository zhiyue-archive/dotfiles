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


#设置终端的配色
echo "Step0: setting up terminal color"
lnif $CURRENT_DIR/config/dircolors-solarized/dircolors.256dark $HOME/.dircolors
echo "cd $CURRENT_DIR/config/gnome-terminal-colors-solarized && bash -x set_dark.sh "
cd $HOME && eval 'dircolors .dircolors'
