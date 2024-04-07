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
if [[ "$(uname)" == "Darwin" && "$(uname -m)" == "arm64" ]]; then
  BREW_PATH_PREFIX=/opt/homebrew
else
  BREW_PATH_PREFIX=/usr/local
fi
eval "$($BREW_PATH_PREFIX/bin/brew shellenv)"
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

# rust (cargo)
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

# google-cloud-sdk
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# mysql-client
path=($(brew --prefix)/opt/mysql-client/bin(N-/) $path)

# others
export GISTY_DIR="$HOME/Project/gists"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export PHP_CS_FIXER_IGNORE_ENV=1

# 環境個別設定を読み込む (.zshenv.local)
if [[ -s $HOME/.zshenv.local ]] ; then source $HOME/.zshenv.local ]] ; fi
