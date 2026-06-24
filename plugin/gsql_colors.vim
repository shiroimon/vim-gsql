" Apply colorscheme-specific syntax highlights for vim-gsql
" Repository:   https://github.com/shiroimon/vim-gsql
" License:      MIT

if exists('g:loaded_gsql_colors')
  finish
endif
let g:loaded_gsql_colors = 1

augroup gsql_colorscheme
  autocmd!
  autocmd ColorScheme * call gsql#colors#apply()
augroup END

" Apply for the initial colorscheme (already set before plugin loads)
call gsql#colors#apply()

" vim: ts=8
