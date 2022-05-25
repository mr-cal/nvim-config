if !has('nvim-0.7.0')
  echohl Error | echomsg "Nvim 0.7.0 required, but is missing!" | echohl None
  finish
endif
let s:core_conf_files = [
      \ 'globals.vim',
      \ 'options.vim',
      \ 'autocommands.vim',
      \ 'mappings.vim',
      \ 'plugins.vim',
      \ 'themes.vim'
      \ ]

for s:fname in s:core_conf_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor
