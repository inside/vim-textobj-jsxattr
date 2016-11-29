# vim-textobj-jsxattr

A vim text object for JSX attributes. Forked from
[whatyouhide/vim-textobj-xmlattr](https://github.com/whatyouhide/vim-textobj-xmlattr)

## Usage

Use the text-objects `ix` and `ax` to operate on JSX attributes.

## Examples

This is a JSX component, the pipe represents the cursor:
```
<TextField name='name' floatingLabelText='Nom' required fullWidth autoFocus
  value={this.state.name} onChange={this.han|dleChange.bind(this, 'name')}
/>

```

Hitting `vax` will visually select ` onChange={this.han|dleChange.bind(this, 'name')}`.
Notice the space before. This is because you selected `a` attribute. Hitting
`vix` will visually select `onChange={this.han|dleChange.bind(this, 'name')}`
without the space.

## Installation

``` viml
" vim-plug
Plug 'kana/vim-textobj-user' | Plug 'whatyouhide/vim-textobj-jsxattr'

" NeoBundle
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'whatyouhide/vim-textobj-jsxattr'

" Vundle
Plugin 'kana/vim-textobj-user'
Plugin 'whatyouhide/vim-textobj-jsxattr'
```
