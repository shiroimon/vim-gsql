" Vim syntax file
" Language:     LookML (Looker modeling language)
" Maintainer:   shiroimon
" Repository:   https://github.com/shiroimon/vim-gsql
" License:      MIT

if exists("b:current_syntax")
  finish
endif

" Include gsql syntax for embedding in sql: blocks
execute 'syn include @gsqlSQL ' . expand('<sfile>:p:h') . '/gsql.vim'
unlet! b:current_syntax

syn case ignore

" ---------------------------------------------------------------------------
" Comments (LookML uses # for line comments)
" ---------------------------------------------------------------------------
syn match lookmlComment "#.*$" contains=lookmlTodo
syn keyword lookmlTodo TODO FIXME XXX DEBUG NOTE contained

" ---------------------------------------------------------------------------
" Strings
" ---------------------------------------------------------------------------
syn region lookmlString start=+"+ end=+"+ oneline
syn region lookmlString start=+'+ end=+'+ oneline

" ---------------------------------------------------------------------------
" Numbers
" ---------------------------------------------------------------------------
syn match lookmlNumber "\<\d\+\>"

" ---------------------------------------------------------------------------
" Booleans
" ---------------------------------------------------------------------------
syn keyword lookmlBoolean yes no

" ---------------------------------------------------------------------------
" Statement terminator ;;
" ---------------------------------------------------------------------------
syn match lookmlTerminator ";;"

" ---------------------------------------------------------------------------
" Block declarations (view: name {, dimension: name {, etc.)
" ---------------------------------------------------------------------------
syn match lookmlBlock "\<\(view\|explore\|join\|dimension\|dimension_group\|measure\|filter\|parameter\|set\|derived_table\|link\|action\|named_value_format\|access_grant\|map_layer\|datagroup\|aggregate_table\|extends\)\s*:" containedin=ALLBUT,lookmlComment,lookmlString,lookmlSqlRegion

" ---------------------------------------------------------------------------
" Non-SQL property keywords (type:, label:, description:, etc.)
" ---------------------------------------------------------------------------
syn match lookmlProperty "\<\(type\|label\|description\|relationship\|datatype\|timeframes\|hidden\|primary_key\|value_format\|value_format_name\|group_label\|group_item_label\|view_label\|view_name\|drill_fields\|fields\|tags\|suggestions\|suggest_dimension\|suggest_explore\|suggest_persist_for\|allowed_value\|style\|persist_for\|persist_with\|from\|connection\|include\|required_access_grants\|required_fields\|can_filter\|convert_tz\|order_by_field\|case_sensitive\|alpha_sort\|skip_drill_filter\|fanout_on\|always_filter\|conditionally_filter\|access_filter\|filters\|html\|url\|icon_url\|default_value\|tiers\|map_layer_name\|direction\|sortkeys\|distribution_style\|distribution\|indexes\|max_cache_age\|explore_source\|bind_filters\|bind_all_filters\|column\|create_process\|materialized_view\|datagroup_trigger\|publish_as_db_view\|label_from_parameter\|intervals\|allow_approximate_optimization\|cluster_keys\|partition_keys\)\s*:" containedin=ALLBUT,lookmlComment,lookmlString,lookmlSqlRegion

" ---------------------------------------------------------------------------
" Generic key: fallback (catches dashboard keys and unlisted properties)
" ---------------------------------------------------------------------------
syn match lookmlGenericKey "^\s*\zs[a-zA-Z_]\+\s*:" containedin=ALLBUT,lookmlComment,lookmlString,lookmlSqlRegion

" ---------------------------------------------------------------------------
" SQL property regions -- embedded gsql highlighting
" ---------------------------------------------------------------------------
syn region lookmlSqlRegion matchgroup=lookmlSqlProperty start="\<\(sql\|sql_table_name\|sql_on\|sql_always_where\|sql_always_having\|sql_where\|sql_distinct_key\|sql_trigger_value\|sql_create\|sql_step\|sql_preamble\)\s*:" end=";;" contains=@gsqlSQL,lookmlFieldRef,lookmlLiquidOutput,lookmlLiquidTag keepend

" ---------------------------------------------------------------------------
" SQL clause keywords -- override gsql groups to use Statement highlight
" ---------------------------------------------------------------------------
syn keyword lookmlSqlStatement create update alter select insert delete drop merge contained containedin=lookmlSqlRegion
syn keyword lookmlSqlClause from where join inner outer left right full cross on as by order group having limit offset case when then else end with contained containedin=lookmlSqlRegion

" ---------------------------------------------------------------------------
" LookML field references  ${view_name.field_name}
" ---------------------------------------------------------------------------
syn match lookmlFieldRef "\${[a-zA-Z_][a-zA-Z0-9_.]*}" containedin=lookmlSqlRegion

" ---------------------------------------------------------------------------
" LookML constant references  @{constant_name}
" ---------------------------------------------------------------------------
syn match lookmlConstantRef "@{[a-zA-Z_][a-zA-Z0-9_]*}" containedin=ALLBUT,lookmlComment

" ---------------------------------------------------------------------------
" Liquid templates (used in sql:, html:, label:, etc.)
" ---------------------------------------------------------------------------
syn region lookmlLiquidOutput matchgroup=lookmlLiquidDelim start="{{" end="}}" containedin=ALLBUT,lookmlComment,lookmlString,lookmlLiquidString contains=lookmlLiquidFilter,lookmlLiquidString
syn region lookmlLiquidTag matchgroup=lookmlLiquidDelim start="{%" end="%}" containedin=ALLBUT,lookmlComment,lookmlString,lookmlLiquidString contains=lookmlLiquidKeyword,lookmlLiquidString,lookmlLiquidFilter
syn keyword lookmlLiquidKeyword if elsif else endif unless endunless for endfor assign capture endcapture case when endcase comment endcomment parameter condition contained
syn match lookmlLiquidFilter "|\s*\w\+" contained
syn region lookmlLiquidString start=+"+ end=+"+ contained
syn region lookmlLiquidString start=+'+ end=+'+ contained

" ---------------------------------------------------------------------------
" Synchronization
" ---------------------------------------------------------------------------
syn sync fromstart

" ---------------------------------------------------------------------------
" Highlight links
" ---------------------------------------------------------------------------
hi def link lookmlComment      Comment
hi def link lookmlTodo         Todo
hi def link lookmlString       String
hi def link lookmlNumber       Number
hi def link lookmlBoolean      Boolean
hi def link lookmlTerminator   Delimiter
hi def link lookmlBlock        Structure
hi def link lookmlProperty     Identifier
hi def link lookmlSqlProperty  Identifier
hi def link lookmlGenericKey   Keyword
hi def link lookmlSqlStatement Statement
hi def link lookmlSqlClause    Statement
hi def link lookmlFieldRef     Special
hi def link lookmlConstantRef  Special
hi def link lookmlLiquidDelim  Delimiter
hi def link lookmlLiquidOutput Special
hi def link lookmlLiquidTag    Special
hi def link lookmlLiquidKeyword Keyword
hi def link lookmlLiquidFilter Function
hi def link lookmlLiquidString String

let b:current_syntax = "lookml"

" vim: ts=8
