
" Plugins {{{

call plug#begin('~/.local/share/nvim/plugged')

" Support
Plug 'nvim-lua/plenary.nvim' " For Telescope

" Colorschemes
Plug 'w0ng/vim-hybrid'
Plug 'lifepillar/vim-solarized8'
Plug 'cocopon/iceberg.vim'
Plug 'sainnhe/everforest'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" IDE
Plug 'vim-scripts/gitignore'
Plug 'scrooloose/nerdtree'
" Plug 'ms-jpq/chadtree', { 'branch': 'chad', 'do': 'python3 -m chadtree deps' }
Plug 'vim-airline/vim-airline'

" UI
Plug 'rcarriga/nvim-notify'
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
" lua require("noice").setup()

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Distraction-free writing
Plug 'junegunn/goyo.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Text manipulation
Plug 'vim-scripts/Align'
Plug 'tpope/vim-commentary'
" Plug 'majutsushi/tagbar'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'
Plug 'sbdchd/neoformat'
" Plug 'SirVer/ultisnips'
" let g:UltiSnipsExpandTrigger = "<c-m>"
Plug 'honza/vim-snippets'

" GitHub Copilot
Plug 'github/copilot.vim'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:rainbow_conf = {
\  'separately': {
\    'html': 0,
\  }
\}

" Search
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'jremmen/vim-ripgrep'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }


" ALE
" Plug 'w0rp/ale'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'
Plug 'sgur/vim-lazygutter'
Plug 'tpope/vim-rhubarb'

" Idris
Plug 'edwinb/idris2-vim', { 'for': 'idris' }

" SMT-LIB
Plug 'bohlender/vim-smt2'

" Nginx
Plug 'chr4/nginx.vim'

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim', 'for': 'haskell' }
" Plug 'nbouscal/vim-stylish-haskell', { 'for': 'haskell' }

" Unison
Plug 'unisonweb/unison', { 'branch': 'trunk', 'rtp': 'editor-support/vim' }

" PureScript
Plug 'raichoo/purescript-vim', { 'for': 'purescript' }
Plug 'frigoeu/psc-ide-vim', { 'for': 'purescript' }

" Dhall
Plug 'vmchale/dhall-vim', { 'for': 'dhall' }

" ooc
Plug 'fasterthanlime/ooc.vim'

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'mhinz/vim-crates'
" let g:rustfmt_autosave = 1
" let g:rustfmt_command = 'rustup run stable rustfmt'

if has('nvim')
  autocmd BufRead Cargo.toml call crates#toggle()
endif

" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" TOML
Plug 'cespare/vim-toml', { 'for': 'toml' }
augroup filetypedetect
au bufread,bufnewfile *.toml setfiletype toml
augroup END

" Quint
" augroup syntax
" au! BufNewFile,BufReadPost *.qnt
" au  BufNewFile,BufReadPost *.qnt so ~/.config/nvim/syntax/quint.vim
" augroup END

" Swift
Plug 'keith/swift.vim', { 'for': 'swift' }

" Coq
Plug 'whonore/Coqtail', { 'for': 'coq' }
Plug 'let-def/vimbufsync'

" TLA+
" Plug 'hwayne/tla.vim', { 'for': 'tla' }
Plug 'florentc/vim-tla', { 'for': 'tla' }

" Scala
Plug 'derekwyatt/vim-scala', { 'for': ['scala', 'sbt'] }
au BufRead,BufNewFile *.sbt set filetype=scala

" Flix
Plug '/Users/romac/Code/vim-flix', { 'for': 'flix' }

" Kotlin
Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }

" Nix
Plug 'LnL7/vim-nix', { 'for': 'nix' }

" HTML & CSS
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
Plug 'ap/vim-css-color', { 'for': 'css' }
let g:user_emmet_leader_key=','

" ZZ
Plug 'aep/zz', { 'rtp': 'zz.vim', 'for': 'zz' }

" Wiki
Plug 'lervag/wiki.vim'
let g:wiki_root = '~/Wiki'

" Pact Smart Contracts
Plug 'wsdjeg/vim-pact', { 'for': 'pact' }

" Case conversions
Plug 'tpope/vim-abolish'
" nicwest/vim-camelsnek

call plug#end()

" }}}

" General {{{

" Leader key
let mapleader = ","
let g:mapleader = ","

" Local leader key
let localleader = "\\"
let g:localleader = "\\"

" Leader key timeout
set tm=2000

" Allow the normal use of "," by pressing it twice
noremap ,, ,

" Disable folds by default
set nofoldenable

" Space open/closes folds
nnoremap <space> za

" I can't type
command! W :w

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

let g:everforest_background = 'hard'

" Dark mode by default
set background=dark
colorscheme Iceberg
" colorscheme tokyonight-night

" Background
if $DARK_MODE != 'on'
  set background=light
  colorscheme solarized8_high
  " colorscheme Iceberg
  " colorscheme everforest
endif

" Highlight current line
set cursorline

" Enable Powerline font in Airline
let g:airline_powerline_fonts = 1

" VIM user interface {{{

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

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
" set lazyredraw

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
map <silent> <leader>R :redraw!<CR>

" Turn mouse mode on
" nnoremap <leader>ma :set mouse=a<cr>

" Turn mouse mode off
" nnoremap <leader>mo :set mouse=<cr>

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
set undofile
set undodir=~/.config/nvim/undodir

" Open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" Show undo tree
nmap <silent> <leader>u :GundoToggle<CR>

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

map <leader>m :call RenameFile()<cr>

" " CtrlP settings
" nnoremap <silent> <Leader><space> :CtrlP<CR>
" let g:ctrlp_max_files = 0
" let g:ctrlp_show_hidden = 1
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0

" let g:ctrlp_custom_ignore = {
"   \ 'dir': '\v[\/](.git)$',
"   \ 'file': '\v\.(class)$',
"   \ }

" if executable('fd')
"   let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
"   let g:ctrlp_use_caching = 0
" endif


" Rg {{{
" let g:rg_highlight = 1

" Search for word under the cursor in the entire project
" nmap <Leader>S :Rg <C-R><C-W><CR>

" Toggle Rg
" nmap <Leader>r :Rg<space>

" }}}

" Execute current file
nmap <leader>x :!./%<cr>

" Show quickfix window
:nmap <leader>q :lop<cr>

" }}}

" Text, tab and indent related {{{

" . is not part of identifiers
set iskeyword-=.

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

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

" Move from pane to pane
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l

" Terminal mappings

tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

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
" noremap <leader>b<space> :CtrlPBuffer<cr>

" Toggle Tagbar, and focus it
nmap <leader>= :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" }}}

" Coc {{{

" Fix completion background color
autocmd VimEnter,ColorScheme * hi! link CocMenuSel PMenuSel
autocmd VimEnter,ColorScheme * hi! link CocSearch Identifier

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <Tab> and <S-Tab> to navigate the completion list:
function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ CheckBackSpace() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <cr> to confirm completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Applying codeAction to the selected region.
" Example: `<leader>cap` for current paragraph
xmap <leader>c  <Plug>(coc-codeaction-selected)
nmap <leader>c  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocCommand<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Fix current diagnostic
nnoremap <silent> <space>x  :<C-u>CocFix<CR>

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Reveal current current class (trait or object) in Tree View 'metalsBuild'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsBuild<CR>

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2


" Highlight comments in JSON
autocmd FileType json syntax match Comment +\/\/.\+$+

" }}}

" No EOF newlines in Rust code
" autocmd FileType rust set noendofline
" autocmd FileType rust set nofixendofline

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


" Telescope {{{
" Find files using Telescope command-line sugar.
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>S <cmd>Telescope grep_string<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

" CHADTree {{{

" Toggle CHADTree
" nnoremap <leader>f <cmd>CHADopen<cr>

" Start CHADTree and leave the cursor in it.
" autocmd VimEnter * CHADopen

" let g:chadtree_settings = {}
" let g:chadtree_settings.theme = {}
" let g:chadtree_settings.theme.icon_glyph_set = 'ascii'
" let g:chadtree_settings.theme.text_colour_set = 'nord' " 'nerdtree_syntax_dark'
" let g:chadtree_settings.keymap = {}
" let g:chadtree_settings.keymap.primary = ['o', '<enter>']
" let g:chadtree_settings.keymap.open_sys = []

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
let g:NERDTreeSortOrder = []

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

" Java decompiler
augroup filetypedetect
au BufReadPost,FileReadPost *.class silent %!cfr %
au BufReadPost,FileReadPost *.class silent normal gg=G
au BufRead,BufNewFile       *.class setfiletype java
augroup END

" TLA+
augroup tla_conceal
  autocmd!
  autocmd VimEnter,ColorScheme *.tla set conceallevel=2
  autocmd VimEnter,ColorScheme *.tla hi clear Conceal
augroup END

" Browse ZIP files
au BufRead,BufNewFile *.jar,*.war,*.ear,*.sar,*.rar set filetype=zip

" Neoformat

" Remap for do action format
nnoremap <silent> F :Neoformat<CR>

" let g:neoformat_enabled_haskell = ['stylish-haskell']

let g:neoformat_enabled_scala = ['scalafmt']
let g:neoformat_scala_scalafmt = {
  \ 'exe': 'scalafmt-native',
  \ 'args': ['--stdin'],
  \ 'stdin': 1,
  \ }

let g:neoformat_enabled_rust = []
" let g:neoformat_rust_rustfmtnightly = {
"   \ 'exe': 'rustup',
"   \ 'args': ['run', 'nightly', 'rustfmt'],
"   \ 'stdin': 1,
"   \ }

let g:neoformat_enabled_swift = ['swiftformat']

augroup fmt
  autocmd!
  autocmd BufWritePre *.js Neoformat
  autocmd BufWritePre *.swift Neoformat
  autocmd BufWritePre *.hs Neoformat
augroup END

autocmd Filetype haskell setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
