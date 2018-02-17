let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_NCM_LOG_LEVEL="DEBUG"
let $NVIM_NCM_MULTI_THREAD=0

" nvim config
nmap 0 ^

" Use enter key to add empty line before or after cursor
nmap <S-Enter> o<Esc>
nmap <CR> O<Esc>

let mapleader = " "

" Editing this file
nmap <leader>vi :tabnew ~/.config/nvim/init.vim<CR>
nmap <leader>so :source ~/.config/nvim/init.vim<CR>
nmap <leader>w :w<CR>

" Copy & paste with system clipboard
" Grr, this always copies the whole line
" vmap <C-c> :'<,'>w !pbcopy<CR><CR>
map <C-c> :.w !pbcopy<CR><CR>
nmap <C-v> :r !pbpaste

map <C-p> :FZF<CR>
map <C-n> :NERDTreeToggle<CR>

map <ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-D>

set number relativenumber " line numbers
set autoindent		" always set autoindenting on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set softtabstop=2

" plugins
call plug#begin('~/.vim/plugged')
" Basics
Plug 'tpope/vim-sensible'

" Snippets
Plug 'honza/vim-snippets'
Plug 'roxma/nvim-completion-manager'
" Plug 'SirVer/ultisnips'

" Navigtion
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'ctrlpvim/ctrlp.vim' " alternate to fzf
Plug 'scrooloose/nerdtree'

" General development
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Ruby / Rails
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'haml', 'eruby'] }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'coffee', 'javascript'] }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'Keithbsmiley/rspec.vim', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }

call plug#end()

set clipboard=unnamed

" nvim-completion-manager
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Neomake
" let g:neomake_verbose = 3
let g:neomake_logfile = '/tmp/neomake.log'
let g:neomake_ruby_reek_maker_errorformat =
        \ '%E%.%#: Racc::ParseError: %f:%l :: %m,' .
        \ '%W%f:%l: %m'
let g:neomake_ruby_reek_maker = {
    \ 'args': ['--single-line'],
    \ 'errorformat': g:neomake_ruby_reek_maker_errorformat,
    \ }

let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

" Use alt to quickly open a source files test and vice versa
" Run a given vim command on the results of alt from a given path.
" See usage below.
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }


" Find the alternate file for the current path and open it
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>

" Put one space after comment characters
let g:NERDSpaceDelims = 1

" Get the defaults that most users want.
" source $VIMRUNTIME/defaults.vim

" execute pathogen#infect()
syntax on

set rtp+=/usr/local/opt/fzf
set mouse=a

" proactively save files
set autowrite
set autowriteall
:au FocusLost * :wa

" check one time after 4s of inactivity in normal mode
set autoread
au CursorHold * checktime

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Plugins will be downloaded under the specified directory.
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

endif " has("autocmd")


autocmd BufWritePre * %s/\s\+$//e

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
"if has('syntax') && has('eval')
"  packadd! matchit
"endif
