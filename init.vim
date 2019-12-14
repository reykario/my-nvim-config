" ===== General Configuration =====

if !has('gui_running')
  set t_Co=256
endif

set showmatch               " Show matching brackets.
set incsearch               " incremental search
set ignorecase              " Do case insensitive matching
set vb                      " set visual bell
set noerrorbells            " set no error bells
set showcmd                 " show command
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set ai
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set fileencoding=utf-8
set laststatus=2
set showtabline=2
set history=1000
set undolevels=1000
set hidden
set incsearch
set ruler
" ==== Encoding ====
set encoding=utf-8
set fileformat=unix
set fileencoding=utf-8
" ==== Tabs ====
set tabstop=4               " number of columns occupied by a tab character
set shiftwidth=4            " number of spaces to use for each step of autoindent
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set noexpandtab             " set whitespaces as tabs
" ==== Number ====
set number                  " add line numbers
if !&diff
	augroup numbertoggle
		autocmd!
		autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
		autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
	augroup END
endif

filetype plugin on
syntax on

" n  Normal mode map. Defined using ':nmap' or ':nnoremap'.
" i  Insert mode map. Defined using ':imap' or ':inoremap'.

let mapleader = ","
:nnoremap q <c-v>
noremap <silent> <F12> :set number!<CR>
map <c-p> :Files<CR>
map <c-e> :NERDTreeToggle<CR>
nnoremap [b :bp <CR>
nnoremap ]b :bn <CR>
nnoremap <Leader>u :CtrlFunky<Cr>
nnoremap <Leader>U :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

map gs :GFiles?<CR>

imap kj <ESC>

nmap <leader>l :set list!<CR>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" ===== Plugin =====

filetype off
" Set the runtime path to include Vundle and initialize
call plug#begin()
" Let Vim Plug manage plugin, required
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tracyone/fzf-funky', {'on': 'CtrlPFunky'}
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'valloric/vim-indent-guides'
Plug 'janko/vim-test'
Plug 'morhetz/gruvbox'
call plug#end()

filetype plugin indent on  " allows auto-indenting depending on file type

" ===== Color Scheme =====
colorscheme gruvbox
set background=dark

" ===== vim-gitgutter configs =====
let g:gitgutter_highlight_lines = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_max_signs=999999999

" ===== fzf.vim config =====
let g:fzf_colors =
\ { 'fg': ['fg', 'Normal'],
  \ 'bg': ['bg', 'Normal'],
  \ 'hl': ['fg', 'Comment'],
  \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+': ['bg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'hl+': ['fg', 'Statement'],
  \ 'info': ['fg', 'PreProc'],
  \ 'border': ['fg', 'Ignore'],
  \ 'prompt': ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Conditional'],
  \ 'marker': ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header': ['fg', 'Comment']}

command! -bang -nargs=* Ag
 \ call fzf#vim#ag(<q-args>,
 \                  <bang>0 ? fzf#vim#with_preview('up:60%')
 \                          : fzf#vim#with_preview('right:50%')
 \                  <bang>0)

" ===== lightline =====
let g:lightline = {
 \ 'colorscheme': 'wombat',
 \ 'active': {
 \ 'left': [ ['mode', 'paste'],
 \          ['gitbranch', 'readonly', 'filename', 'modified'] ]
 \ },
 \ 'component_function': {
 \   'gitbranch': 'fugitive#head'
 \ },
 \ }
let g:lightline.tabline             = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand    = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type      = {'buffers': 'tabsel'}
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ===== ctrlp =====
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/vendor/**
set wildignore+=*/bower_components/**
set wildignore+=*/node_modules/**

" ===== nerdtree =====
map <C-e> :NERDTreeToggle<CR>
let g:netrw_liststyle=3

" ===== easymotion =====
let g:EasyMotion_leader_key = '<Leader>'

" ===== airline =====
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" ===== fzf.vim =====
noremap K "execute 'Ag ' . expand('<cword>')<Cr>
noremap fif :Ag

" ===== vim-test =====
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuit<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
