let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

nmap <leader>va :VtrAttachToPane<CR>
nmap <leader>vc :VtrSendCommand<CR>
nmap <leader>vf :VtrSendFile<CR>
nmap <leader>vs :VtrSendLinesToRunner<CR>
nmap <leader>vo :VtrOpenRunner {'orientation': 'h', 'percentage': 50}<CR>
nmap <leader>vz :VtrFocusRunner<CR>
vmap <leader>va :VtrAttachToPane<CR>
vmap <leader>vc :VtrSendCommand<CR>
vmap <leader>vf :VtrSendFile<CR>
vmap <leader>vs :VtrSendLinesToRunner<CR>
vmap <leader>vo :VtrOpenRunner {'orientation': 'h', 'percentage': 50}<CR>
vmap <leader>vz :VtrFocusRunner<CR>
