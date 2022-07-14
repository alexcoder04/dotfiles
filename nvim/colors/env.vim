"        _                        _            ___  _  _   
"   __ _| | _____  _____ ___   __| | ___ _ __ / _ \| || |  
"  / _` | |/ _ \ \/ / __/ _ \ / _` |/ _ \ '__| | | | || |_ 
" | (_| | |  __/>  < (_| (_) | (_| |  __/ |  | |_| |__   _|
"  \__,_|_|\___/_/\_\___\___/ \__,_|\___|_|   \___/   |_|  
" 
" Copyright (c) 2022 alexcoder04 <alexcoder04@protonmail.com>
" 
" Neovim colorscheme loaded from environment

hi clear

" Helper function {{{
function! MyHL(key, fg, bg, gui)
    let execStr = 'hi ' . a:key
    if a:fg != ''
        let execStr = execStr . ' guifg=' . a:fg
    endif
    if a:bg != ''
        let execStr = execStr . ' guibg=' . a:bg
    endif
    if a:gui != ''
        let execStr = execStr . ' gui=' . a:gui
    endif
    execute execStr
endfunction
" }}}

" -----------------------------------------------------------------------------
" GENERAL
" ------------------------------------------------------------------------- {{{
call MyHL('Boolean', $COLOR_BRIGHT_MAGENTA, '', '')
call MyHL('Character', $COLOR_BRIGHT_YELLOW, '', '')
hi link Number Boolean
hi link String Character
call MyHL('Conditional', $COLOR_MAGENTA, '', 'bold')
call MyHL('Constant', $COLOR_BRIGHT_MAGENTA, '', 'bold')
call MyHL('Cursor', $COLOR_BLACK, $COLOR_WHITE, '')
hi link iCursor Cursor
call MyHL('Debug', $COLOR_LIGHT_GREY, '', 'bold')
call MyHL('Define', $COLOR_GREEN, '', '')
hi link Delimiter Debug
call MyHL('Directory', $COLOR_GREEN, '', 'bold')
call MyHL('Error', $COLOR_BRIGHT_YELLOW, $COLOR_BLACK, '')
call MyHL('ErrorMsg', $COLOR_MAGENTA, $COLOR_BLACK, 'bold')
call MyHL('Exception', $COLOR_GREEN, '', 'bold')
call MyHL('Float', $COLOR_CYAN, '', '')
call MyHL('Folded', $COLOR_BRIGHT_YELLOW, $COLOR_BLACK, '')
hi link FoldColumn Folded
call MyHL('Function', $COLOR_GREEN, '', '')
call MyHL('Identifier', $COLOR_YELLOW, '', '')
call MyHL('Ignore', $COLOR_DARK_GREY, '', '')
call MyHL('IncSearch', $COLOR_BRIGHT_YELLOW, $COLOR_BLACK, '')
call MyHL('Keyword', $COLOR_BRIGHT_MAGENTA, '', 'bold')
call MyHL('Label', $COLOR_BRIGHT_YELLOW, '', '')
call MyHL('Macro', $COLOR_YELLOW, '', 'italic')
call MyHL('SpecialKey', $COLOR_GREEN, '', 'italic')
call MyHL('MatchParen', $COLOR_BRIGHT_YELLOW, $COLOR_BLACK, 'bold')
call MyHL('ModeMsg', $COLOR_BRIGHT_YELLOW, '', '')
call MyHL('MoreMsg', $COLOR_BRIGHT_YELLOW, '', '')
call MyHL('Operator', $COLOR_BRIGHT_MAGENTA, '', '')
call MyHL('Pmenu', $COLOR_BRIGHT_GREEN, $COLOR_BLACK, '')
call MyHL('PmenuSel', '', $COLOR_DARK_GREY, '')
call MyHL('PmenuSbar', '', $COLOR_BLACK, '')
call MyHL('PmenuThumb', $COLOR_BRIGHT_GREEN, '', '')
call MyHL('PreCondit', $COLOR_GREEN, '', 'bold')
call MyHL('PreProc', $COLOR_GREEN, '', '')
call MyHL('Question', $COLOR_GREEN, '', '')
call MyHL('Repeat', $COLOR_MAGENTA, '', 'bold')
call MyHL('Search', $COLOR_BLACK, $COLOR_BRIGHT_YELLOW, '')
call MyHL('SignColumn', $COLOR_GREEN, $COLOR_DARK_GREY, '')
call MyHL('SpecialChar', $COLOR_MAGENTA, '', 'bold')
call MyHL('SpecialComment', $COLOR_DARK_GREY, '', 'bold')
call MyHL('Special', $COLOR_BRIGHT_GREEN, '', 'italic')
if has("spell")
 call MyHL('SpellBad', $COLOR_RED, '', 'undercurl,bold')
 call MyHL('SpellCap', $COLOR_CYAN, '', 'undercurl,bold')
 call MyHL('SpellLocal', $COLOR_BRIGHT_GREEN, '', 'undercurl,bold')
 call MyHL('SpellRare', $COLOR_RED, '', 'undercurl,bold')
endif
call MyHL('Statement', $COLOR_MAGENTA, '', 'bold')
call MyHL('StorageClass', $COLOR_ORANGE, '', 'italic')
call MyHL('Structure', $COLOR_BRIGHT_GREEN, '', '')
call MyHL('Tag', $COLOR_MAGENTA, '', 'italic')
call MyHL('Title', $COLOR_YELLOW, '', '')
call MyHL('Todo', $COLOR_WHITE, $COLOR_BLACK, 'italic,bold')
call MyHL('Typedef', $COLOR_BRIGHT_GREEN, '', '')
hi link Type Typedef
call MyHL('Underlined', $COLOR_DARK_GREY, '', 'underline')
call MyHL('VertSplit', $COLOR_DARK_GREY, $COLOR_BLACK, 'bold')
call MyHL('Visual', '', $COLOR_BLACK, '')
hi link VisualNOS Visual
call MyHL('WarningMsg', $COLOR_WHITE, $COLOR_BLACK, 'bold')
call MyHL('WildMenu', $COLOR_BRIGHT_GREEN, $COLOR_BLACK, '')
call MyHL('TabLineFill', $COLOR_BLACK, $COLOR_BLACK, '')
call MyHL('TabLine', $COLOR_DARK_GREY, $COLOR_BLACK, '')
call MyHL('Normal', $COLOR_WHITE, 'NONE', '')
call MyHL('Comment', $COLOR_LIGHT_GREY, '', 'italic')
call MyHL('CursorLine', '', $COLOR_DARK_GREY, '')
call MyHL('CursorLineNr', $COLOR_BRIGHT_YELLOW, '', '')
call MyHL('CursorColumn', '', $COLOR_DARK_GREY, '')
call MyHL('ColorColumn', '', $COLOR_DARK_GREY, '')
call MyHL('LineNr', $COLOR_LIGHT_GREY, '', '')
call MyHL('NonText', $COLOR_LIGHT_GREY, 'NONE', '')
call MyHL('SpecialKey', $COLOR_LIGHT_GREY, '', '')

" }}}

" -----------------------------------------------------------------------------
" LANGUAGES
" ------------------------------------------------------------------------- {{{
" Go
call MyHL('goDecimalInt', $COLOR_BLUE, '', '')
call MyHL('goFunction', $COLOR_BRIGHT_GREEN, '', 'bold')
call MyHL('goFunctionCall', $COLOR_BRIGHT_CYAN, '', 'bold')
call MyHL('goHexadecimalInt', $COLOR_BRIGHT_BLUE, '', '')
call MyHL('goOperator', '#ffffff', '', '')
call MyHL('goPredefinedIdentifiers', $COLOR_BRIGHT_MAGENTA, '', 'italic')
call MyHL('goStatement', $COLOR_MAGENTA, '', 'italic,bold')
call MyHL('goType', $COLOR_BRIGHT_CYAN, '', 'italic')
hi link goConditional goStatement
hi link goDeclaration goStatement
hi link goFloat goDecimalInt
hi link goFloats goType
hi link goRepeat goStatement
hi link goSignedInts goType
hi link goUnsignedInts goType

" Vim
call MyHL('vimGroup', $COLOR_BRIGHT_CYAN, '', 'italic')
call MyHL('vimAutoCmdSfxList', $COLOR_CYAN, '', 'italic')
call MyHL('vimEnvvar', $COLOR_BLUE, '', '')
call MyHL('vimMapLhs', $COLOR_YELLOW, '', '')
call MyHL('vimFileType', $COLOR_GREEN, '', 'bold')
hi link vimAutoEvent vimGroup
hi link vimSynType vimFileType

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
hi link shCaseBar Statement

" TeX
call MyHL('texTypeSize', $COLOR_BRIGHT_CYAN, '', 'italic')
call MyHL('texTypeStyle', $COLOR_CYAN, '', 'bold')
call MyHL('texStatement', $COLOR_YELLOW, '', 'bold')

" Markdown
call MyHL('markdownBold', $COLOR_BRIGHT_YELLOW, '', 'bold')
call MyHL('markdownCode', $COLOR_BRIGHT_WHITE, $COLOR_BLACK, '')
call MyHL('markdownCodeDelimiter', $COLOR_CYAN, '', 'bold')
call MyHL('markdownError', $COLOR_BRIGHT_YELLOW, '', '')
call MyHL('markdownH1', $COLOR_MAGENTA, '', 'bold')
call MyHL('markdownH2', $COLOR_BRIGHT_MAGENTA, '', 'bold')
call MyHL('markdownH3', $COLOR_BRIGHT_RED, '', 'bold')
call MyHL('markdownItalic', $COLOR_BRIGHT_YELLOW, '', 'italic')
call MyHL('markdownLinkDelimiter', $COLOR_YELLOW, '', '')
call MyHL('markdownLinkText', $COLOR_BRIGHT_GREEN, '', 'underline')
call MyHL('markdownListMarker', $COLOR_BRIGHT_GREEN, '', 'bold')
call MyHL('markdownRule', $COLOR_CYAN, '', 'bold')
hi link markdownCodeBlock markdownCode
hi link markdownLinkTextDelimiter markdownLinkDelimiter

" Cron
call MyHL('crontabCmd', $COLOR_WHITE, '', '')

" dosini
call MyHL('dosiniLabel', $COLOR_BRIGHT_CYAN, '', 'italic')

" I3
call MyHL('i3ConfigVariable', $COLOR_CYAN, '', 'italic')
call MyHL('i3ConfigWindowCommandSpecial', $COLOR_GREEN, '', 'italic')

" Yaml
call MyHL('yamlBlockCollectionItemStart', $COLOR_BRIGHT_YELLOW, '', 'bold')
call MyHL('yamlBlockMappingKey', $COLOR_GREEN, '', '')

" Muttrc
call MyHL('muttrcColor', $COLOR_BRIGHT_CYAN, '', 'italic')

" Toml
call MyHL('tomlTable', $COLOR_BRIGHT_GREEN, '', 'bold')

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

call MyHL('luaNspireGc', $COLOR_YELLOW, '', '')
hi link luaNspireEvent luaNspireGc
hi link luaNspirePlatform luaNspireGc

" Make -> Go
hi link makeTarget goFunctionCall

" Diff
call MyHL('DiffFile', $COLOR_BLUE, '', 'bold')
call MyHL('DiffRemoved', $COLOR_RED, '', 'italic')
call MyHL('DiffAdded', $COLOR_GREEN, '', '')

" }}}

" -----------------------------------------------------------------------------
" STATUSLINE
" ------------------------------------------------------------------------- {{{
call MyHL('ULNormalMode', $COLOR_WHITE, $COLOR_BLUE, 'bold')
call MyHL('ULInsertMode', $COLOR_BLACK, $COLOR_GREEN, 'bold')
call MyHL('ULVisualMode', $COLOR_BLACK, $COLOR_YELLOW, 'bold')
call MyHL('ULCommandMode', $COLOR_WHITE, $COLOR_CYAN, 'bold')
call MyHL('ULReadonly', $COLOR_RED, $COLOR_BLACK, 'bold')
call MyHL('ULDefault', $COLOR_WHITE, $COLOR_BLACK, '')
call MyHL('ULModified', $COLOR_YELLOW, $COLOR_BLACK, '')
call MyHL('ULLanguage', $COLOR_WHITE, $COLOR_CYAN, '')
call MyHL('ULPosition', $COLOR_WHITE, $COLOR_DARK_GREY, '')
call MyHL('UlLine', $COLOR_BRIGHT_YELLOW, $COLOR_DARK_GREY, '')
call MyHL('UlLines', $COLOR_BRIGHT_CYAN, $COLOR_DARK_GREY, '')
" }}}

