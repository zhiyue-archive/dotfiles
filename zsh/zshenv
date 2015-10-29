export PATH="$PATH:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/bin:$HOME/bin:/usr/local/sbin:/usr/sbin"
export PATH=~/bin:~/.local/bin:$PATH


# pager
export PAGER="most"

# Editor
export EDITOR='vim'
export VISUAL="$EDITOR"

# Java setting
export JAVA_HOME=/usr/lib/jvm/java-8
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH

# ruby
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

### set up pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [ -n "$TMUX" ]; then
    export TERM="screen-256color"
elif ! `tty|grep -q "tty"`; then
    export TERM="xterm-256color"
else
    export TERM="linux"
fi
