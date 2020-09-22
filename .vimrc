"Plugins
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
map <silent> <C-p> :FzfFiles<CR>

set tabstop=4
set shiftwidth=4
set expandtab

let g:gruvbox_contrast_light="hard"
" if i want to use default color by theme
"let g:conoline_use_colorscheme_default_normal=1
"let g:conoline_use_colorscheme_default_insert=1

" For dark colorschemes
"let g:conoline_color_normal_dark = 'guibg=#181818'
"let g:conoline_color_normal_nr_dark = 'guibg=#181818'
"let g:conoline_color_insert_dark = 'guibg=#000000'
"let g:conoline_color_insert_nr_dark = 'guibg=#000000'

" For light colorschemes
"let g:conoline_color_normal_light = 'guibg=#eaeaea'
"let g:conoline_color_normal_nr_light = 'guibg=#eaeaea'
"let g:conoline_color_insert_light = 'guibg=#ffffff'
"let g:conoline_color_insert_nr_light = 'guibg=#ffffff'

autocmd CursorHold * silent call CocActionAsync('highlight')

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Give more space for displaying messages.
"set cmdheight=2
" Setup Prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

map <space>e :CocCommand explorer<CR>
map <C-i> :Prettier<CR>

:colorscheme gruvbox
:set background=dark
:set relativenumber
:set laststatus=2
:set noshowmode

let g:conoline_auto_enable = 1

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:fzf_command_prefix = 'Fzf'
" if i do not want to search for file names in :Rg
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)


