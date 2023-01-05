" Turn vi compatibility mode off
if &compatible
  set nocompatible
endif

" Reset AutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

"--------------------------------------
" Dein Settings
"--------------------------------------
filetype off

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:toml_dir          = fnamemodify(resolve(expand('<sfile>')), ':h') . '/dein'
let s:plugins_toml      = s:toml_dir . '/plugins.toml'
let s:plugins_lazy_toml = s:toml_dir . '/plugins_lazy.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:plugins_toml, s:plugins_lazy_toml])
  call dein#load_toml(s:plugins_toml,      { 'lazy': 0 })
  call dein#load_toml(s:plugins_lazy_toml, { 'lazy': 1 })
  call dein#end()
  call dein#save_state()
endif

" auto install
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

"--------------------------------------
" Basic Settings
"--------------------------------------
let &termencoding = &encoding
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932
scriptencoding utf-8

set ambiwidth=double

" 現在のモードを(最下段に)表示
set showmode
set showcmd
set title
" 行番号を表示
set number
" ルーラ有効
set ruler
" ステータスライン表示 (0:非表示, 1:ウィンドウが2つ以上ある場合に表示, 2:常時表示)
set laststatus=2
" ステータスラインの表示要素
" %=    左右の区切り位置指定
" %m    編集済の場合は[+]を表示. 編集不可の場合は[-]を表示
" %r    readonlyの場合には[RO]を表示
" %h    ヘルプ表示時は[help]を表示
" %w    プレビュー表示時は[Preview]を表示
" &fenc ファイルエンコーディング
" &enc  エンコーディング
" &ff   ファイルフォーマット
" %l    行番号
" %c    列番号
" %V    マルチバイト文字などを含む場合の仮想列番号 (通常時と同じ場合は表示しない)
" %8P   表示部分が全体の何%に位置するか(8桁表示)
set statusline=%=%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l/%L,%c%V%8P
" 不可視文字(タブ, 行末など)を表示する
set list
" listでの各要素の表示方法を指定する
" tab:      タブ(空白2文字)
" extends:  折り返し無効の場合にウィンドウ外に省略された文字がある場合の表示
" trail:    行末空白
set listchars=tab:\ \ ,extends:<,trail:-
" 行が画面内に収まらない場合でも可能な限り表示する
set display=lastline
" マウス無効
set mouse=

"--------------------------------------
" Search Settings
"--------------------------------------
" インクリメンタルサーチ有効
set incsearch
" 検索結果をハイライト
set hlsearch
" 大文字/小文字は無視して検索
set ignorecase
" 大文字で始めた場合には大文字/小文字を区別する
set smartcase

" 新しい行のインデントを現在の行と同じにする
set autoindent
" 括弧やコメント, 予約語のある行などで自動インデント
set smartindent
" C言語的な自動インデント
set cindent
" BackSpaceでインデントや改行などを削除可能にする
set backspace=indent,eol,start
" 対応する括弧を表示
set showmatch
" showmatchまでの待ち時間(1/10sec)
set matchtime=1
set wildmenu
set shortmess+=I

"--------------------------------------
" Other Settings
"--------------------------------------
" タブをスペースで置き換える
set expandtab
" タブ文字を空白2文字で表示する
set tabstop=2
" 自動インデントやシフト(>>, <<)での挿入数
set shiftwidth=2
" <Tab>キーを押した場合の挿入数 (0の場合はtabstopと同じ)
set softtabstop=2
set shiftround
set smarttab
" 編集中ファイルを保存しないでも他ファイル表示可能にする
set hidden
" バックアップを作成しない
set nobackup
" Undo履歴を保存しない
set noundofile
" ファイル末尾まで検索したら先頭に戻る
set wrapscan
" カーソル行の強調表示
set cursorline
" 未編集時に外部で編集された場合には自動的に再読込
set autoread
set scroll=3
set scrolloff=15
" 指定キーでは行頭/行末の回り込みを許可
" b, s          BackSpace, Space (Normal/Visual)
" h, l          h, l (Normal/Visual)
" <, >          Left, Right (Normal/Visual)
" [, ]          Left, Right (Insert/Replace)
set whichwrap=b,s,h,l,<,>,[,]
" クリップボードを共有
set clipboard+=unnamed,autoselect
" 補完時にプレビューウィンドウを表示しない
set completeopt-=preview
" 補完メニューの高さ
set pumheight=10
set visualbell t_vb=

" ファイルタイプ毎のインデント有効化
filetype indent on
" ファイルタイプ毎のプラグイン有効化
filetype plugin on
" シンタックスカラーリング有効化
syntax on

augroup vimrc
  autocmd!
  " vimgrep時にQuickFixを開く
  autocmd QuickFixCmdPost vimgrep cw
  " 前回終了時のカーソル行に移動
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " 保存時に行末の空白を除去
  autocmd BufWritePre * :%s/\s\+$//ge

  " 拡張子毎のタブ・空白設定
  autocmd FileType java       setlocal nowrap tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType php        setlocal nowrap tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType css        setlocal nowrap tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType html       setlocal nowrap tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType javascript setlocal nowrap tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType text       setlocal nowrap textwidth=0
  " 閉じタグ補完
  autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>

  " 拡張子指定でのFileType変更
  autocmd BufNewFile,BufRead *.pcss setfiletype scss
augroup END

" matchit
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

"--------------------------------------
" MS Word
"--------------------------------------
augroup vimrc_msword
  autocmd!
  autocmd BufReadPre  *.doc set readonly
  autocmd BufReadPost *.doc silent %!/usr/local/bin/antiword -m UTF-8.txt '%'
augroup END

"--------------------------------------
" Other key maps
"--------------------------------------
" <Esc>キー2回で検索結果ハイライトを無効化
nmap <Esc><Esc> <Esc>:nohlsearch<CR>:redraw!<CR><Esc>
vnoremap _ :w !nkf -Ws\|pbcopy<CR><CR>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap j gjzz
nnoremap k gkzz
" Tabで対応ペアに移動
nnoremap <Tab> %
vnoremap <Tab> %
" 大文字でも保存/終了コマンドを受け付ける
cnoremap W<CR> w<CR>
cnoremap Q<CR> q<CR>
cnoremap Wq wq
" 誤爆防止
nnoremap q: <NOP>
" sudoで保存
cmap w!! w !sudo tee > /dev/null %

" " カーソルキーのシーケンスを打ち消す
nmap OA <Up>
nmap OB <Down>
nmap OC <Right>
nmap OD <Left>
" 英字キーボードでの ; -> : 変換
nnoremap ; :
" 挿入モードでも jj でノーマルモードに遷移する
inoremap jj <ESC>
" 数字のインクリメント/デクリメント
nnoremap <F8> <C-a>
nnoremap <F7> <C-x>

" ファイル名の変更
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

" 日付の挿入
nnoremap <F6> <ESC>i<C-R>=strftime("[%Y/%m/%d]")<CR><CR>
inoremap <F6> <C-R>=strftime("%Y%m%d%H%M")<CR>

" 相対行番号の表示切り替え
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>

"--------------------------------------
" Custom Commands
"--------------------------------------
" jqでフォーマット
command FormatJson :%!jq '.'
" 行末のCR(^M)を一括削除
command RemoveCR :%s///g
" Unixファイルフォーマットで開き直す
command ReopenWithUnixFileFormat :e ++ff=unix

"--------------------------------------
" Local settings
"--------------------------------------
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
