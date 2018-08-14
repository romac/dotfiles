
" Plugins {{{

call plug#begin('~/.local/share/nvim/plugged')

" Colorschemes
Plug 'w0ng/vim-hybrid'

" IDE
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

" Text manipulation
Plug 'vim-scripts/Align'
Plug 'tpope/vim-commentary'
Plug 'majutsushi/tagbar'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'

" Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-scripts/gitignore'
let g:rg_highlight = 1

" Autocomplete	
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Language support
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }

" Git
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'
Plug 'sgur/vim-lazygutter'

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim', 'for': 'haskell' }
Plug 'nbouscal/vim-stylish-haskell', { 'for': 'haskell' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
let g:rustfmt_autosave = 1
let g:rustfmt_command = 'rustup run stable rustfmt'

" Coq
Plug 'whonore/Coqtail', { 'for': 'coq' } 

" Scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

" Nix
Plug 'LnL7/vim-nix', { 'for': 'nix' }

call plug#end()

" }}}

" General {{{

" Leader key
let mapleader = ","
let g:mapleader = ","

" Local leader key
let localleader = "_"
let g:localleader = "_"

" Leader key timeout
set tm=2000

" Allow the normal use of "," by pressing it twice
noremap ,, ,

" Space open/closes folds
nnoremap <space> za

" }}}
 
" Colors and Fonts {{{

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Enable syntax highlighting
syntax enable

" Enable True Color
set termguicolors

" Colorscheme
set background=dark
colorscheme hybrid

" Highlight current line
set cursorline

" Enable Powerline font in Airline
let g:airline_powerline_fonts = 1

" VIM user interface {{{

" Set 7 lines to the cursor - when moving vertically using j/k
set so=4

" Turn on the WiLd menu
set wildmenu
" Tab-complete files up to longest unambiguous prefix
set wildmode=list:longest,full

" Always show current position
set ruler
set number

" Show trailing whitespace
set list
" But only interesting whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set vb t_vb=

" Force redraw
map <silent> <leader>r :redraw!<CR>

" Turn mouse mode on
nnoremap <leader>ma :set mouse=a<cr>

" Turn mouse mode off
nnoremap <leader>mo :set mouse=<cr>

" Default to mouse mode on
set mouse=a

" Show live substitutions
:set inccommand=nosplit

" }}}


" Files, backups and undo {{{

" Turn backup off, since most stuff is in Git anyway...
set nobackup
set nowb
set noswapfile

" Open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" Show undo tree
nmap <silent> <leader>u :GundoToggle<CR>

" CtrlP settings
nnoremap <silent> <Leader><space> :CtrlP<CR>
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](.git)$',
  \ 'file': '\v\.(class)$',
  \ }

if executable('fd')
  let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
  let g:ctrlp_use_caching = 0
endif

" Search for word under the cursor in the entire project
" (requires the silver searcher (ag) plugin)
nmap <Leader>s :Rg <C-R><C-W><CR>

" Execute current file
nmap <leader>x :!./%<cr>

" }}}

" Text, tab and indent related {{{

" . is not part of identifiers
set iskeyword-=.

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Use system clipboard
:set clipboard^=unnamedplus

" Paste and re-select
nnoremap <expr> gV    "`[".getregtype(v:register)[0]."`]"

" Make Y behave like other capitals
nnoremap Y y$

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Move to beginning/end of line
nnoremap B ^
nnoremap E $

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l

tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-l> <c-\><c-n><c-w>l

" https://github.com/neovim/neovim/issues/2048#issuecomment-78534227
  " nmap <BS> <c-w>h

" Disable highlight when <leader><cr> is pressed
" but preserve cursor coloring
nmap <silent> <leader><cr> :noh<cr>

" Remove trailing whitespaces
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" Toggle relative line numbers
nnoremap <silent><leader>n :set rnu! rnu? <cr>

" }}}

" Visual mode related {{{

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" }}}

" Moving around, tabs, windows and buffers {{{

" don't close buffers when you aren't displaying them
set hidden

" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

" previous buffer, next buffer
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>

" delete buffer without closing pane
noremap <leader>bd :Bd<cr>

" fuzzy find buffers
noremap <leader>b<space> :CtrlPBuffer<cr>

" Toggle Tagbar, and focus it
nmap <leader>= :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" }}}

" Status line {{{

" Always show the status line
set laststatus=2

" Do not show buffers in tab bar
let g:airline#extensions#tabline#enabled = 0

" }}}

" Editing mappings {{{

" Search for visual selection
vnoremap // y/<C-R>"<CR>

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

augroup whitespace
  autocmd!
  autocmd BufWrite *.hs :call DeleteTrailingWS()
augroup END

" }}}

" Return to last edit position when opening files (You want this!)
augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END

" Remember info about open buffers on close
set viminfo^=%

" Open window splits in various places
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

" }}}

" NERDTree {{{

" Close nerdtree after a file is selected
let NERDTreeQuitOnOpen = 1

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>F <ESC>:NERDTreeToggle<CR>

" Override ugly default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" }}}

" Alignment {{{

" Stop Align plugin from forcing its mappings on us
let g:loaded_AlignMapsPlugin=1
" Align on equal signs
map <Leader>a= :Align =<CR>
" Align on commas
map <Leader>a, :Align ,<CR>
" Align on pipes
map <Leader>a<bar> :Align <bar><CR>
" Prompt for align character
map <leader>ap :Align

" }}}

" Language Server {{{

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie-wrapper', '--lsp'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

" \ 'scala': ['node', expand('~/.bin/sbt-server-stdio.js')],

nnoremap <F6> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" }}}

" Java decompiler
augroup filetypedetect
au bufreadpost,filereadpost *.class silent %!cfr %
au bufreadpost,filereadpost *.class silent normal gg=G
au bufread,bufnewfile *.class setfiletype class
augroup END

" Deoplete
let g:deoplete#enable_at_startup = 1

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction "}}}


