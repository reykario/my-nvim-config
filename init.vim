" ===== General Configuration =====

set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set ff=unix
set fileencoding=utf-8
set fileformat=unix
set laststatus=2
set encoding=utf-8
set showcmd
set history=1000
set undolevels=1000
set hidden
set incsearch
set ruler
filetype plugin on
syntax on

" n  Normal mode map. Defined using ':nmap' or ':nnoremap'.
" i  Insert mode map. Defined using ':imap' or ':inoremap'.

let mapleader = ","
:nnoremap q <c-v>
nnoremap [b :bp <CR>
nnoremap ]b :bn <CR>

imap kj <ESC>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" ===== Color Scheme =====
colorscheme pablo

" ===== Plugin =====

filetype off
" Set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" All of your Plugins must be added before the following line

call vundle#end() 
filetype plugin indent on  " allows auto-indenting depending on file type

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/vendor/**
set wildignore+=*/bower_components/**
set wildignore+=*/node_modules/**

" nerdtree
map <C-e> :NERDTreeToggle<CR>
let g:netrw_liststyle=3

" easymotion
let g:EasyMotion_leader_key = '<Leader><Leader>'

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
