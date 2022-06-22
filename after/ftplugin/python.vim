if exists(':AsyncRun')
  nnoremap <buffer><silent> <F9> :<C-U>AsyncRun python -u "%"<CR>
endif

set colorcolumn=100

" For delimitMate
let b:delimitMate_matchpairs = "(:),[:],{:}"
