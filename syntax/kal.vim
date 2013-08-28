" Vim syntax file
" Language:	Kal
" Maintainer:	hbc <bcxxxxxx@gmail.com>
" Last Change:	2013 Aug 28

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" Operators
syn keyword kalOperator and but
syn keyword kalOperator or
syn keyword kalOperator nor
syn keyword kalOperator not
syn match kalOperator "\(bitwise\s\)\=\(xor\|and\|or\|not\)"
syn keyword kalOperator mod
syn match kalOperator "\(doesnt \)\=exists"
syn keyword kalOperator is isnt
syn keyword kalOperator in
syn keyword kalOperator of
syn keyword kalOperator instanceof
syn keyword kalOperator print

" Constants
syn match kalNumber "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn keyword kalNumber seconds
syn region kalString
    \ start=+\z(['"]\)+
    \ skip="\\\\\|\\\z1"
    \ end="\z1"
syn keyword kalConstant true yes on
syn keyword kalConstant false no off
" FIXME should they be placed under constants?
syn keyword kalConstant me this
syn keyword kalConstant nothing empty null
syn keyword kalConstant undefined

" Comments
syn match kalComment "\v#.*$"
syn region kalComment
    \ start="###"
    \ end="###"

" Conditionals
syn keyword kalConditional if else is when unless except otherwise

" Loops 
syn match kalRepeat "for\s*\(parallel\|series\)\="
syn keyword kalRepeat while

" Class
syn keyword kalStatement class method nextgroup=kalFunction skipwhite
syn keyword kalStatement new
syn match kalStatement "inherits from"

" Functions & Tasks
syn keyword kalStatement function task nextgroup=kalFunction skipwhite
syn keyword kalStatement return
syn match kalFunction
    \ "\%(\%(method\s\|class\s\|function\s\|task\s\)\s*\)\@<=\h\%(\w\)*" contained

" Other Statements
syn match kalStatement "\v(wait|pause)\s{1}for"
syn keyword kalStatement from
syn keyword kalStatement try catch

if version >= 508
    command -nargs=+ HiLink hi link <args>
else
    command -nargs=+ HiLink hi def link <args>
endif

HiLink kalString String
HiLink kalConstant Identifier
HiLink kalNumber Number
HiLink kalOperator Operator
HiLink kalComment Comment
HiLink kalKeyword Keyword
HiLink kalRepeat Repeat
HiLink kalConditional Conditional
HiLink kalStatement Statement
HiLink kalFunction Function

delcommand HiLink

let b:current_syntax = "kal"
