
" See the default vimrc at
" https://github.com/romac/haskell-vim-now/blob/master/.vimrc

" Highlight current line
set cursorline

if has("gui_running")
  " Font face & size
  " set guifont=Source\ Code\ Pro\ for\ Powerline:h16
  set guifont=Monaco\ for\ Powerline:h16
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
  let macvim_skip_colorscheme=1
else
  " " Powerline
  " python from powerline.vim import setup as powerline_setup
  " python powerline_setup()
  " python del powerline_setup
endif

" Enable Powerline font in Airline
let g:airline_powerline_fonts = 1

" Do not show buffers in tab bar
let g:airline#extensions#tabline#enabled = 0

" Disable Syntastic check on quit
let g:syntastic_check_on_wq = 0

" Show errors list
map <silent> <leader>e :Errors<CR>

" Toggle Syntastic
map <leader>ss :SyntasticToggleMode<CR>

" Disable specific HLint errors
let g:ghcmod_hlint_options = ['--ignore=Reduce duplication']

" Toggle Tagbar, and focus it
nmap <leader>= :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Space open/closes folds
nnoremap <space> za

" Move to beginning/end of line
nnoremap B ^
nnoremap E $

try
  colorscheme Tomorrow-Night
  catch
endtry

" . is not part of identifiers
set iskeyword-=.

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Use system clipboard
" :set clipboard^=unnamedplus

" Paste and re-select
nnoremap <expr> gV    "`[".getregtype(v:register)[0]."`]"

" Make Y behave like other capitals
nnoremap Y y$

" Map jk to <Esc>
inoremap jk <Esc>

" Custom leaders
let mapleader = ","
let maplocalleader = "_"

nnoremap <leader>p :ClearCtrlPCache<CR>

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=black guibg=black
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_mode_map = { "mode": "active",
                           \ "active_filetypes": [],
                           \ "passive_filetypes": ["scala"] }

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
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" CtrlP settings
" let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" Search for word under the cursor in the entire project
" (requires the silver searcher (ag) plugin)
map <Leader>s :Ag <C-R><C-W><CR>

" Search with Ag
nnoremap <Leader>a :Ag 

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

" Toggle relative line numbers
nnoremap <silent><leader>n :set rnu! rnu? <cr>

" :au FocusLost * :set nornu
" :au FocusGained * :set rnu

" autocmd InsertEnter * :set nornu
" autocmd InsertLeave * :set rnu

if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif

if has('nvim')
  if filereadable(expand("~/.nvimrc.local"))
    source ~/.nvimrc.local
  endif
endif

