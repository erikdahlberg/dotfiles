set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

filetype plugin on

" Edgeare channel.cfg
au BufRead,BufNewFile *.cfg set filetype=channelcfg
au! Syntax channelcfg source ~/.vim/syntax/channelcfg.vim

" Remove trailing white spaces
autocmd BufWritePre * :%s/\s\+$//e
"autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

nmap <F3> :TlistToggle<cr>

nmap <F5> :!grep -n <cword> $(find -name "*.c" -or -name "*.h" -or -name "*.py")<CR>
"nmap <F5> :!grep -n <cword> $(find -name \"*.[c|h|py]\")<CR>
nmap <F10> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files <CR> ; :!cscope -b -i cscope.files -f cscope.out <CR> :cs kill -1 <CR>:cs add cscope.out <CR>
let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang.so.1'
"if v:version >= 700
"  set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
"  let OmniCpp_GlobalScopeSearch   = 1
"  let OmniCpp_DisplayMode         = 1
"  let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
"  let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
"  let OmniCpp_ShowAccess          = 1 "show access in pop-up
"  let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
"  set completeopt=menuone,menu,longest
"endif
"inoremap <C-@> <c-x><c-o>

" -----------------------------------------------
" -- general
" -- syntax highlighting should be on
syntax on
let &t_Co=256

" -- select a color scheme
colorscheme desert
" -- try to use blackboard - a non-standard color scheme
silent! colorscheme blackboard

" -- dark gray separators in splits and folds
highlight VertSplit ctermfg=16 ctermbg=238
highlight StatusLine ctermfg=238 ctermbg=white
highlight StatusLineNC ctermfg=238 ctermbg=white
highlight Folded ctermfg=242 ctermbg=16-----------------------------------------------

" -- use comma as leader
let mapleader = ","

" -- auto write when changing buffers etc
set autowrite

" -- not vi compatible
set nocp

" -- use bash for as command line
set shell=/bin/bash

" -- write swap files to this directory
set dir=>~/.vimswap

" -- handle xterm-style Ctrl+arrow sequences
" -- check term to see if tmux/screen is used
if &term =~ '^screen'
    " -- tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Cscope-navigation
map <silent> å <C-]>



" Tab navigation
nnoremap <C-Left>  :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-x>     :tabclose<cr>
inoremap <C-Left> <Esc>:tabprevious<CR>i
inoremap <C-Right> <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <C-x>     :tabclose<cr>

" -- Text Editor --
" -- Show matching braces
set showmatch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cindent
filetype indent on
" setlocal smarttab

" -- real tabs in make files
autocmd BufEnter ?akefile* set noexpandtab

" -- do not expose whitespace by default
set list lcs=tab:\ \ ,trail:\

" -- expose or hide whitespace
fun! ShowWhiteSpace()
   set list lcs=tab:._,trail:-
endfun
fun! HideWhiteSpace()
  set list lcs=tab:\ \ ,trail:\
endfun

map ,. :call ShowWhiteSpace() <CR>
map ,- :call HideWhiteSpace() <CR>


" -- Toogle spell check
fun! ToogleSpellCheck()
    if &spell
        set nospell
    else
        set spell spelllang=en_us
    endif
endfun

map ,s :call ToogleSpellCheck() <CR>

