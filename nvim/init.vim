" This is a fork of Joe Nelson's haskell-vim-now Vim configuration.
" Original here: https://github.com/begriffs/haskell-vim-now
"
" Licensed under the MIT license

" General {{{
"
if &shell =~# 'fish$'
    set shell=bash
endif

" use indentation for folds
set foldmethod=manual
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0

" Space open/closes folds
nnoremap <space> za

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

let localleader = "_"
let g:localleader = "_"

" Leader key timeout
set tm=2000

" Allow the normal use of "," by pressing it twice
noremap ,, ,

" Use par for prettier line formatting
set formatprg="PARINIT='rTbgqR B=.,?_A_a Q=_s>|' par\ -w72"

" Open a new window when using as visual editor
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

" }}}

" Plugins {{{

call plug#begin('~/.config/nvim/plugged')

" Color scheme
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim'}
Plug 'effkay/argonaut.vim'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'altercation/vim-colors-solarized'
Plug 'raichoo/monodark'

" Support bundles
Plug 'jgdavey/tslime.vim'
Plug 'Shougo/vimproc.vim'
" Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'benekastah/neomake'
Plug 'moll/vim-bbye'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/gitignore'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Plug 'luochen1990/rainbow'
" let g:rainbow_active = 1

" Terminal emulation
Plug 'kassio/neoterm'

" Git
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'
Plug 'sgur/vim-lazygutter'
" Plug 'airblade/vim-gitgutter'

" Vim sugar for UNIX shell commands
Plug 'tpope/vim-eunuch'

" EditorConfig (http://editorconfig.org)
Plug 'editorconfig/editorconfig-vim'

" Bars, panels, and files
Plug 'scrooloose/nerdtree' " , { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline', { 'commit': 'f0a508b1216215c01640f06d23889934097924ee' }
" Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
" Plug 'rking/ag.vim'
Plug 'dkprice/vim-easygrep'
Plug 'jremmen/vim-ripgrep'
let g:rg_highlight = 1

" Text manipulation
Plug 'vim-scripts/Align'
Plug 'vim-scripts/Gundo'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'michaeljsmith/vim-indent-object'

" Auto-close quotes, parenthesis, etc.
Plug 'Raimondi/delimitMate'

" Wrap words and sentences up in quotes or brackets or tags
Plug 'tpope/vim-surround'

" Display the undo history in a graph
Plug 'mbbill/undotree'

" Autoformat source files
Plug 'Chiel92/vim-autoformat'

" Detect modifications in vim buffers
Plug 'let-def/vimbufsync'

" Execute whole/part of editing file and show the result
" Plug 'thinca/vim-quickrun'

" Allow pane movement to jump out of vim into tmux
Plug 'christoomey/vim-tmux-navigator'

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim', 'for': 'haskell' }
Plug 'nbouscal/vim-stylish-haskell', { 'for': 'haskell' }

" Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
" Plug 'parsonsmatt/intero-neovim', { 'for': 'haskell' }

" Coq
Plug 'whonore/Coqtail'

" Markdown
Plug 'tpope/vim-markdown'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax' 

" Swift
Plug 'keith/swift.vim'

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
let g:rustfmt_autosave = 1
let g:rustfmt_command = 'rustup run nightly rustfmt'

" Plug 'racer-rust/vim-racer', { 'for': 'rust' }
" let g:racer_cmd = "/Users/romac/.cargo/bin/racer"
" let g:racer_experimental_completer = 1

" au FileType rust nmap gd <Plug>(rust-def)
" au FileType rust nmap gs <Plug>(rust-def-split)
" au FileType rust nmap gx <Plug>(rust-def-vertical)
" au FileType rust nmap <leader>gd <Plug>(rust-doc)

" Scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
" Plug 'ensime/ensime-vim'

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }

" TOML
Plug 'cespare/vim-toml', { 'for': 'toml' }

" Fish
Plug 'dag/vim-fish', { 'for': 'fish' }

" LLVM
Plug 'Superbil/llvm.vim'

" Dafny
Plug 'mlr-msft/vim-loves-dafny', { 'for': 'dafny' }

let g:neomake_dafny_dafny_maker = {
    \ 'exe': 'mono',
    \ 'args': ['/usr/local/dafny/Dafny.exe', '-timeLimit:10', '-compile:0'],
    \ 'errorformat': '\ %#%f(%l\\\,%c):\ %m',
    \ }

let g:neomake_dafny_enabled_makers = ['dafny']

" CSS
" Plug 'gorodinskiy/vim-coloresque'

" HTML
Plug 'xenoterracide/html.vim', { 'for': 'elixir' }
Plug 'mattn/emmet-vim'

" Javascript & JSON
Plug 'pangloss/vim-javascript'
" Plug 'othree/yajs.vim'
" Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'

" PureScript
Plug 'raichoo/purescript-vim', { 'for': 'purescript' }
Plug 'frigoeu/psc-ide-vim', { 'for': 'purescript' }

" TypeScript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" Plug 'Quramy/tsuquyomi'

" Idris
Plug 'idris-hackers/idris-vim', { 'for': 'idris' }

" ooc
Plug 'nddrylliog/ooc.vim', { 'for': 'ooc' }

" SMT-LIB
Plug 'raichoo/smt-vim'

" Add plugins to &runtimepath
call plug#end()

" }}}

" Scala {{{

" Scalafmt
" augroup filetype_scala
"   au!
"   au BufRead,BufNewFile *.sbt set filetype=scala
"   au BufWrite *.scala :Autoformat
"   let g:formatdef_scalafmt = "'ng scalafmt --stdin'"
"   let g:formatters_scala = ['scalafmt']
" augroup END

" }}}

" Java decompiler

augroup filetypedetect
au bufreadpost,filereadpost *.class silent %!cfr %
au bufreadpost,filereadpost *.class silent normal gg=G
au bufread,bufnewfile *.class setfiletype class
augroup END

" Bundle config {{{

" Language Server

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_rename()<CR>

" Deoplete

let g:deoplete#enable_at_startup = 1
" let g:deoplete#disable_auto_complete = 1

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction "}}}

" Markdown
let g:vim_markdown_frontmatter=1

" JSX

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" TypeScript
let g:neomake_typescript_enabled_makers = []

" }}}

" Colors and Fonts {{{

" Enable syntax highlighting
syntax enable

" Enable True Color
set termguicolors
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" let my_colorscheme="monodark"
let my_colorscheme="hybrid"

" Color scheme
set background=dark
exe 'colorscheme ' . my_colorscheme

" Re-apply color scheme to fix wrong colors and missing airline theme
" exe 'autocmd VimEnter * colorscheme ' . my_colorscheme
" autocmd VimEnter * AirlineRefresh

" Highlight current line
set cursorline

if has("gui_running")
  " Font face & size
  set guifont=Monaco\ for\ Powerline:h16
  " set guifont=Source\ Code\ Pro\ for\ Powerline:h16
  " set guifont=Inconsolata-dz\ for\ Powerline:h16
  " set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h16
  " set guifont=Droid\ Sans\ Mono\ for\ Powerline:h16
  " set guifont=Ubuntu\ Mono\ derivative\ Powerline:h18
  " set guifont=Meslo\ LG\ L\ Regular\ for\ Powerline:h16

  set guioptions-=L

  " Hide scrollbars and toolbars in MacVim
  set guioptions-=T
  set guioptions-=r

  " Tell MacVim not to load its own colorscheme
  let macvim_skip_colorscheme = 1
endif

" Don't blink normal mode cursor
set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkon0

" Enable Powerline font in Airline
let g:airline_powerline_fonts = 1

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" }}}

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
" }}}

" Terminal {{{

tnoremap <Esc> <C-\><C-n>

" }}}

" Files, backups and undo {{{

" Turn backup off, since most stuff is in Git anyway...
set nobackup
set nowb
set noswapfile

" Source the vimrc file after saving it
" augroup sourcing
"   autocmd!
"   autocmd bufwritepost init.vim source $MYVIMRC
" augroup END

" Open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" Show undo tree
nmap <silent> <leader>u :GundoToggle<CR>

" Fuzzy find files
nnoremap <silent> <Leader><space> :CtrlP<CR>
let g:ctrlp_max_files=0
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](.git)$' }

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" CtrlP settings
" let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" Search for word under the cursor in the entire project
" (requires the silver searcher (ag) plugin)
nmap <Leader>s :Ag <C-R><C-W><CR>

" Search with Ag
nnoremap <Leader>a :Ag 

" Show all TODO in the project
command Todo Rg 'TODO\|FIXME'

" Execute current file
nmap <leader>x :!./%<cr>

" }}}

" Neomake {{{

autocmd! BufWritePost * Neomake

" Show errors list
map <silent> <leader>e :lopen<CR>

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

" Spell checking {{{

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

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

" }}

" Haskell {{{

" Linters
let g:neomake_haskell_enabled_makers = ['hdevtools', 'hlint', 'ghcmod']

" Enable some tabular presets for Haskell
let g:haskell_tabular = 1
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

" Intero

" Process management:
nnoremap <Leader>hio :InteroOpen<CR>
nnoremap <Leader>hik :InteroKill<CR>
nnoremap <Leader>hic :InteroHide<CR>
nnoremap <Leader>hil :InteroLoadCurrentModule<CR>

" REPL commands
nnoremap <Leader>hie :InteroEval<CR>
nnoremap <Leader>hit :InteroGenericType<CR>
nnoremap <Leader>hiT :InteroType<CR>
nnoremap <Leader>hii :InteroInfo<CR>
nnoremap <Leader>hiI :InteroTypeInsert<CR>

" Go to definition:
nnoremap <Leader>hid :InteroGoToDef<CR>

" Highlight uses of identifier:
nnoremap <Leader>hiu :InteroUses<CR>

augroup filetype_haskell
  let g:haskellmode_completion_ghc = 0
  au FileType haskell setlocal omnifunc=necoghc#omnifunc

  " Reload the file in Intero after saving
  " autocmd! BufWritePost *.hs InteroReload
augroup END


" GHC Mod
" augroup haskell
"   autocmd!
  " autocmd FileType haskell map <silent> <leader><cr> :noh<cr>:GhcModTypeClear<cr>
  " autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" augroup END

" Type of expression under cursor
" nmap <silent> <leader>ht :GhcModType<CR>

" Insert type of expression under cursor
" nmap <silent> <leader>hT :GhcModTypeInsert<CR>

" GHC errors and warnings
" nmap <silent> <leader>hc :Neomake ghcmod<CR>

" }}}

" Tamarin Prover {{{

augroup filetype_tamaring
  au!
  au BufNewFile,BufRead *.spthy	setf spthy
  au BufNewFile,BufRead *.sapic	setf sapic
augroup END

" }}}
