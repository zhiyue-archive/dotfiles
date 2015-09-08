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


# alias
ALIASES_DIR="$CURRENT_DIR/zsh/aliases"
ALIASES_FILES=`ls $ALIASES_DIR/*aliases`
for f in $ALIASES_FILES
do
    F_NAME=`basename $f`
    ln -s $f ~/"."$F_NAME
done


echo "1.set up zsh"

## 1. use oh-my-zsh
## 2. link .zshrc
## 3. link theme
system_shell=$SHELL
export SHELL="/bin/zsh"
#git clone git://github.com/zsh-users/antigen.git ${HOME}/.antigen
if [ ! -d "$HOME/.antigen" ];then
    mkdir "$HOME/.antigen"
fi
mkdir -p $HOME/.antigen
lnif $CURRENT_DIR/zsh/antigen $HOME/.antigen/antigen
lnif $CURRENT_DIR/zsh/oh-my-zsh $HOME/.oh-my-zsh
lnif $CURRENT_DIR/zsh/zshrc $HOME/.zshrc
lnif $CURRENT_DIR/zsh/zhiyue.zsh-theme $HOME/.oh-my-zsh/themes/zhiyue.zsh-theme
lnif $CURRENT_DIR/zsh/zsh_aliases $HOME/.zsh_aliases
lnif $CURRENT_DIR/zsh/zprofile $HOME/.zprofile
lnif $CURRENT_DIR/zsh/zlogin $HOME/.zlogin
#source $HOME/.zshrc
export SHELL=$system_shell

echo "2.change terminal theme to solarized"
cd $CURRENT_DIR/config/gnome-terminal-colors-solarized/
./install.sh


echo "3.set up tmux "
#Copy tmux config to home:
lnif $CURRENT_DIR/config/tmux-config/.tmux.conf $HOME/.tmux.conf
lnif $CURRENT_DIR/config/tmuxinator/ $HOME/.tmuxinator
mkdir -p $HOME/.tmux/plugins
lnif $CURRENT_DIR/config/tpm $HOME/.tmux/plugins/tpm
tmux source $HOME/.tmux.conf
#lnif $CURRENT_DIR/config/tmux-config $HOME/.tmux

echo "4.install and setup Vim"
lnif $CURRENT_DIR/config/ycm_extra_conf.py $HOME/.ycm_extra_conf.py
sh -x $CURRENT_DIR/fonts/install.sh
sh -x $CURRENT_DIR/Vim/install.sh

echo "5.link config "
lnif $CURRENT_DIR/config/gitconfig $HOME/.gitconfig
lnif $CURRENT_DIR/config/gitmessage $HOME/.gitmessage
