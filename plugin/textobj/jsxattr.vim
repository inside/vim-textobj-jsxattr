if exists('g:loaded_textobj_jsxattr')
  finish
endif

" Regexes

" A word: `attr=value`, with no quotes.
let s:RE_WORD = '\w+'

" An attribute name: `src`, `data-attr`, `strange_attr`.
let s:RE_ATTR_NAME = '[a-zA-Z0-9\-_:@\.]+'

" A quoted string.
let s:RE_DOUBLE_QUOTED_STR = '"[^"]*"'
let s:RE_SINGLE_QUOTED_STR = "'[^']*'"

" Something surrounded by braces.
" This implementation is limited the one level of braces.
" For example, this will not be matched:
" attrName={{ foo: 42, bar: 43 }}
" Recursive regex are not supported in vim so you can't do something like:
" http://www.regular-expressions.info/recurse.html#balanced
" \((?>[^()]|(?R))*\)
let s:RE_BRACES = '\{[^{]*\}'

" The value of an attribute:
" a word with no quotes or a single/double quoted string or something
" surrounded by braces.
let s:RE_ATTR_VALUE = '('
      \. s:RE_SINGLE_QUOTED_STR . '|'
      \. s:RE_DOUBLE_QUOTED_STR . '|'
      \. s:RE_WORD . '|'
      \. s:RE_BRACES . ')'

" The right-hand side of an XML attr: an optional `=something` or `="str"`.
let s:RE_ATTR_RHS = '(\=' . s:RE_ATTR_VALUE . ')?'

" The final regex.
let s:RE_ATTR = s:RE_ATTR_NAME . s:RE_ATTR_RHS
let s:RE_ATTR_I = '\v' . s:RE_ATTR
let s:RE_ATTR_A = '\v\s+' . s:RE_ATTR

call textobj#user#plugin('jsxattr', {
\   'attr-i': {
\     'pattern': s:RE_ATTR_I,
\     'select': 'ix',
\   },
\   'attr-a': {
\     'pattern': s:RE_ATTR_A,
\     'select': 'ax',
\   },
\ })

let g:loaded_textobj_jsxattr = 1
