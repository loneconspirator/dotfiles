let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_PYTHON_LOG_LEVEL="INFO"
let $NVIM_NCM_LOG_LEVEL="INFO"
let $NVIM_NCM_MULTI_THREAD=0

" nvim config
nmap 0 ^

" Use enter key to add empty line before or after cursor
"nnoremap <S-C
nnoremap <CR> :set paste<CR>m`o<Esc>``:set nopaste<CR>

let mapleader = " "

" Editing this file
nmap <leader>vi :tabnew ~/.config/nvim/init.vim<CR>
nmap <leader>so :source ~/.config/nvim/init.vim<CR>
nmap <leader>w :w<CR>

map <ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-D>

let g:ruby_host_prog = '/Users/mike/.rbenv/shims/neovim-ruby-host'
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

set number relativenumber " line numbers
set autoindent		" always set autoindenting on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set softtabstop=2
set inccommand=split
set backupdir=~/vimtmp//,.
set directory=~/vimtmp//,.

" set winwidth=84
" set winheight=5
" set winminheight=5
" set winheight=999
set splitbelow
set splitright

" plugins
call plug#begin('~/.vim/plugged')
" Basics
Plug 'tpope/vim-sensible'

" Snippets
Plug 'honza/vim-snippets'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'SirVer/ultisnips'

" NCM2 / autocomplete stuff
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-tmux'
    " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c

    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <c-c> <ESC>

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new
    " line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " wrap existing omnifunc
    " Note that omnifunc does not run in background and may probably block the
    " editor. If you don't want to be blocked by omnifunc too often, you could
    " add 180ms delay before the omni wrapper:
    "  'on_complete': ['ncm2#on_complete#delay', 180,
    "               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
    au User Ncm2Plugin call ncm2#register_source({
            \ 'name' : 'css',
            \ 'priority': 9,
            \ 'subscope_enable': 1,
            \ 'scope': ['css','scss'],
            \ 'mark': 'css',
            \ 'word_pattern': '[\w\-]+',
            \ 'complete_pattern': ':\s*',
            \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
            \ })
" Navigtion
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'ctrlpvim/ctrlp.vim' " alternate to fzf
Plug 'scrooloose/nerdtree'

" General development
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'machakann/vim-highlightedyank'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'zivyangll/git-blame.vim'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
runtime macros/matchit.vim
nnoremap <Leader>ss :<C-u>call gitblame#echo()<CR>
nnoremap <Leader>g :<C-u>Commits<CR>

" Floobits for pairing
if has('nvim')
  Plug 'floobits/floobits-neovim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'floobits/floobits-neovim'
endif

" JVM / Scala
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" deoplete code completion
" if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" "  Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
" else
  " Plug 'Shougo/deoplete.nvim'
" "  Plug 'ensime/ensime-vim'
" endif
" " Deoplete
" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('sources', {
  " \ '_': ['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips']
  " \})
" call deoplete#custom#var('omni', 'input_patterns', {
  " \ 'scala': '[^. *\t]\.\w*'
  " \})

" Scala
Plug 'derekwyatt/vim-scala'

" Settings for vim-scala
let g:scala_scaladoc_indent = 1

" Linting
Plug 'w0rp/ale'
let b:ale_fixers = { 'ruby': 'rubocop' }
highlight ALEWarning ctermbg=DarkGrey
nmap <leader>ra :ALEFix<CR>

" Ruby / Rails
au BufRead,BufNewFile *.thor setfiletype ruby
" Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'haml', 'eruby'] } "<- ERRORING
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'coffee', 'javascript'] }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
" Plug 'Keithbsmiley/rspec.vim', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'jgdavey/tslime.vim'

" plantuml
Plug 'aklt/plantuml-syntax'
call plug#end()

source $DOTFILES/nvim/autosave.vim
source $DOTFILES/nvim/file_nav.vim
source $DOTFILES/nvim/tmux_runner.vim
source $DOTFILES/nvim/tabs.vim

let w:scala_scaladoc_indent = 1


set clipboard=unnamed

" nvim-completion-manager
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Put one space after comment characters
let g:NERDSpaceDelims = 1

" Get the defaults that most users want.
" source $VIMRUNTIME/defaults.vim

" execute pathogen#infect()
syntax on

set rtp+=/usr/local/opt/fzf
set mouse=a


autocmd VimResized * :wincmd =
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

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
