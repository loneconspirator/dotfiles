map <C-p> :FZF<CR>
map <C-n> :NERDTreeToggle<CR>

" AltCommand will open the current file's corresponding file (such as the spec
" for a source code file, or vice versa
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Find the alternate file for the current path and open it
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

map <leader>po :Ag .
map <leader>pp :Buffer<CR>
map <leader>d :bd<CR>
map <leader>D :bufdo bd<CR>
