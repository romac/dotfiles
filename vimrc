
" Font face & size
set guifont=Source\ Code\ Pro:h16

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

