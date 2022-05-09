let s:theme_setup_dict = {}

function! s:theme_setup_dict.gruvbox8() dict abort
  " Italic options should be put before colorscheme setting,
  " see https://github.com/morhetz/gruvbox/wiki/Terminal-specific#1-italics-is-disabled
  let g:gruvbox_italics=1
  let g:gruvbox_italicize_strings=1
  let g:gruvbox_filetype_hi_groups = 1
  let g:gruvbox_plugin_hi_groups = 1
  colorscheme gruvbox8_hard
endfunction

let s:gruvbox_name = 'gruvbox8'
let s:gruvbox_repo = 'vim-gruvbox8'

let s:theme = s:gruvbox_name
let s:theme_repo = s:gruvbox_repo
let s:colorscheme_func = printf('s:theme_setup_dict.%s()', s:theme)

if !has_key(s:theme_setup_dict, s:theme)
  let s:msg = "Invalid colorscheme function: " . s:colorscheme_func
  call v:lua.vim.notify(s:msg, 'error', {'title': 'nvim-config'})
  finish
endif

let s:status = utils#add_pack(s:theme_repo)
if !s:status
  echomsg printf("Theme %s not installed. Run PackerSync to install.", s:theme)
  finish
endif

execute 'call ' . s:colorscheme_func
if g:logging_level == 'info'
  let s:msg1 = "Colorscheme: " . s:theme
  call v:lua.vim.notify(s:msg1, 'info', {'title': 'nvim-config'})
endif
