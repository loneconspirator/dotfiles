let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1
let g:VtrClearBeforeSend = 0

nmap <leader>va :VtrAttachToPane<CR>
nmap <leader>vc :VtrSendCommand<CR>
nmap <leader>vf :VtrSendFile<CR>
nmap <leader>vs :VtrSendLinesToRunner<CR>
nmap <leader>vo :VtrOpenRunner {'orientation': 'h', 'percentage': 30}<CR>
nmap <leader>vz :VtrFocusRunner<CR>

let g:rspec_command = 'VtrSendCommand rspec {spec}'
" let g:rspec_command = '!clear && echo rspec {spec} && ./bin/rspec {spec}'
" vim-rspec mappings
map <Leader>v, :call RunCurrentSpecFile()<CR>
map <Leader>vn :call RunNearestSpec()<CR>
map <Leader>vl :call RunLastSpec()<CR>
map <Leader>v/ :call RunAllSpecs()<CR>
