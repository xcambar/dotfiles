if !has('nvim')
  set nocompatible
endif

" See https://github.com/sheerun/vim-polyglot/blob/master/config.vim#L2-L4
let g:jsx_ext_required = 1

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugins')

Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'thinca/vim-localrc'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'luochen1990/rainbow', { 'for': 'clojure' }
Plug 'airblade/vim-gitgutter'

" Editor Only
if !exists('vimpager')
  " set rtp+=/usr/local/opt/fzf "FZF
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-fugitive'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'tomtom/tcomment_vim'
  Plug 'mattn/emmet-vim'
  Plug 'matze/vim-move'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'w0rp/ale'
  Plug 'dockyard/vim-easydir'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " Clojure
  " Plug 'snoe/nvim-parinfer.js'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-classpath'
  Plug 'tpope/vim-salve'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-fireplace'
  Plug 'tpope/vim-leiningen'
  Plug 'guns/vim-sexp', { 'for': 'clojure' }
  Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'slashmili/alchemist.vim'
  Plug 'elixir-lang/vim-elixir'
  Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  autocmd VimEnter * source $HOME/.config/nvim/editor.vim
else
  autocmd VimEnter * source $HOME/.config/nvim/pager.vim
endif
call plug#end()

set t_Co=256
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

set hidden
set shortmess+=I
syntax on
set number
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

if !has('nvim')
  set ttyfast
  set ttymouse=xterm2
endif
set lazyredraw

set nobackup
set noswapfile
set autoindent
set copyindent

filetype plugin indent on

set timeout timeoutlen=300 ttimeoutlen=100

" Fixes the backspace key
set backspace=indent,eol,start
"See https://github.com/neovim/neovim/issues/2048#issuecomment-78534227
if has('nvim')
  nmap <BS> <C-W>h
endif

" Yank to and paste the
" selection without prepending "* to commands.
" @see https://github.com/pda/dotvim/blob/master/vimrc
set clipboard=unnamed

let g:mapleader = ";"
let mapleader = ";"
" Distraction-free map
nnoremap <Leader>z :Goyo<cr>

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

nnoremap Q <nop>

map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
" map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :split <C-R>=expand("%:p:h") . "/" <CR>

let g:surround_no_insert_mappings = 1
" inoremap <silent> <C-E> <C-R>=AutoPairsInsert('{')<CR>
" inoremap <silent> <C-R> <C-R>=AutoPairsInsert('}')<CR>
" inoremap <silent> <C-D> <C-R>=AutoPairsInsert('(')<CR>
" inoremap <silent> <C-F> <C-R>=AutoPairsInsert(')')<CR>
" inoremap <silent> <C-X> <C-R>=AutoPairsInsert('[')<CR>
" inoremap <silent> <C-C> <C-R>=AutoPairsInsert(']')<CR>

vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

hi htmlArg gui=italic
hi Comment gui=italic
hi Type    gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic


au BufReadPost *.hbs set syntax=mustache



"
" Config for plugin luochen1990/rainbow
"
let g:rainbow_active = 1



"
" Config for matze/vim-move
"
let g:move_key_modifier = 'S'

