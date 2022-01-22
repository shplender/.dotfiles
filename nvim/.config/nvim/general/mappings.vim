inoremap jk <Esc>
" not sure why this is here. consider put it in .vimrc
"noremap <Leader>p "*p
"noremap <Leader>y "*y
"inoremap ( ()<Esc>i
"inoremap { {}<Esc>i
"inoremap {<CR> {<CR>}<Esc>O
"inoremap [ []<Esc>i
"inoremap < <><Esc>i
"inoremap ' ''<Esc>i
"inoremap " ""<Esc>i

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" Window navigation:
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <F5> :silent update<Bar>silent !firefox %:p &<CR>

"No Ex mode
map Q <Nop>
map gQ <Nop>

inoremap <C-q> <esc>:qa!<cr>               " quit discarding changes
nnoremap <C-q> :qa!<cr>

" fzf.vim
nnoremap <silent> <leader>f :<C-u>Files<CR>
nnoremap <silent> <leader>b :<C-u>Buffers<CR>
nnoremap <silent> <leader>w :<C-u>Windows<CR>
nnoremap <silent> <leader>t :<C-u>Tags<CR>
nnoremap <silent> <leader>o :<C-u>History<CR>
nnoremap <silent> <leader>: :<C-u>History:<CR>
nnoremap <silent> <leader>h :<C-u>Helptags<CR>
nnoremap <silent> <leader>c :<C-u>Commands<CR>

"" Mapping selecting mappings
nmap <leader><Tab> <plug>(fzf-maps-n)
xmap <leader><Tab> <plug>(fzf-maps-x)
omap <leader><Tab> <plug>(fzf-maps-o)

"" Insert mode completion
"imap <C-x><C-k> <plug>(fzf-complete-word)
"imap <C-x><C-f> <plug>(fzf-complete-path)
"imap <C-x><C-j> <plug>(fzf-complete-file-ag)
"imap <C-x><C-l> <plug>(fzf-complete-line)
" Fuzzymenu
nmap <silent> <C-space> <Plug>(Fzm)
vmap <silent> <C-space> <Plug>(FzmVisual)

" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fm <cmd>Telescope man_pages<cr>
nnoremap <leader>fo <cmd>Telescope vim_options<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>fold <cmd>Telescope oldfiles<cr>

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })


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
