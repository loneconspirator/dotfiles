" proactively save files
" autocmd InsertLeave * :w<CR>
" inoremap <Esc> <Esc>:w<CR>

" not sure if I need these anymore
set autowrite
set autowriteall
:au FocusLost * :wa
let g:tmux_navigator_save_on_switch = 2
