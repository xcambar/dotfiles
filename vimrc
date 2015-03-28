set nocompatible

call plug#begin('~/.vim/plugins')

Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/vim-emoji', { 'for': ['markdown'] }
Plug 'kien/rainbow_parentheses.vim', { 'for': ['clojure'] }
Plug 'airblade/vim-gitgutter'

" Editor Only
if !exists('vimpager')
  " Plug 'tpope/vim-fugitive'
  Plug 'kien/ctrlp.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'tomtom/tcomment_vim' "commentary
  Plug 'rking/ag.vim'
  Plug 'mattn/emmet-vim'
  Plug 'scrooloose/nerdtree'
  " TODO Replace with xcambar/vim-match-control
  Plug 'dirkwallenstein/vim-match-control'
  Plug 'matze/vim-move'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-repeat'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'walm/jshint.vim'
  Plug 'scrooloose/syntastic'
  Plug 'dockyard/vim-easydir'
  Plug 'junegunn/goyo.vim'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'majutsushi/tagbar'
  " Clojure
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
  Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
  Plug 'tpope/vim-classpath', { 'for': 'clojure' }
  Plug 'guns/vim-sexp', { 'for': 'clojure' }
  Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
  " Python
  Plug 'nvie/vim-flake8', { 'for': 'python' }
  autocmd VimEnter * source $HOME/.vim/config/editor.vim
else
  autocmd VimEnter * source $HOME/.vim/config/pager.vim
endif
call plug#end()

source $HOME/.vim/config/themes/base16.vim
source $HOME/.vim/config/plugins/vim-emoji.vim

set hidden
set shortmess+=I
syntax on
set number
set relativenumber
set nowrap
set mouse=a
set cursorline

au VimEnter * NoMatchParen

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap ? :noh<cr>

set list
set listchars=tab:->,trail:~,extends:>,precedes:<

set termencoding=utf-8
set encoding=utf-8

set ttyfast
set ttymouse=xterm2
set lazyredraw

set nobackup
set noswapfile
set autoindent
set copyindent

filetype plugin indent on

set timeout timeoutlen=300 ttimeoutlen=100

" Fixes the backspace key
set backspace=indent,eol,start

" Yank to and paste the
" selection without prepending "* to commands.
" @see https://github.com/pda/dotvim/blob/master/vimrc
set clipboard=unnamed

let g:mapleader = ";"
let mapleader = ";"
" Distraction-free map
nnoremap <Leader>z :Goyo<cr>
highlight Comment cterm=italic

set laststatus=1

highlight LineNr ctermbg=None ctermfg=8
highlight CursorLineNr ctermbg=20 ctermfg=18
highlight clear SignColumn
highlight GitGutterAdd ctermbg=None
highlight GitGutterChange ctermbg=None
highlight GitGutterDelete ctermbg=None
highlight GitGutterChangeDelete ctermbg=None
highlight CursorLine ctermbg=None
highlight NonText ctermfg=None
