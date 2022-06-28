
hi clear

let g:colors_name="macwal"

hi Boolean         guifg=#fc5479
hi Character       guifg=#ffcc66
hi link Number Boolean
hi link String Character
hi Conditional     guifg=#FC2050               gui=bold
hi Constant        guifg=#fc5479               gui=bold
hi Cursor          guifg=#112233 guibg=#e0e4fb
hi link iCursor Cursor
hi Debug           guifg=#a3b1c2               gui=bold
hi Define          guifg=#2aa7e9
hi link Delimiter Debug
hi DiffAdd         guifg=#2aa7e9                 
hi DiffChange      guifg=#a3b1c2              
hi DiffDelete      guifg=#F85F46              
hi DiffText                                    gui=italic,bold
hi Directory       guifg=#2aa7e9               gui=bold
hi Error           guifg=#ffcc66 guibg=#112233
hi ErrorMsg        guifg=#FC2050 guibg=#112233 gui=bold
hi Exception       guifg=#2aa7e9               gui=bold
hi Float           guifg=#2573c6
hi FoldColumn      guifg=#253647 guibg=#112233
hi link Folded FoldColumn
hi Function        guifg=#2aa7e9
hi Identifier      guifg=#ff9108
hi Ignore          guifg=#253647 guibg=bg
hi IncSearch       guifg=#ffcc66 guibg=#112233
hi Keyword         guifg=#fc5479               gui=bold
hi Label           guifg=#ffcc66               gui=none
hi Macro           guifg=#ffb11a               gui=italic
hi SpecialKey      guifg=#2aa7e9               gui=italic
hi MatchParen      guifg=#ffcc66 guibg=#112233 gui=bold
hi ModeMsg         guifg=#ffcc66
hi MoreMsg         guifg=#ffcc66
hi Operator        guifg=#fc5479
hi Pmenu           guifg=#59baee guibg=#112233
hi PmenuSel                      guibg=#253647
hi PmenuSbar                     guibg=#112233
hi PmenuThumb      guifg=#59baee
hi PreCondit       guifg=#2aa7e9               gui=bold
hi PreProc         guifg=#2aa7e9
hi Question        guifg=#2aa7e9
hi Repeat          guifg=#FC2050               gui=bold
hi Search          guifg=#112233 guibg=#ffcc66
hi SignColumn      guifg=#2aa7e9 guibg=#253647
hi SpecialChar     guifg=#FC2050               gui=bold
hi SpecialComment  guifg=#253647               gui=bold
hi Special         guifg=#59baee guibg=bg      gui=italic
if has("spell")
    hi SpellBad    guisp=#F85F46 gui=undercurl
    hi SpellCap    guisp=#2573c6 gui=undercurl
    hi SpellLocal  guisp=#59baee gui=undercurl
    hi SpellRare   guisp=#e0e4fb gui=undercurl
endif
hi Statement       guifg=#FC2050               gui=bold
hi StatusLine      guifg=#253647 guibg=fg
hi StatusLineNC    guifg=#253647 guibg=#112233
hi StorageClass    guifg=#ff9108               gui=italic
hi Structure       guifg=#59baee
hi Tag             guifg=#FC2050               gui=italic
hi Title           guifg=#ff9108
hi Todo            guifg=#e0e4fb guibg=#112233 gui=italic,bold
hi Typedef         guifg=#59baee
hi Type            guifg=#59baee               gui=none
hi Underlined      guifg=#253647               gui=underline
hi VertSplit       guifg=#253647 guibg=#112233 gui=bold
hi Visual                        guibg=#112233
hi link VisualNOS Visual
hi WarningMsg      guifg=#e0e4fb guibg=#112233 gui=bold
hi WildMenu        guifg=#59baee guibg=#112233
hi TabLineFill     guifg=#112233 guibg=#112233
hi TabLine         guibg=#112233 guifg=#253647 gui=none
hi Normal          guifg=#e0e4fb guibg=NONE
hi Comment         guifg=#a3b1c2               gui=italic
hi CursorLine                    guibg=#253647
hi CursorLineNr    guifg=#ffcc66               gui=none
hi CursorColumn                  guibg=#253647
hi ColorColumn                   guibg=#253647
hi LineNr          guifg=#a3b1c2
hi NonText         guifg=#a3b1c2 guibg=NONE
hi SpecialKey      guifg=#a3b1c2

" LANGUAGES
" Go
hi goDecimalInt    guifg=#b748bc
hi goFunction      guifg=#59baee               gui=bold
hi goFunctionCall  guifg=#3d8adb               gui=bold
hi goHexadecimalInt guifg=#c672cb
hi goOperator      guifg=#ffffff
hi goPredefinedIdentifiers guifg=#fc5479       gui=italic
hi goStatement     guifg=#FC2050               gui=italic,bold
hi goType          guifg=#3d8adb               gui=italic
hi link goConditional goStatement
hi link goDeclaration goStatement
hi link goFloat goDecimalInt
hi link goFloats goType
hi link goRepeat goStatement
hi link goSignedInts goType
hi link goUnsignedInts goType

" Vim
hi vimGroup        guifg=#3d8adb               gui=italic
hi link vimAutoEvent vimGroup
hi vimAutoCmdSfxList guifg=#2573c6             gui=italic
hi vimEnvvar       guifg=#b748bc
hi vimMapLhs       guifg=#ffb11a

" Python -> Go
hi link pythonBuiltin goFunctionCall
hi link pythonConditional goStatement
hi link pythonFunction goFunctionCall
hi link pythonNumber goDecimalInt
hi link pythonRepeat goStatement
hi link pythonStatement goStatement

" SH -> Go
hi link shConditional shLoop
hi link shFunction goFunctionCall
hi link shLoop goStatement
hi link shRange shLoop
hi link shSet goStatement
hi link shStatement goStatement

" TeX
hi texTypeSize     guifg=#3d8adb               gui=italic
hi texStatement    guifg=#ffb11a               gui=bold

" Markdown
hi markdownBold    guifg=#ffcc66               gui=bold
hi markdownCode    guifg=#ffffff guibg=#112233
hi link markdownCodeBlock markdownCode
hi markdownCodeDelimiter guifg=#2573c6         gui=bold
hi markdownError   guifg=#ffcc66
hi markdownH1      guifg=#FC2050               gui=bold
hi markdownH2      guifg=#fc5479               gui=bold
hi markdownH3      guifg=#fa7e6b               gui=bold
hi markdownItalic  guifg=#ffcc66               gui=italic
hi markdownLinkDelimiter guifg=#ffb11a
hi link markdownLinkTextDelimiter markdownLinkDelimiter
hi markdownLinkText guifg=#59baee              gui=underline
hi markdownListMarker guifg=#59baee            gui=bold
hi markdownRule    guifg=#2573c6               gui=bold

" Cron
hi crontabCmd      guifg=#e0e4fb

" dosini
hi dosiniLabel     guifg=#3d8adb                gui=italic

" I3
hi i3ConfigVariable guifg=#2573c6              gui=italic
hi i3ConfigWindowCommandSpecial guifg=#2aa7e9  gui=italic

" Yaml
hi yamlBlockCollectionItemStart guifg=#ffcc66  gui=bold
hi yamlBlockMappingKey guifg=#2aa7e9

" Muttrc
hi muttrcColor   guifg=#3d8adb                 gui=italic

" Toml
hi tomlTable     guifg=#59baee                 gui=bold

" Roff
hi link nroffReqName nroffReqLeader

" HTML -> Markdown
hi link htmlLink markdownLinkText
hi link htmlEndTag htmlTag

" Lua -> Go
hi link luaCond luaStatement
hi link luaFunction goFunctionCall
hi link luaNumber goDecimalInt
hi link luaRepeat luaStatement
hi link luaStatement goStatement

hi luaNspireGc   guifg=#ffb11a
hi link luaNspireEvent luaNspireGc
hi link luaNspirePlatform luaNspireGc

" Make -> Go
hi link makeTarget goFunctionCall

