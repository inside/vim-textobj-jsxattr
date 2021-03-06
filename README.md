# vim-textobj-jsxattr

[![Build Status](https://travis-ci.org/inside/vim-textobj-jsxattr.svg?branch=master)](https://travis-ci.org/inside/vim-textobj-jsxattr)

A vim text object for JSX attributes. Forked from
[whatyouhide/vim-textobj-xmlattr](https://github.com/whatyouhide/vim-textobj-xmlattr)

## Usage

Use the text-objects `ix` and `ax` to operate on JSX attributes.

## Examples

This is a JSX component, the pipe represents the cursor:
``` jsx
<TextField name='name' floatingLabelText='Nom' required fullWidth autoFocus
  value={this.state.name} onChange={this.han|dleChange.bind(this, 'name')}
/>
```

Hitting `vax` will visually select ` onChange={this.handleChange.bind(this, 'name')}`.
Notice the space before. This is because you selected `a` attribute. Hitting
`vix` will visually select the inner attribute
`onChange={this.handleChange.bind(this, 'name')}` without the space.

## Installation

``` viml
" vim-plug
Plug 'kana/vim-textobj-user' | Plug 'inside/vim-textobj-jsxattr'

" NeoBundle
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'inside/vim-textobj-jsxattr'

" Vundle
Plugin 'kana/vim-textobj-user'
Plugin 'inside/vim-textobj-jsxattr'
```

## License

[![][wtfpl-logo]][wtfpl]


[wtfpl]: http://www.wtfpl.net/
[wtfpl-logo]: http://www.wtfpl.net/wp-content/uploads/2012/12/logo-220x1601.png
