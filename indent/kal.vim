" Vim indent file
" Language:	Kal
" Maintainer:	hbc <bcxxxxxx@gmail.com>
" Last Change:	2013 Aug 28

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal autoindent
setlocal indentexpr=GetKalIndent(v:lnum)

" Only define the function once.
if exists("*GetKalIndent")
    finish
endif

let s:INDENT_AFTER_KEYWORD = '^\%(if\|else\|when\|unless\|'
            \ .              'for\|while\|try\|catch\|'
            \ .              'class\|method\|function\|task'
            \ .              '\)\>'

function! s:GetTrimmedLine(linenum)
    let line = getline(a:linenum)

    return substitute(substitute(line, '^\s\+', '', ''), '\s\+$', '', '')
endfunction

function GetKalIndent(linenum)
    if a:linenum == 1
        return -1
    endif

    let prevlinenum = a:linenum - 1
    let prevline = s:GetTrimmedLine(prevlinenum)
    let previndent = indent(prevlinenum)

    if prevline =~ s:INDENT_AFTER_KEYWORD
        return previndent + &shiftwidth
    endif

    return -1
endfunction
