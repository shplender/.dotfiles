" set leader key
let mapleader = " "
syntax enable			        "Enables syntax highlighting.
set hidden			            "Required to keep open multiple buffers.
set clipboard+=unnamedplus	    "Copy paste between nvim and everything else.
"set nowrap                      " Display long lines as just one line.
set encoding=utf-8              " The encoding displayed
set number
set relativenumber
set mouse=a
set splitright
set splitbelow
set nrformats-=octal
set nrformats+=alpha

set background=dark
set nohlsearch
set incsearch
set ignorecase
set smartcase
set noruler

" General tab settings
set tabstop=4                   " number of visual spaces Spaces per TAB
set softtabstop=4               " number of spaces in tab when editing
set shiftwidth=4                " number of spaces to use for autoindent
set expandtab                   " expand tab to spaces so that tabs are spaces
set smartindent


" History keeping.
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set autowriteall

set termguicolors
set cursorline
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=88
set cmdheight=2
filetype plugin indent on
set path+=**					" Searches current directory recursively.

let g:netrw_browsex_viewer= "kfmclient exec"
