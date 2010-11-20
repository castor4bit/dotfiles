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

colorscheme darkblue
filetype plugin on
filetype indent on
syntax on

if has("autocmd")
  "autocmd!
  autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
  autocmd QuickFixCmdPost vimgrep cw
  autocmd BufNewFile,BufRead *.as   set filetype=actionscript
  autocmd BufNewFile,BufRead *.mxml set filetype=mxml
  autocmd BufNewFile,BufRead *.go   set filetype=go
  autocmd FileType * let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i'
  autocmd FileType php let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/php.dict'
endif

call pathogen#runtime_append_all_bundles()

map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>
nmap <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
nmap sk <C-W>k
nmap sj <C-W>j
nmap sh <C-W>h
nmap sl <C-W>l
nnoremap j gjzz
nnoremap k gkzz
vmap _ :w !nkf -Ws\|pbcopy<CR><CR>

let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1
let g:AutoComplPop_IgnoreCaseOption=1
let g:AutoComplPop_NotEnableAtStartup=1

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
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
let g:miniBufExplSplitBelow=0
nmap <Space> :MBEbn<CR>
nmap <S-Space> :MBEbp<CR>

hi Pmenu ctermbg=cyan ctermfg=black
hi PmenuSel ctermbg=blue
hi PmenuSbar ctermbg=cyan
hi Folded	ctermfg=blue ctermbg=darkgrey cterm=bold term=bold
hi MatchParen term=standout ctermbg=LightGrey ctermfg=Black guibg=LightGrey guifg=Black

