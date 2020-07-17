" Settings for vim-scala
let g:scala_scaladoc_indent = 1

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources={}
let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips']

" Ensime
"autocmd BufWritePost *.scala silent :EnTypeCheck
"nnoremap <localleader>t :EnType<CR>
"au FileType scala nnoremap <localleader>df :EnDeclaration<CR>
"au FileType scala nnoremap <localleader>ds :EnDeclarationSplit<CR>
"au FileType scala nnoremap <localleader>dd :EnDocBrowse<CR>
