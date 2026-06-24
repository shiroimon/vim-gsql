" Vim ftplugin file
" Language:     GoogleSQL (BigQuery / Spanner / Dataform)
" Maintainer:   shiroimon
" Repository:   https://github.com/shiroimon/vim-gsql
" License:      MIT

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

setlocal foldmethod=expr
setlocal foldexpr=GetGsqlFold(v:lnum)
setlocal foldlevel=99

if exists('*GetGsqlFold')
  finish
endif

" Return '=' if the next line opens a new clause (single-line clause)
function! s:gsql_fold_clause(lnum, next_closes)
    let next = getline(a:lnum + 1)
    return next =~? a:next_closes ? '=' : '>1'
endfunction

function! GetGsqlFold(lnum)
    let line = getline(a:lnum)

    "" Pattern: next line starts a new clause → don't fold current
    let next_closes = '^\s*\()\|;\|\<select\>\|\<from\>\|\<where\>\|\<having\>\|\<order\>\|\<group\>\|\<qualify\>\|\<limit\>\|\<with\>\)'

    "" SQL clause keywords → fold start
    if line =~? '^\s*\<with\>'
        return '>1'
    elseif line =~? '^\s*\<select\>'
        return s:gsql_fold_clause(a:lnum, next_closes)
    elseif line =~? '^\s*\<where\>'
        return s:gsql_fold_clause(a:lnum, next_closes)
    elseif line =~? '^\s*\<from\>'
        return '>1'
    elseif line =~? '^\s*\<group\s\+by\>'
        return s:gsql_fold_clause(a:lnum, next_closes)
    elseif line =~? '^\s*\<order\s\+by\>'
        return s:gsql_fold_clause(a:lnum, next_closes)
    elseif line =~? '^\s*\<having\>'
        return s:gsql_fold_clause(a:lnum, next_closes)
    elseif line =~? '^\s*\<qualify\>'
        return s:gsql_fold_clause(a:lnum, next_closes)
    elseif line =~? '^\s*\(\<left\>\|\<inner\>\|\<cross\>\|\<right\>\|\<full\>\)\?\s*\<join\>'
        return '>1'
    "" Statement close ";"
    elseif line =~? '^\s*;'
        return '>1'
    "" Line ending with ( → fold level +1 (CTE, subquery)
    elseif line =~ '(\s*$'
        return 'a1'
    "" Line with only ) → fold level -1
    elseif line =~ '^\s*)\s*\(,\)\?\s*$'
        return 's1'
    endif
    return '='
endfunction

" vim: ts=8
