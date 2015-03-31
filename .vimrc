" Turn vi compatibility mode off
if &compatible
  set nocompatible
endif

"--------------------------------------
" Bundle Settings
"--------------------------------------
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
  \     'cygwin'  : 'make -f make_cygwin.mak',
  \     'mac'     : 'make -f make_mac.mak',
  \     'unix'    : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vinarise.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tyru/caw.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'vim-scripts/Colour-Sampler-Pack'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'fatih/vim-go'
NeoBundle 'groenewege/vim-less'
NeoBundle 'elzr/vim-json'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'castor4bit/inside-motion.vim'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'FuzzyFinder'
NeoBundle 'L9'
NeoBundle 'buftabs'
NeoBundle 'sudo.vim'
NeoBundle 'kana/vim-tabpagecd'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'cohama/vim-smartinput-endwise'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'techlivezheng/tagbar-phpctags'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'marijnh/tern_for_vim', {
  \ 'build': {
  \   'others': 'npm install'
  \}}
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'wombat256.vim'

call neobundle#end()

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
" 補完メニューの高さ
set pumheight=10
set visualbell t_vb=

" ファイルタイプ毎のインデント有効化
filetype indent on
" ファイルタイプ毎のプラグイン有効化
filetype plugin on
" シンタックスカラーリング有効化
syntax on

" カラースキーマ
set t_Co=256
colorscheme wombat256mod
hi Normal     ctermbg=232
hi ModeMsg    ctermfg=111
hi CursorLine ctermbg=none cterm=underline
hi MatchParen ctermbg=none

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
augroup END

"--------------------------------------
" ZenCoding
"--------------------------------------
let g:use_zen_complete_tag = 1

"--------------------------------------
" neocomplete
"--------------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case  = 0
let g:neocomplete#enable_cursor_hold_i = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_insert_char_pre = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#skip_auto_completion_time = '0.6'
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

augroup vimrc_neocomplete
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

imap     <expr><CR>    pumvisible() ? neocomplete#close_popup()  : "\<Plug>(smartinput_CR)"
inoremap <expr><Right> pumvisible() ? neocomplete#cancel_popup() : "\<Right>"
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
inoremap <expr><C-g>  neocomplete#undo_completion()
inoremap <expr><C-l>  neocomplete#complete_common_string()

"--------------------------------------
" NeoSnippet
"--------------------------------------
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
set completeopt-=preview

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"--------------------------------------
" Buftabs
"--------------------------------------
let g:buftabs_only_basename=1
let g:buftabs_in_statusline=1
let g:buftabs_active_highlight_group="Visual"

nnoremap <Space>   :bnext<CR>
nnoremap <S-Space> :bprev<CR>

"--------------------------------------
" NERD_comments
"--------------------------------------
let g:NERDSpaceDelims = 1
let g:NERDShutUp = 1

"--------------------------------------
" Syntastic
"--------------------------------------
let g:syntastic_mode_map = {
  \ 'mode': 'passive',
  \ 'active_filetypes':  ['php', 'ruby', 'javascript'],
  \ 'passive_filetypes': []
\}
let g:syntastic_javascript_checkers = ['eslint']

"--------------------------------------
" YankTmp
"--------------------------------------
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

"--------------------------------------
" caw
"--------------------------------------
nmap <Leader>c <Plug>(caw:I:toggle)
vmap <Leader>c <Plug>(caw:I:toggle)

"--------------------------------------
" unite.vim
"--------------------------------------
let g:unite_enable_start_insert=1
let g:unite_enable_ignore_case=1
let g:unite_enable_smart_case=1
let g:unite_source_grep_command='pt'
let g:unite_source_grep_default_opts='--nocolor --nogroup -S'
let g:unite_source_grep_recursive_opt=''
let g:unite_source_grep_encoding='utf-8'
let g:unite_source_grep_max_candidates=200
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> ,up :<C-u>Unite -buffer-name=files file_rec/async:!<CR>
nnoremap <silent> ,uo :<C-u>Unite outline<CR>
augroup vimrc_unite
  autocmd!
  autocmd FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
  autocmd FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
augroup END

"--------------------------------------
" VimFiler
"--------------------------------------
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_restore_alternate_file=0
nnoremap <silent> ,vf :<C-u>VimFilerBufferDir -split -simple -winwidth=30 -force-quit<CR>
nnoremap <silent> ,vp :<C-u>VimFiler -project -split -simple -winwidth=30 -force-quit<CR>
augroup vimrc_vimfiler
  autocmd!
  autocmd FileType vimfiler setlocal nobuflisted
  autocmd FileType vimfiler nmap <silent> <buffer> <ESC><ESC> Q
  autocmd FileType vimfiler nmap <silent> <buffer> <expr><CR> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
augroup END

"--------------------------------------
" QuickRun
"--------------------------------------
let g:quickrun_config={
\ '_': {
  \ 'split': '',
  \ 'hook/time/enable': '1',
  \ 'runner': 'vimproc',
  \ 'runner/vimproc/updatetime': 100,
\}}
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
set splitbelow

function! s:close_quickrun()
  for winnr in range(1,  winnr('$'))
    if getwinvar(winnr, '&filetype') == 'quickrun'
      execute winnr . 'wincmd w'
      execute winnr . 'wincmd c'
    endif
  endfor
endfunction

nnoremap tw :call <SID>close_quickrun()<CR>

augroup QuickRunCommands
  autocmd!
  " 保存時にquickrunを閉じる
  autocmd BufWritePre * call <SID>close_quickrun()
  " 最後にquickrunのみ残った場合は閉じる
  autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&filetype') == 'quickrun') | quit | endif
augroup END

"--------------------------------------
" tagbar
"--------------------------------------
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_foldlevel = 1
if has("mac")
  let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
  let g:tagbar_phpctags_bin = '~/.vim/tools/phpctags/phpctags'
endif
let g:tagbar_type_javascript = {
  \ 'ctagsbin' : '~/.nodebrew/current/bin/jsctags'
\ }
nnoremap <silent> <leader>tt :TagbarToggle<CR>

"--------------------------------------
" ref.vim
"--------------------------------------
let g:ref_use_vimproc=1
let g:ref_phpmanual_path=$HOME ."/Documents/refs/php-chunked-xhtml"
let g:ref_source_webdict_sites = {
\   'alc': {
\     'url': 'http://eow.alc.co.jp/search?q=%s',
\   },
\   'wikipedia': {
\     'url': 'http://ja.wikipedia.org/wiki/%s',
\   },
\ }
function! g:ref_source_webdict_sites.alc.filter(output)
  return join(split(a:output, "\n")[42 :], "\n")
endfunction
function! g:ref_source_webdict_sites.wikipedia.filter(output)
  return join(split(a:output, "\n")[17 :], "\n")
endfunction
nnoremap ,rr :<C-u>Ref refe<Space>
nnoremap ,rp :<C-u>Ref phpmanual<Space>
nnoremap ,ra :<C-u>Ref webdict alc<Space>
nnoremap ,rw :<C-u>Ref webdict wikipedia<Space>
augroup vimrc_refvim
  autocmd!
  autocmd FileType ref nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
augroup END

"--------------------------------------
" simple-javascript-indenter
"--------------------------------------
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1

"--------------------------------------
" jscomplete-vim
"--------------------------------------
"autocmd FileType javascript setlocal omnifunc=jscomplete#CompleteJS
let g:jscomplete_use = ['dom', 'moz']

"--------------------------------------
" tern_for_vim
"--------------------------------------
let g:tern_show_argument_hints = 1

"--------------------------------------
" vim-go
"
" (for MacVim-Kaoriya)
" $ rm -Rf /Applications/MacVim.app/Contents/Resources/vim/plugins/golang
"--------------------------------------
let g:go_fmt_command = "goimports"

"--------------------------------------
" vim-json
"--------------------------------------
let g:vim_json_syntax_conceal = 0

"--------------------------------------
" ctrlp
"--------------------------------------
let g:ctrlp_follow_symlinks = 1
nnoremap <silent> ,cp :<C-u>CtrlP<CR>

"--------------------------------------
" FuzzyFinder
"--------------------------------------
nnoremap <silent> ,fb :<C-u>FufBuffer<CR>
nnoremap <silent> ,fl :<C-u>FufLine<CR>

"--------------------------------------
" MS Word
"--------------------------------------
augroup vimrc_msword
  autocmd!
  autocmd BufReadPre  *.doc set readonly
  autocmd BufReadPost *.doc silent %!/usr/local/bin/antiword -m UTF-8.txt '%'
augroup END

"--------------------------------------
" anzu
"--------------------------------------
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

"--------------------------------------
" textobj-multiblock
"--------------------------------------
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

"--------------------------------------
" easymotion
"--------------------------------------
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
nmap <Leader>; <Plug>(easymotion-next)
nmap <Leader>, <Plug>(easymotion-prev)

"--------------------------------------
" incsearch.vim
"--------------------------------------
let g:incsearch#auto_nohlsearch = 0

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"--------------------------------------
" smartinput-endwise
"--------------------------------------
" http://qiita.com/todashuta/items/bdad8e28843bfb3cd8bf
call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)', '<Enter>', '<Enter>')
call smartinput_endwise#define_default_rules()

"--------------------------------------
" Other key maps
"--------------------------------------
" <Esc>キー2回で検索結果ハイライトを無効化
nmap <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
vnoremap _ :w !nkf -Ws\|pbcopy<CR><CR>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap j gjzz
nnoremap k gkzz
" 大文字でも保存/終了コマンドを受け付ける
cnoremap W w
cnoremap Q q
cnoremap WQ wq

" カーソルキーのシーケンスを打ち消す
map OA <Up>
map OB <Down>
map OC <Right>
map OD <Left>
" 英字キーボードでの ; -> : 変換
nnoremap ; :
" 挿入モードでも jj でノーマルモードに遷移する
inoremap jj <ESC>
" 数字のインクリメント/デクリメント
nnoremap + <C-a>
nnoremap - <C-x>

" ファイル名の変更
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

" 日付の挿入
nnoremap <F6> <ESC>i<C-R>=strftime("[%Y/%m/%d]")<CR><CR>
inoremap <F6> <C-R>=strftime("%Y%m%d%H%M")<CR>

"--------------------------------------
" Local settings
"--------------------------------------
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
