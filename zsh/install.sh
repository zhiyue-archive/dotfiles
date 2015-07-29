#!/usr/bin/zsh

lnif() {
    if [ -e "$1" ]; then
       ln -sf "$1" "$2"
    fi
}


# refer  spf13-vim bootstrap.sh`
BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`



# dir_colors 
eval `dircolors ~/.dir_colors`

# set up zsh 

## 1. use oh-my-zsh
## 2. link .zshrc
## 3. link theme
lnif $CURRENT_DIR/oh-my-zsh $HOME/.oh-my-zsh
lnif $CURRENT_DIR/zshrc $HOME/.zshrc
lnif $CURRENT_DIR/zhiyue.zsh-theme $HOME/.oh-my-zsh/themes/zhiyue.zsh-theme

source $HOME/.zshrc

