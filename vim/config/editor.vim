" Removes trailing wihtespaces
au FileType * au BufWritePre <buffer> :%s/\s\+$//e

set scrolloff=8
set directory^=$HOME/.config/nvim/tmp//
set splitbelow
set splitright
set autoindent
set diffopt+=vertical

set pastetoggle=<F12>

nnoremap <c-q> :q<CR>
nnoremap <c-t> :Files<CR>
nnoremap \| :vnew<CR>
nnoremap _ :new<CR>
nnoremap ii i
inoremap ii <Esc>

command Cdb execute "cd %:p:h"

source $HOME/.config/nvim/config/plugins/vim-move.vim
source $HOME/.config/nvim/config/syntax.vim
source $HOME/.config/nvim/config/plugins/deoplete.nvim

"tabs
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tn :tabnew<CR>
nnoremap tq :tabclose<CR>
nnoremap t1 1gt<CR>
nnoremap t2 2gt<CR>
nnoremap t3 3gt<CR>
nnoremap t4 4gt<CR>
nnoremap t5 5gt<CR>
nnoremap t6 6gt<CR>
nnoremap t7 7gt<CR>
nnoremap t8 8gt<CR>
nnoremap t9 9gt<CR>
nnoremap t0 :tablast<CR>
