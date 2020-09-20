call  plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors'
Plug 'miyakogi/conoline.vim'
call plug#end()
" Coc things
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-explorer',
  \ ]

map <silent> gd <Plug>(coc-definition)
"map <silent> gy <Plug>(coc-type-definition)
map <silent> gi <Plug>(coc-implementation)
map <silent> gr <Plug>(coc-references)

autocmd CursorHold * silent call CocActionAsync('highlight')

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Setup Prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

map <space>e :CocCommand explorer<CR>
map <C-i> :Prettier<CR>

:colorscheme fairy-garden
:set relativenumber
:set laststatus=2
:set noshowmode

let g:conoline_auto_enable = 1

command! -nargs=0 Prettier :CocCommand prettier.formatFile

