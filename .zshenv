# 環境変数
export LANG=ja_JP.UTF-8         # 日本語環境(ja_JP.UTF-8)
export EDITOR=vim               # デフォルトエディタ指定
export PAGER=less               # デフォルトページャ指定

# PATH (See: man zshexpn)
#   N-/ ... NULL_GLOB, follow symlinks, directories
#   u ... Expand only the first occurrence of each unique word
#   A ... Turn a file name into an absolute path
typeset -U path cdpath fpath manpath  # 重複パスは設定しない
path=(
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  ${path}
)
path=( ${(u)path:A} )

# don't load global rc files (disable path_helper)
# append /etc/paths, /etc/paths.d, /etc/manpaths.d manually
setopt no_global_rcs

# homebrew
export PATH="$(brew --prefix)/bin:$PATH"

# perlbrew
if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
  source ~/perl5/perlbrew/etc/bashrc
fi

# *env
if which rbenv  > /dev/null; then eval "$(rbenv  init -)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

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

# others
export GISTY_DIR="$HOME/Project/gists"

# 環境個別設定を読み込む (.zshenv.local)
if [[ -s $HOME/.zshenv.local ]] ; then source $HOME/.zshenv.local ]] ; fi
