" Vim syntax file
" Language:	Kal
" Maintainer:	hbc <bcxxxxxx@gmail.com>
" Last Change:	2013 Aug 27

if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "kal"

" Operators
syn keyword kalOperator and but
syn keyword kalOperator or
syn keyword kalOperator nor
syn keyword kalOperator not
syn match kalOperator "\(bitwise\s\)\=\(xor\|and\|or\|not\)"
syn match kalOperator "\v\*"
syn match kalOperator "\v/"
syn match kalOperator "\v\+"
syn match kalOperator "\v-"
syn keyword kalOperator mod
syn match kalOperator "\v^"
syn match kalOperator "\v\?"
syn match kalOperator "\(doesnt \)\=exists"
syn keyword kalOperator is isnt
syn match kalOperator "\(=\|\!\)\=="
syn match kalOperator ">=\="
syn match kalOperator "<=\="
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
syn keyword kalStatement class
syn keyword kalStatement method
syn keyword kalStatement new
syn match kalStatement "inherits from"

" Functions & Tasks
syn keyword kalStatement function method task
syn keyword kalStatement return
syn match kalFunction
    \ "\%(\%(function\s\|task\s\|class\s\|method\s\)\s*\)\@<=\h\%(\w\)*/" contained

" Other Statements
syn match kalStatement "\(wait\|pause\)\s\{1}for"
syn keyword kalStatement from
syn keyword kalStatement try catch

hi link kalString String
hi link kalConstant Identifier
hi link kalNumber Number
hi link kalOperator Operator
hi link kalComment Comment
hi link kalKeyword Keyword
hi link kalRepeat Repeat
hi link kalConditional Conditional
hi link kalStatement Statement
" FIXME no highlighting?
hi link kalFunction Function
