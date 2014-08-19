
" See the default vimrc at
" https://github.com/romac/haskell-vim-now/blob/master/.vimrc

" Font face & size
set guifont=DejaVu\ Sans\ Mono:h15

" Highlight current line
set cursorline

" Don't use folding
set nofoldenable

" Tomorrow-Night ColorScheme
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

try
  colorscheme Tomorrow-Night
  catch
endtry

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

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
