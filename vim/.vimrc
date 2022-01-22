" Settings for cursor style.
let &t_ti.="\<Esc>[1 q"
let &t_SI.="\<Esc>[5 q"
let &t_EI.="\<Esc>[1 q"
let &t_SR.="\<Esc>[3 q"
let &t_te.="\<Esc>[0 q"

let g:ale_completion_enabled=1

" Man pages in vim
runtime ftplugin/man.vim
" Open manpage in vertical split
let g:ft_man_open_mode = 'vert'
" Shift-K opens manpage in vim also
set keywordprg=:Man

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'vim-python/python-syntax'
Plug 'vim-airline/vim-airline'
Plug 'gruvbox-community/gruvbox'
Plug 'machakann/vim-highlightedyank'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Settings
set nocompatible
set hidden
set mouse=a
set clipboard=unnamedplus
set completeopt=menuone,noinsert,noselect
set wildmenu
set wildmode=full
set nrformats-=octal
set nrformats+=alpha


set number
set relativenumber
set scrolloff=5
set incsearch
set hlsearch
set ignorecase
set smartcase
set splitright
set splitbelow
set noshowmode
set nowrap
set foldenable
set foldmethod=indent
set signcolumn=yes
set noruler
set background=dark
set colorcolumn=80
set cursorline
filetype plugin indent on

set backspace=indent,eol,start
set path+=**					" Searches current directory recursively.
set history=1000		" keep 200 lines of command line history
set showcmd		" display incomplete commands

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: \":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

set nobackup
set undofile
set noswapfile
set autowriteall
" General tab settings
set tabstop=4                   " number of visual spaces Spaces per TAB
set softtabstop=4               " number of spaces in tab when editing
set shiftwidth=4                " number of spaces to use for autoindent
set expandtab                   " expand tab to spaces so that tabs are spaces
set smartindent

let g:highlightedyank_highlight_duration=300
let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_bold=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols.maxlinenr = ''
let g:airline#extensions#ale#enabled = 1
let g:gruvbox_guisp_fallback = "bg" " to get spell highlighting correct.
colorscheme gruvbox

" ALE
let g:ale_linters = {'python':
            \['flake8', 'pydocstyle', 'bandit', 'mypy', 'pylint']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'],
            \'python': ['black', 'isort']}
let g:ale_fix_on_save=1

" ---------------------------------------------------------------------------------
"                                   Mappings.
" ---------------------------------------------------------------------------------

"  Mapleader
let mapleader = ' '
" Navigate split windows.
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

inoremap jk <Esc>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

vnoremap  :Strikethrough<CR>
vnoremap __ :Underline<CR>
" ---------------------------------------------------------------------------------
"                               VimWiki.
" ---------------------------------------------------------------------------------
let g:vimwiki_list = [{'path': '/media/storage/notes', 'auto_tags': 1}]

" Background opacity depends on terminal.
hi Normal guibg=NONE ctermbg=NONE

" ---------------------------------------------------------------------------------
"                               Python syntax.
" ---------------------------------------------------------------------------------
let g:python_highlight_all=1
hi CursorLine ctermbg=232
