runtime! plugin/textobj/jsxattr.vim

" Helper functions.
function! Yank(inside_or_around, after_movement)
  execute 'normal! ^' . a:after_movement
  execute 'normal "ay' . a:inside_or_around . 'x'
  let l:yanked = @a
  let @a = ""
  return l:yanked
endfunction

function! YankInside(after_movement)
  return Yank('i', a:after_movement)
endfunction

function! YankAround(after_movement)
  return Yank('a', a:after_movement)
endfunction


describe 'miscellaneous'
  it 'sets a global variable'
    Expect exists('g:loaded_textobj_jsxattr') == 1
  end
end

describe 'jsxattr'
  before
    new
  end

  after
    close!
  end

  it 'works with non-value attributes'
    put = '<xml-attr non-value-attr other-stuff>'
    Expect YankInside('f w') == 'non-value-attr'
    Expect YankAround('f w') == ' non-value-attr'
  end

  it 'works with value attributes (without quotes)'
    put = '<xml-attr value=attr>'
    Expect YankInside('fv') == 'value=attr'
    Expect YankAround('fv') == ' value=attr'
  end

  it 'works with trailing attributes'
    put = '<xml-tag trailing>'
    Expect YankInside('f 2l') == 'trailing'
    Expect YankAround('f 2l') == ' trailing'
  end

  it 'works with quoted attributes'
    put = '<tag val=\"attr\">'
    Expect YankInside('fv') == 'val="attr"'
    Expect YankAround('fv') == ' val="attr"'
  end

  it 'works with strange attributes'
    put = '<tag with_strange_AttRIbu-TES=\"hello\">'
    Expect YankInside('fw') == 'with_strange_AttRIbu-TES="hello"'
    Expect YankAround('fw') == ' with_strange_AttRIbu-TES="hello"'
  end

  it 'works with colons in the attribute name'
    put = '<uses-permission android:name=\"android.INTERNET\" />'
    Expect YankInside('fa') == 'android:name="android.INTERNET"'
    Expect YankAround('fa') == ' android:name="android.INTERNET"'
  end

  it 'works with simple javascript expressions'
    put = '<MyComponent foo={1 + 2 + 3 + 4} />'
    Expect YankInside('ff') == 'foo={1 + 2 + 3 + 4}'
    Expect YankAround('ff') == ' foo={1 + 2 + 3 + 4}'
  end

  " This test is commented on purpose.
  " Uncomment once nested braces are supported.
  "it 'works with complex javascript expressions'
    "put = '<MyComponent foo={{ foo: 42, bar: 43}} />'
    "Expect YankInside('ff') == 'foo={{ foo: 42, bar: 43}}'
    "Expect YankAround('ff') == ' foo={{ foo: 42, bar: 43}}'
  "end
end
