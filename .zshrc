# Builtin Commands
bindkey -v    # viキーバインド
umask 022     # umask

# カラー表示
# LSCOLORSの設定は man ls 参照
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export GREP_OPTIONS='--color=auto'
case "${OSTYPE}" in
  freebsd*|darwin*)
    alias ls="ls -G"        # BSD系lsのカラー表示
    ;;
  linux*)
    alias ls="ls --color"   # GNU系lsのカラー表示
    ;;
esac
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # 補完候補もカラー表示

# エイリアス設定
alias ll='ls -la'           # 詳細一覧表示の簡易版
alias rm='rm -i'            # rm 要確認
alias mv='mv -i'            # mv 要確認
alias cp='cp -i'            # cp 要確認
alias ..='cd ..'            # 上位ディレクトリへ簡易版
alias vi='vim'              # viでvim起動
alias diff='colordiff'      # diffカラー表示
alias ssh='TERM=xterm ssh'  # 接続時のTERMを初期化
# F 画面内で表示可能であれば終了
# R 制御文字をエスケープせずに出力
# S 改行しない
# X 終了時に画面クリアしない
alias less='less -FRSX'

# ディレクトリ関連
setopt auto_cd            # ディレクトリ名入力で自動cd
setopt auto_pushd         # ディレクトリ移動時に自動pushd
setopt cdable_vars        # 変数展開する
setopt pushd_ignore_dups  # 同じディレクトリを重複pushしない

# 補完
fpath=($(brew --prefix)/share/zsh-completions $fpath)
autoload -Uz compinit && compinit # 補完有効化
setopt always_last_prompt         # 補完時にカーソル位置(行)を移動しない
setopt auto_list                  # 補完候補をリスト表示
setopt auto_menu                  # 補完キー連打で候補から自動補完
setopt auto_param_keys            # 括弧の対応などを自動補完
setopt auto_param_slash           # ディレクトリ補完で末尾/を付加
setopt auto_remove_slash          # 補完された/が不要の場合に自動削除
setopt complete_in_word           # ?
setopt complete_aliases           # 補完時にエイリアスを展開しない
setopt magic_equal_subst          # =以降も補完する
setopt list_types                 # 補完候補にファイル種別を表示
setopt list_packed                # 補完候補を詰めて表示
setopt no_list_beep               # 補完時にbeep鳴らさない
setopt correct                    # コマンドのスペルチェック有効化
setopt correct_all                # コマンドライン全てでスペルチェック有効化
setopt print_eight_bit            # 出力時に8bitを通す(日本語ファイル名表示対応)
zstyle ':completion:*:default' menu select=1          # タブ連打で矢印キーでの選択可
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'   # 補完時は大文字/小文字区別しない
zstyle ':completion:*:processes' command 'ps x'       # killで補完

# コマンド履歴
export HISTFILE=~/.zsh_history  # 履歴保存先パス
export HISTSIZE=10000           # 履歴保存件数(メモリ内)
export SAVEHIST=10000           # 履歴保存件数
setopt append_history           # 履歴を追記する
setopt extended_history         # 履歴に時刻を追加
setopt hist_ignore_dups         # 直前と同じコマンドは記録しない
setopt hist_ignore_space        # 先頭がspaceの場合は記録しない
setopt hist_no_store            # historyコマンドは履歴に残さない
setopt share_history            # 履歴を共有する

# その他
setopt numeric_glob_sort        # ファイル名展開で数値順ソート
setopt extended_glob            # glob拡張有効化
setopt brace_ccl                # {}内の文字をASCIIコード順に展開
setopt no_flow_control          # Ctrl+S/Qのフロー制御無効化
setopt ignore_eof               # Ctrl+Dでログアウトしない
setopt no_beep                  # beep音鳴らさない

autoload -U url-quote-magic     # URL文字列を自動でエスケープ
zle -N self-insert url-quote-magic

# 環境個別設定を読み込む (.zshrc.mine)
if [[ -s $HOME/.zshrc.mine ]] ; then source $HOME/.zshrc.mine ]] ; fi

# Prompt
# See: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
autoload -U colors && colors
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
setopt transient_rprompt  # 現在のプロンプトのみRPROMPTを表示
setopt prompt_subst       # PROMPT内の変数を展開
unsetopt promptcr

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' check-for-changes true

function _update_vcs_info_msg() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg

# pecoで履歴検索
# http://blog.kenjiskywalker.org/blog/2014/06/12/peco/
function peco-select-history() {
  typeset tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(\history -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen

}
zle -N peco-select-history
bindkey '^r' peco-select-history

# 特定のコマンドは履歴を残さない
function zshaddhistory() {
    local line=${1%%$'\n'}
    [[ ${#line} -ge 5 && ${line} != (cd|pwd|ls|ls -la|ll|vi|exit) ]]
}

# PROMPT設定
if [ "$TERM" != "dumb" ] ; then
    # 通常時プロンプト
    # %n    ユーザ名
    # %m    ホスト名(最初の.まで)
    PROMPT="[%n@%m] $ "
    # 右側プロンプト
    # %d    カレントディレクトリ
    RPROMPT="%d%1(v| %F{cyan}%1v%f|)"
fi

# 入力したコマンドをウィンドウタイトルに設定 (ステータス行に表示)
preexec () {
  # 環境変数STYでscreenセッションであるかを判別
  # <esc>k<esc>\ でwindowsのtitleを変更できる
  # ${1%% *} で入力されたコマンドの最初の空白までを抽出する
  [ ${STY} ] && echo -ne "\ek${1%% *}\e\\"
}

# tmux起動
source "$HOME/.zsh/functions/tmux.zsh"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
