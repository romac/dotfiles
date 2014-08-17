
" Font face & size
set guifont=Source\ Code\ Pro:h16

" Hightlight current line
set cursorline

" Tomorrow-Night ColorScheme
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
try
  colorscheme Tomorrow-Night
  catch
endtry
