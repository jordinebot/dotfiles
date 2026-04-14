" Enable syntax highlighting
syntax on
set re=0  " https://jameschambers.co.uk/vim-typescript-slow/

" Show line numbers
set number

" Enable mouse support in all modes
set mouse=a

" Set encoding
set encoding=utf-8

" Tabs & indentation
set tabstop=4        " Number of spaces a tab counts for
set shiftwidth=4     " Size of an indent
set expandtab        " Use spaces instead of tabs
set smartindent      " Smart auto-indenting

" Search settings
set ignorecase       " Case insensitive search…
set smartcase        " …unless uppercase is used
set hlsearch         " Highlight search results
set incsearch        " Show matches as you type

" UI improvements
set cursorline       " Highlight current line
set showcmd          " Show command in bottom bar
set wildmenu         " Better command-line completion

" Enable true color (if supported)
set termguicolors

" Set a simple built-in colorscheme
colorscheme slate

" Better backspace behavior
set backspace=indent,eol,start

" Disable swap files (optional)
set noswapfile

" Enable filetype detection and plugins
filetype plugin indent on
