set nocompatible

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
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

set incsearch
set ignorecase
set smartcase

set autoindent
set smartindent
set backspace=indent,eol,start
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
set nocindent
set scroll=3
set scrolloff=15
set whichwrap=b,s,h,l,<,>,[,]

syntax on
colorscheme darkblue

nnoremap j gj
nnoremap k gk

filetype plugin indent on

if has("autocmd")
    autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
    autocmd QuickFixCmdPost vimgrep cw
    autocmd BufNewFile,BufRead *.as   set filetype=actionscript
    autocmd BufNewFile,BufRead *.mxml set filetype=mxml 
endif

map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nmap sk <C-W>k
nmap sj <C-W>j
nnoremap j gjzz
nnoremap k gkzz

let g:miniBufExplSplitBelow=0
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1

hi Pmenu ctermbg=cyan ctermfg=black
hi PmenuSel ctermbg=blue
hi PmenuSbar ctermbg=cyan
