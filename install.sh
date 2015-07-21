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
lnif $CURRENT_DIR/config/dircolors-solarized/dircolors.256dark $HOME/.dir_colors



#Copy tmux config to home:
lnif $CURRENT_DIR/.tmux.conf $HOME/.tmux.conf
echo "cd $CURRENT_DIR/vendor/tmux-mem-cpu-load && cmake . && make && make install"


