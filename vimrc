""""""""""""""""Imported from MIT""""""""""""""""""""""""""""""""""""""""""""
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set hlsearch                " highlight search results
"Tabs and spaces here
set expandtab               " convert tabs to spaces
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting
set shortmess+=I            " Avoiding the 'Hit ENTER to continue' prompts
set relativenumber          " Set relative line number
set smartcase               " match different cases while searching
set t_Co=256                " 256 color terminal
set linebreak               " wrap lines at cnvenient points
set confirm                 " display a confirmation dialog when closing an unsaved file
set exrc                    " enable project specific vimrc

let mapleader = ","         "Map leader

""""""""""""""""""""""" Personal Configuration """""""""""""""""""""""""""""""

" move to the previous/next tabpage.
nnoremap <C-j> gT
nnoremap <C-k> gt

"for saving, :wq, :w, :x aren't productive
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>q :q!<CR>

"no highlighting
nnoremap <leader>n :noh<CR>

"for indenting
nnoremap <leader>i gg=G

"""""""""""""""""""""""""""""'PLUGINS"""""""""""""""""""""""""""""""""""""""""

call plug#begin()

"conquerer: autocompletion = ✔️
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Polyglot = ✔️ 
Plug 'sheerun/vim-polyglot'

"status bar = ✔️
Plug 'itchyny/lightline.vim'

"highlights yanked line = ✔️
Plug 'machakann/vim-highlightedyank'

"surround for vim = ✔️
Plug 'tpope/vim-surround'

call plug#end()

"LIGHTLINE
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'seoul256'
      \ }

set background=light
colorscheme PaperColor

"AUTOSAVE
let g:auto_save = 1
let g:auto_save_silent = 1  " do not display the auto-save notification

"CONQUERER OF AUTOCOMPLETION
"------
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Give more height for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Show commands: LIFE SAVER
nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
