" Vim syntax file
" Language:     GoogleSQL (BigQuery / Spanner / Dataform / Looker)
" Maintainer:   shiroimon
" Repository:   https://github.com/shiroimon/vim-gsql
" License:      MIT

if exists("b:current_syntax")
  finish
endif

syn case ignore

" ---------------------------------------------------------------------------
" Special constants
" ---------------------------------------------------------------------------
syn keyword gsqlSpecial false null true

" ---------------------------------------------------------------------------
" Keywords
" ---------------------------------------------------------------------------
syn keyword gsqlKeyword access add as asc begin by case cluster column
syn keyword gsqlKeyword connection constraint continue current default desc
syn keyword gsqlKeyword else elsif end except exclude export files for from
syn keyword gsqlKeyword function group having if immediate increment
syn keyword gsqlKeyword index into is limit load
syn keyword gsqlKeyword model modify matched no key of on
syn keyword gsqlKeyword partition partitions pivot unpivot qualify source
syn keyword gsqlKeyword table tablesample target
syn keyword gsqlKeyword then to trigger transaction
syn keyword gsqlKeyword unique values view when
syn keyword gsqlKeyword where with options order primary range
syn keyword gsqlKeyword recursive references reservation respect restrict repeat return row rows
syn keyword gsqlKeyword temp temporary unbounded using over window
syn keyword gsqlKeyword asc desc nulls first last
syn keyword gsqlKeyword preceding following current

" Spanner-specific keywords
syn keyword gsqlKeyword interleave parent storing null_filtered
syn keyword gsqlKeyword cascade sequence
syn keyword gsqlKeyword policy deletion

" ---------------------------------------------------------------------------
" Operators (keyword)
" ---------------------------------------------------------------------------
syn keyword gsqlOperator not and or replace
syn keyword gsqlOperator in any some all between exists
syn keyword gsqlOperator like escape
syn keyword gsqlOperator union intersect minus except
syn keyword gsqlOperator distinct interval safe

" ---------------------------------------------------------------------------
" Operators (symbol) -- excluded from comments and strings
" ---------------------------------------------------------------------------
syn match gsqlSymbolOp /=>/ containedin=ALLBUT,gsqlComment,gsqlString,gsqlQuotedId,gsqlLiquidTag,gsqlLiquidOutput,gsqlLookmlRef
syn match gsqlSymbolOp /<>/ containedin=ALLBUT,gsqlComment,gsqlString,gsqlQuotedId,gsqlLiquidTag,gsqlLiquidOutput,gsqlLookmlRef
syn match gsqlSymbolOp /!=/ containedin=ALLBUT,gsqlComment,gsqlString,gsqlQuotedId,gsqlLiquidTag,gsqlLiquidOutput,gsqlLookmlRef
syn match gsqlSymbolOp />=/ containedin=ALLBUT,gsqlComment,gsqlString,gsqlQuotedId,gsqlLiquidTag,gsqlLiquidOutput,gsqlLookmlRef
syn match gsqlSymbolOp /<=/ containedin=ALLBUT,gsqlComment,gsqlString,gsqlQuotedId,gsqlLiquidTag,gsqlLiquidOutput,gsqlLookmlRef
syn match gsqlSymbolOp /||/ containedin=ALLBUT,gsqlComment,gsqlString,gsqlQuotedId,gsqlLiquidTag,gsqlLiquidOutput,gsqlLookmlRef
syn match gsqlSymbolOp /[=+\-\*/<>!]/ containedin=ALLBUT,gsqlComment,gsqlString,gsqlQuotedId,gsqlLiquidTag,gsqlLiquidOutput,gsqlLookmlRef

" ---------------------------------------------------------------------------
" Statements (DML / DDL)
" ---------------------------------------------------------------------------
syn keyword gsqlStatement call delete drop execute grant lock
syn keyword gsqlStatement rename rollback set truncate merge
syn keyword gsqlStatement declare returns
syn keyword gsqlStatement join cross inner outer full
" Spanner DDL
syn keyword gsqlStatement analyze
" Contained so that folding works correctly
syn keyword gsqlStatement create update alter select insert contained

" ---------------------------------------------------------------------------
" Data types
" ---------------------------------------------------------------------------
syn keyword gsqlType array bignumeric bool bytes float64
syn keyword gsqlType geography int64 json numeric string struct
syn keyword gsqlType microsecond millisecond second minute hour dayofweek
syn keyword gsqlType day dayofyear week isoweek month quarter year isoyear
" Spanner-specific types
syn keyword gsqlType float32 int32 tokenlist proto enum
" date/datetime/time/timestamp は型/関数の両用。後方に '(' があれば関数として再マッチさせるため
" ここでは syn match の型フォールバックとして定義。
syn match gsqlType /\<\(date\|datetime\|time\|timestamp\)\>/

" ---------------------------------------------------------------------------
" Strings
" ---------------------------------------------------------------------------
syn region gsqlString matchgroup=Quote start=+"""+ end=+"""+
syn region gsqlString matchgroup=Quote start=+'''+  end=+'''+
syn region gsqlString matchgroup=Quote start=+"+    end=+"+ oneline
syn region gsqlString matchgroup=Quote start=+'+    end=+'+ oneline
syn region gsqlQuotedId matchgroup=gsqlQuotedIdDelim start=+`+ end=+`+ oneline
syn region gsqlString matchgroup=Quote start=+r"+   end=+"+ oneline
syn region gsqlString matchgroup=Quote start=+r'+   end=+'+ oneline

" ---------------------------------------------------------------------------
" Numbers
" ---------------------------------------------------------------------------
syn match gsqlNumber "-\=\<\d*\.\=[0-9_]\>"

" ---------------------------------------------------------------------------
" Folding
" ---------------------------------------------------------------------------
syn region gsqlFold start='^\s*\zs\c\(Create\|Update\|Alter\|Select\|Insert\|Merge\|With\)' end=';$\|^$' transparent fold contains=ALLBUT,gsqlDataformConfig,gsqlDataformJs,gsqlDataformOps,gsqlDataformKey,gsqlDataformString,gsqlDataformBoolean,gsqlDataformNumber,gsqlDataformComment,gsqlLiquidKeyword,gsqlLiquidFilter,gsqlLiquidString

" ---------------------------------------------------------------------------
" Aggregate functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction any_value array_agg array_concat_agg avg bit_and bit_or bit_xor
syn keyword gsqlFunction count countif logical_and logical_or max min string_agg sum

" Approximate aggregate functions
syn keyword gsqlFunction approx_count_distinct approx_quantiles approx_top_count approx_top_sum

" ---------------------------------------------------------------------------
" Array functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction array_concat array_length array_reverse array_to_string
syn keyword gsqlFunction array_filter array_includes array_includes_any array_includes_all
syn keyword gsqlFunction array_str_include array_transform array_zip array_slice
syn keyword gsqlFunction generate_array generate_date_array generate_timestamp_array offset ordinal

" ---------------------------------------------------------------------------
" Conversion functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction cast parse_bignumeric parse_numeric safe_cast

" ---------------------------------------------------------------------------
" Date functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction current_date date_add date_diff date_from_unix_date date_sub
syn keyword gsqlFunction date_trunc extract format_date last_day parse_date unix_date

" ---------------------------------------------------------------------------
" Datetime functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction current_datetime datetime_add datetime_diff
syn keyword gsqlFunction datetime_sub datetime_trunc format_datetime parse_datetime

" ---------------------------------------------------------------------------
" Time functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction current_time format_time parse_time time_add time_diff time_sub time_trunc

" ---------------------------------------------------------------------------
" Timestamp functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction current_timestamp format_timestamp parse_timestamp timestamp_add
syn keyword gsqlFunction timestamp_diff timestamp_micros timestamp_millis timestamp_seconds
syn keyword gsqlFunction timestamp_sub timestamp_trunc unix_micros unix_millis unix_seconds

" ---------------------------------------------------------------------------
" Interval functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction justify_days justify_hours justify_interval make_interval

" ---------------------------------------------------------------------------
" String functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction ascii byte_length char_length character_length chr code_points_to_bytes
syn keyword gsqlFunction code_points_to_string collate concat contains_substr ends_with format
syn keyword gsqlFunction from_base32 from_base64 from_hex initcap instr length lower lpad
syn keyword gsqlFunction ltrim normalize_and_casefold normalize octet_length regexp_contains
syn keyword gsqlFunction regexp_extract regexp_extract_all regexp_instr regexp_replace regexp_substr
syn keyword gsqlFunction repeat reverse rpad rtrim safe_convert_bytes_to_string soundex split
syn keyword gsqlFunction starts_with strpos substr substring to_base32 to_base64 to_code_points
syn keyword gsqlFunction to_hex translate trim unicode upper
syn keyword gsqlFunction edit_distance

" ---------------------------------------------------------------------------
" Math functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction abs acos acosh asin asinh atan atan2 atanh cbrt ceil ceiling
syn keyword gsqlFunction cos cosh cot coth csc csch div exp floor greatest ieee_divide
syn keyword gsqlFunction is_inf is_nan least ln log log10 mod pow power rand range_bucket
syn keyword gsqlFunction round safe_add safe_divide safe_multiply safe_negate safe_subtract
syn keyword gsqlFunction sec sech sign sin sinh sqrt tan tanh trunc
syn keyword gsqlFunction pi

" ---------------------------------------------------------------------------
" Hash functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction farm_fingerprint md5 sha1 sha256 sha512

" ---------------------------------------------------------------------------
" JSON functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction json_extract json_extract_array json_extract_scalar
syn keyword gsqlFunction json_extract_string_array json_query json_query_array
syn keyword gsqlFunction json_type json_value json_value_array parse_json
syn keyword gsqlFunction to_json to_json_string
syn keyword gsqlFunction json_object json_array json_strip_nulls

" ---------------------------------------------------------------------------
" Navigation / Window functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction first_value lag last_value lead nth_value
syn keyword gsqlFunction percentile_cont percentile_disc
syn keyword gsqlFunction cume_dist dense_rank ntile percent_rank rank row_number

" ---------------------------------------------------------------------------
" Net functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction net host ip_from_string ip_net_mask ip_to_string ip_trunc
syn keyword gsqlFunction ipv4_from_int64 ipv4_to_int64 public_suffix reg_domain safe_ip_from_string

" ---------------------------------------------------------------------------
" Statistical functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction corr covar_pop covar_samp stddev_pop stddev_samp stddev var_pop var_samp variance

" ---------------------------------------------------------------------------
" Geography functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction st_area st_asbinary st_asgeojson st_astext st_boundary
syn keyword gsqlFunction st_buffer st_centroid st_contains st_convexhull st_coveredby st_covers
syn keyword gsqlFunction st_difference st_dimension st_disjoint st_distance st_dump
syn keyword gsqlFunction st_dwithin st_endpoint st_extent st_exteriorring st_geogfrom
syn keyword gsqlFunction st_geogfromgeojson st_geogfromtext st_geogfromwkb st_geogpoint
syn keyword gsqlFunction st_geohash st_geometrytype st_interiorrings
syn keyword gsqlFunction st_intersection st_intersects st_isclosed st_iscollection
syn keyword gsqlFunction st_isempty st_isring st_length st_makeline st_makepolygon
syn keyword gsqlFunction st_maxdistance st_npoints st_numgeometries st_numpoints
syn keyword gsqlFunction st_perimeter st_pointn st_snaptogrid st_startpoint
syn keyword gsqlFunction st_touches st_union st_union_agg st_within st_x st_y
syn keyword gsqlFunction st_equals st_crosses st_overlaps st_unaryunion st_snap
syn keyword gsqlFunction st_simplify st_closestpoint st_clusterdbscan
syn keyword gsqlFunction st_linesubstring st_lineinterpolatepoint

" ---------------------------------------------------------------------------
" Misc functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction bit_count error generate_uuid session_user search
syn keyword gsqlFunction if ifnull nullif coalesce struct table_suffix

" ---------------------------------------------------------------------------
" BigQuery ML functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction ml_predict ml_generate_text ml_generate_embedding
syn keyword gsqlFunction ml_understand_text ml_translate ml_process_document
" AI.* functions (dot notation requires syn match)
syn match gsqlFunction /\c\<AI\.\(GENERATE\|GENERATE_TABLE\)\>/ containedin=ALLBUT,gsqlComment,gsqlString,gsqlLiquidTag,gsqlLiquidOutput,gsqlLookmlRef

" ---------------------------------------------------------------------------
" Spanner-specific functions
" ---------------------------------------------------------------------------
syn keyword gsqlFunction pending_commit_timestamp commit_timestamp
syn keyword gsqlFunction sequence_state get_next_sequence_value get_internal_sequence_state
syn keyword gsqlFunction tokenize_fulltext tokenize_number tokenize_substring tokenize_ngrams
syn keyword gsqlFunction score score_ngrams snippet

" ---------------------------------------------------------------------------
" Todo
" ---------------------------------------------------------------------------
syn keyword gsqlTodo TODO FIXME XXX DEBUG NOTE contained

" ---------------------------------------------------------------------------
" Dataform (.sqlx) support
" ---------------------------------------------------------------------------
" config { ... } block -- highlighted as a distinct region
syn region gsqlDataformConfig matchgroup=gsqlDataformDelim start="\<config\s*{" end="}" keepend contains=gsqlDataformKey,gsqlDataformString,gsqlDataformBoolean,gsqlDataformNumber,gsqlDataformComment fold
syn keyword gsqlDataformKey type schema name description columns tags dependencies hermetic disabled assertions uniqueKey nonNull rowConditions contained
syn keyword gsqlDataformBoolean true false contained
syn match gsqlDataformNumber "\<\d\+\>" contained
syn region gsqlDataformString start=+"+ end=+"+ contained oneline
syn region gsqlDataformString start=+'+ end=+'+ contained oneline
syn match gsqlDataformComment "\/\/.*$" contained
syn region gsqlDataformComment start="/\*" end="\*/" contained

" ref() / resolve() / self() -- Dataform table references
" ${ref("...")} / ${resolve("...")} / ${self()} -- Dataform interpolation
syn match gsqlDataformRef "\${ref([^}]*)}" containedin=ALLBUT,gsqlComment,gsqlDataformConfig
syn match gsqlDataformRef "\${resolve([^}]*)}" containedin=ALLBUT,gsqlComment,gsqlDataformConfig
syn match gsqlDataformRef "\${self()}" containedin=ALLBUT,gsqlComment,gsqlDataformConfig
" Bare ref() / resolve() / self() (without ${} wrapper)
syn match gsqlDataformRef "\<ref\s*(" containedin=ALLBUT,gsqlComment,gsqlDataformConfig
syn match gsqlDataformRef "\<resolve\s*(" containedin=ALLBUT,gsqlComment,gsqlDataformConfig
syn match gsqlDataformRef "\<self\s*()" containedin=ALLBUT,gsqlComment,gsqlDataformConfig

" pre_operations / post_operations blocks
syn region gsqlDataformOps matchgroup=gsqlDataformDelim start="\<pre_operations\s*{" end="}" transparent contains=ALL fold
syn region gsqlDataformOps matchgroup=gsqlDataformDelim start="\<post_operations\s*{" end="}" transparent contains=ALL fold

" js { ... } block -- JavaScript inline block
syn region gsqlDataformJs matchgroup=gsqlDataformDelim start="\<js\s*{" end="}" contains=gsqlDataformString,gsqlDataformComment fold

" ---------------------------------------------------------------------------
" Looker: Liquid templates
" ---------------------------------------------------------------------------
" {{ variable }} -- output tags
syn region gsqlLiquidOutput matchgroup=gsqlLiquidDelim start="{{" end="}}" containedin=ALL contains=gsqlLiquidFilter,gsqlLiquidString
" {% tag %} -- logic tags
syn region gsqlLiquidTag matchgroup=gsqlLiquidDelim start="{%" end="%}" containedin=ALL contains=gsqlLiquidKeyword,gsqlLiquidString,gsqlLiquidFilter
" Liquid keywords inside {% %}
syn keyword gsqlLiquidKeyword if elsif else endif unless endunless for endfor assign capture endcapture case when endcase comment endcomment parameter condition contained
" Liquid filters (| append, | replace, etc.)
syn match gsqlLiquidFilter "|\s*\w\+" contained
" Liquid strings inside templates
syn region gsqlLiquidString start=+"+ end=+"+ contained
syn region gsqlLiquidString start=+'+ end=+'+ contained


" ---------------------------------------------------------------------------
" Looker: LookML field references  ${view_name.field_name}
" ---------------------------------------------------------------------------
syn match gsqlLookmlRef "\${[a-zA-Z_][a-zA-Z0-9_.]*}" containedin=ALL

" ---------------------------------------------------------------------------
" Table alias prefix (e.g. t1.column_name → t1. をグレーに)
" ---------------------------------------------------------------------------
syn match gsqlAliasPrefix /\(\s\|[,(]\)\zs\w\+\.\ze\w\+\(\.\)\@!/ containedin=ALLBUT,gsqlComment,gsqlString,gsqlLiquidTag,gsqlLiquidOutput,gsqlLookmlRef

" ---------------------------------------------------------------------------
" Comma
" ---------------------------------------------------------------------------
syn match gsqlComma /,/ containedin=ALLBUT,gsqlComment,gsqlString,gsqlDataformConfig,gsqlLiquidTag,gsqlLiquidOutput,gsqlLookmlRef

" ---------------------------------------------------------------------------
" Context-sensitive function matches (must be defined AFTER type/keyword
" definitions above so they win when followed by '(')
" date/datetime/time/timestamp は型/関数兼用、unnest は配列展開、left/right は文字列関数。
" left/right は JOIN 修飾子としても使うので、Statement のフォールバックを先に定義。
" ---------------------------------------------------------------------------
syn match gsqlStatement /\<\(left\|right\)\>/ containedin=ALLBUT,gsqlComment,gsqlString,gsqlQuotedId,gsqlLiquidTag,gsqlLiquidOutput,gsqlLookmlRef
syn match gsqlFunction /\<\(date\|datetime\|time\|timestamp\|unnest\|left\|right\)\>\ze\s*(/ containedin=ALLBUT,gsqlComment,gsqlString,gsqlQuotedId,gsqlLiquidTag,gsqlLiquidOutput,gsqlLookmlRef

" ---------------------------------------------------------------------------
" Comments (defined last to take priority over symbol operators)
" ---------------------------------------------------------------------------
syn region gsqlComment start="/\*" end="\*/" contains=gsqlTodo,@Spell fold
syn match gsqlComment "--.*$" contains=gsqlTodo,@Spell
syn match gsqlComment "#.*$" contains=gsqlTodo,@Spell

syn sync ccomment gsqlComment

" ---------------------------------------------------------------------------
" Highlight links (colorscheme-dependent defaults)
" Colorscheme-specific overrides are in autoload/gsql/colors.vim
" ---------------------------------------------------------------------------
hi def link Quote                 Special
hi def link gsqlComment           Comment
hi def link gsqlFunction          Function
hi def link gsqlKeyword           Keyword
hi def link gsqlStatement         Statement
hi def link gsqlNumber            Number
hi def link gsqlOperator          Statement
hi def link gsqlSpecial           Special
hi def link gsqlString            String
hi def link gsqlType              Type
hi def link gsqlTodo              Todo
hi def link gsqlSymbolOp          Operator
hi def link gsqlLiquidDelim       Delimiter
hi def link gsqlLiquidOutput      Special
hi def link gsqlLiquidTag         Special
hi def link gsqlLiquidKeyword     Keyword
hi def link gsqlLiquidFilter      Function
hi def link gsqlLiquidString      String
hi def link gsqlLookmlRef         Special
hi def link gsqlQuotedId          Identifier
hi def link gsqlQuotedIdDelim     Identifier
hi def link gsqlDataformDelim     PreProc
hi def link gsqlDataformConfig    PreProc
hi def link gsqlDataformKey       Keyword
hi def link gsqlDataformBoolean   Special
hi def link gsqlDataformNumber    Number
hi def link gsqlDataformString    String
hi def link gsqlDataformComment   Comment
hi def link gsqlDataformRef       PreProc
hi def link gsqlDataformJs        Normal
hi def link gsqlAliasPrefix       Comment
hi def link gsqlComma             Delimiter

" Keep region state across viewport scrolls when config block spans many lines.
syntax sync minlines=200 maxlines=500

let b:current_syntax = "gsql"

" vim: ts=8
