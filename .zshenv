# 環境変数
export LANG=ja_JP.UTF-8         # 日本語環境(ja_JP.UTF-8)
export EDITOR=vim               # デフォルトエディタ指定
export PAGER=less               # デフォルトページャ指定

# PATH
typeset -U path cdpath fpath manpath  # 重複パスは設定しない
path=(/usr/local/bin(N-/) /usr/local/sbin(N-/) ${path})

# perlbrew
if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
  source ~/perl5/perlbrew/etc/bashrc
fi

# phpenv
if [ -f ~/.phpenv/bin/phpenv ]; then
  export PATH=~/.phpenv/bin:$PATH
  eval "$(phpenv init -)"
fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# python
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENV_USE_DISTRIBUTE=true
export PIP_REQUIRE_VIRTUALENV=true
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi

# go
if [ -z "${GOPATH:-}" ]; then
  export GOPATH=$HOME/.go
fi
export PATH=$PATH:$GOPATH/bin

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODE_PATH=$HOME/.nodebrew/current/lib/node_modules

# 環境個別設定を読み込む (.zshenv.local)
if [[ -s $HOME/.zshenv.local ]] ; then source $HOME/.zshenv.local ]] ; fi
