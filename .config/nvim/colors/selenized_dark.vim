highlight clear
let g:colors_name = "selenized_dark"

if exists("syntax_on")
    syntax reset
endif

hi normal               cterm=none  ctermfg=none            ctermbg=none

" interface
hi colorColumn                                              ctermbg=black
hi lineNr                           ctermfg=lightgrey       ctermbg=black
hi vertSplit                        ctermfg=white           ctermbg=white
hi visual                                                   ctermbg=white

" general
hi Comment                          ctermfg=lightgrey
hi Constant                         ctermfg=darkcyan
hi Error                cterm=bold  ctermfg=none            ctermbg=red
hi Identifier           cterm=none  ctermfg=darkblue
hi Ignore               cterm=bold  ctermfg=lightgrey
hi PreProc                          ctermfg=darkred
hi Special                          ctermfg=darkred
hi Statement                        ctermfg=darkgreen
hi Todo                 cterm=bold  ctermfg=darkmagenta     ctermbg=none
hi Type                             ctermfg=yellow

" NERDTree
hi NERDTreeCWD                      ctermfg=lightgrey
hi NERDTreeDir                      ctermfg=darkblue
hi NERDTreeOpenable                 ctermfg=darkgreen
hi NERDTreeClosable                 ctermfg=darkred

" diff
hi diffAdded                        ctermfg=darkgreen
hi diffFile                         ctermfg=darkblue
hi diffLine                         ctermfg=darkmagenta
hi diffSubname                      ctermfg=darkcyan

" rust
hi rustArrowCharacter               ctermfg=darkgreen
hi rustCommentLineDoc               ctermfg=darkyellow
hi rustLifetime                     ctermfg=magenta
hi rustModPath                      ctermfg=darkred
hi rustModPathSep                   ctermfg=darkred
hi rustPanic            cterm=bold  ctermfg=magenta
hi rustQuestionMark     cterm=bold  ctermfg=magenta

" coc
hi pmenu                            ctermfg=black           ctermbg=white
