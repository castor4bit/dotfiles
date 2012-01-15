" Bundle Settings
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'qmarik/vundle'

Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'tpope/vim-surround'
Bundle 'mattn/zencoding-vim'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/yanktmp.vim'
Bundle 'buftabs'
Bundle 'tyru/caw.vim'

set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932

set ambiwidth=double

set hlsearch
set showcmd
set title
set number
set ruler

set laststatus=2
set list
set listchars=tab:\ \ ,extends:<,trail:-
set statusline=%=%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c%V%8P

set incsearch
set ignorecase
set smartcase

set autoindent
set smartindent
set cindent
set backspace=indent,eol,start
set matchtime=1
set showmatch
set showmode
set wildmenu
set shortmess+=I

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround
set smarttab
set hidden
set nobackup
set wrapscan
set cursorline
set autoread
set scroll=3
set scrolloff=15
set whichwrap=b,s,h,l,<,>,[,]
set clipboard+=unnamed

filetype plugin indent on
syntax on

colorscheme darkblue
hi Pmenu ctermbg=cyan ctermfg=black
hi PmenuSel ctermbg=blue
hi PmenuSbar ctermbg=cyan
hi Folded	ctermfg=blue ctermbg=darkgrey cterm=bold term=bold
hi MatchParen term=standout ctermbg=Black ctermfg=Red guibg=Black guifg=Red

" autocmd
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd QuickFixCmdPost vimgrep cw
endif

" ZenCoding
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

" NeoComplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
let g:neocomplcache_enablecursorholdi = 1
let g:neocomplcache_enable_auto_select = 1

imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><CR>    pumvisible() ? neocomplcache#close_popup() : "\<CR>"
inoremap <expr><Right> pumvisible() ? neocomplcache#cancel_popup() : "\<Right>"
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS>   neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-h>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
inoremap <expr><C-g>  neocomplcache#undo_completion()
inoremap <expr><C-l>  neocomplcache#complete_common_string()

" Buftabs
let g:buftabs_only_basename=1
let g:buftabs_in_statusline=1
let g:buftabs_active_highlight_group="Visual"

nnoremap <Space>   :bnext<CR>
nnoremap <S-Space> :bprev<CR>

" YankTmp
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

" caw
nmap <Leader>c <Plug>(caw:I:toggle)
vmap <Leader>c <Plug>(caw:I:toggle)

" unite.vim
"let g:unite_enable_start_insert=1
"let g:unite_enable_split_vertically=1
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" Other key maps
nmap <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
vmap _ :w !nkf -Ws\|pbcopy<CR><CR>
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
nnoremap j gjzz
nnoremap k gkzz
cmap W w
cmap Q q
cmap WQ wq

