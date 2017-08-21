
let g:psc_ide_syntastic_mode = 1

nm <buffer> <silent> <leader>t :<C-U>call PSCIDEtype(PSCIDEgetKeyword(), v:true)<CR>
nm <buffer> <silent> <leader>T :<C-U>call PSCIDEaddTypeAnnotation(matchstr(getline(line(".")), '^\s*\zs\k\+\ze'))<CR>
nm <buffer> <silent> <leader>s :<C-U>call PSCIDEapplySuggestion()<CR>
nm <buffer> <silent> <leader>a :<C-U>call PSCIDEaddTypeAnnotation()<CR>
nm <buffer> <silent> <leader>i :<C-U>call PSCIDEimportIdentifier(PSCIDEgetKeyword())<CR>
nm <buffer> <silent> <leader>r :<C-U>call PSCIDEload()<CR>
nm <buffer> <silent> <leader>p :<C-U>call PSCIDEpursuit(PSCIDEgetKeyword())<CR>
nm <buffer> <silent> <leader>C :<C-U>PSCIDEcaseSplit<SPACE>
nm <buffer> <silent> <leader>qd :<C-U>call PSCIDEremoveImportQualifications()<CR>
nm <buffer> <silent> <leader>qa :<C-U>call PSCIDEaddImportQualifications()<CR>
nm <buffer> <silent> ]d :<C-U>call PSCIDEgoToDefinition(PSCIDEgetKeyword())<CR>
