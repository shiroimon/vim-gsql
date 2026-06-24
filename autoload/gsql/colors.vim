" Colorscheme-specific overrides for vim-gsql
" Repository:   https://github.com/shiroimon/vim-gsql
" License:      MIT

function! gsql#colors#apply() abort
  if exists('g:colors_name') && g:colors_name ==# 'iceberg'
    " gsql groups (iceberg palette)
    highlight gsqlKeyword       guifg=#84a0c6 ctermfg=110
    highlight gsqlStatement     guifg=#84a0c6 ctermfg=110
    highlight gsqlFunction      guifg=#89b8c2 ctermfg=109
    highlight gsqlSymbolOp      guifg=#e5c07b ctermfg=180
    highlight gsqlLiquidDelim   guifg=#c678dd ctermfg=176 gui=bold
    highlight gsqlLiquidOutput  guifg=#c678dd ctermfg=176
    highlight gsqlLiquidTag     guifg=#c678dd ctermfg=176
    highlight gsqlLookmlRef     guifg=#c678dd ctermfg=176
    highlight gsqlQuotedId      guifg=#c678dd ctermfg=176
    highlight gsqlQuotedIdDelim guifg=#c678dd ctermfg=176
    highlight gsqlDataformRef   guifg=#c678dd ctermfg=176
    highlight gsqlAliasPrefix   guifg=#777777 ctermfg=243
    highlight gsqlComma         guifg=#995577 ctermfg=132
    " lookml groups (iceberg palette)
    highlight lookmlSqlStatement guifg=#84a0c6 ctermfg=110
    highlight lookmlSqlClause    guifg=#84a0c6 ctermfg=110
    highlight lookmlFieldRef     guifg=#c678dd ctermfg=176
    highlight lookmlConstantRef  guifg=#c678dd ctermfg=176
    highlight lookmlLiquidDelim  guifg=#c678dd ctermfg=176 gui=bold
    highlight lookmlLiquidOutput guifg=#c678dd ctermfg=176
    highlight lookmlLiquidTag    guifg=#c678dd ctermfg=176
  else
    " Reset to syntax-file defaults (hi def link)
    highlight link gsqlKeyword       Keyword
    highlight link gsqlStatement     Statement
    highlight link gsqlFunction      Function
    highlight link gsqlSymbolOp      Operator
    highlight link gsqlLiquidDelim   Delimiter
    highlight link gsqlLiquidOutput  Special
    highlight link gsqlLiquidTag     Special
    highlight link gsqlLookmlRef     Special
    highlight link gsqlQuotedId      Identifier
    highlight link gsqlQuotedIdDelim Identifier
    highlight link gsqlDataformRef   PreProc
    highlight link gsqlAliasPrefix   Comment
    highlight link gsqlComma         Delimiter
    highlight link lookmlSqlStatement Statement
    highlight link lookmlSqlClause    Statement
    highlight link lookmlFieldRef     Special
    highlight link lookmlConstantRef  Special
    highlight link lookmlLiquidDelim  Delimiter
    highlight link lookmlLiquidOutput Special
    highlight link lookmlLiquidTag    Special
  endif
endfunction

" vim: ts=8
