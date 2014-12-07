
" See the default vimrc at
" https://github.com/romac/haskell-vim-now/blob/master/.vimrc

" Highlight current line
set cursorline

" Don't use folding
set nofoldenable

if has("gui_running")
  " Font face & size
  " set guifont=DejaVu\ Sans\ Mono:h15
  set guifont=Monaco\ for\ Powerline:h15
  " set guifont=Inconsolata-g\ for\ Powerline:h16
  set guioptions-=L

  " Hide scrollbars and toolbars in MacVim
  set guioptions-=T
  set guioptions-=r

  " Tell MacVim not to load its own colorscheme
  let macvim_skip_colorscheme=1
endif

" Enable Powerline font in Airline
let g:airline_powerline_fonts = 1

" Bundles

" Idris
Bundle 'idris-hackers/idris-vim'

" ooc
Bundle 'nddrylliog/ooc.vim'

" Scala
Bundle 'derekwyatt/vim-scala'
au BufRead,BufNewFile *.scala setfiletype scala

" Ag
Bundle 'rking/ag.vim'

" Javascript & JSON
Bundle 'pangloss/vim-javascript'
Bundle 'elzr/vim-json'
au BufRead,BufNewFile *.json setfiletype json

" JSX
Bundle 'mxw/vim-jsx'

" PureScript
Bundle 'raichoo/purescript-vim'

" HTML
Bundle 'xenoterracide/html.vim'
Bundle 'mattn/emmet-vim'

" CSS
Bundle 'gorodinskiy/vim-coloresque'

" Markdown
Bundle 'tpope/vim-markdown'

" Vim sugar for UNIX shell commands
Bundle 'tpope/vim-eunuch'

" Git
Bundle 'airblade/vim-gitgutter'

" Colorscheme
Bundle 'effkay/argonaut.vim'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

" EditorConfig (http://editorconfig.org)
Bundle 'editorconfig/editorconfig-vim'

" Auto-close quotes, parenthesis, etc.
Bundle 'Raimondi/delimitMate'

" Rust
Bundle 'wting/rust.vim'
au BufRead,BufNewFile *.rs setfiletype rust

" Execute whole/part of editing file and show the result
Bundle 'thinca/vim-quickrun'

" TOML
Bundle 'cespare/vim-toml'
au BufRead,BufNewFile *.toml setfiletype toml

" LLVM
Bundle 'Superbil/llvm.vim'

try
  colorscheme Tomorrow-Night
  catch
endtry

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Paste and re-select
nnoremap <expr> gV    "`[".getregtype(v:register)[0]."`]"

" Make Y behave like other capitals
nnoremap Y y$

" Map jk to <Esc>
inoremap jk <Esc>

" Custom leaders
let mapleader = ","
let maplocalleader = "_"

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=black guibg=black
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" Tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Search for word under the cursor in the entire project
" (requires the silver searcher (ag) plugin)
map <Leader>s :Ag <C-R><C-W><CR>

if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    silent let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>d :call SelectaCommand("find * -type f", "", ":e")<cr>

cnoremap %% <C-R>=expand('%:h').'/'<cr>

imap <c-c> <esc>
nnoremap <leader><leader> <c-^>

