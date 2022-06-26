
let s:black = [ $COLOR_BLACK, 0 ]
let s:maroon = [ $COLOR_PURPLE, 1 ]
let s:green = [ $COLOR_GREEN, 2 ]
let s:olive = [ $COLOR_GREEN, 3 ]
let s:navy = [ $COLOR_BLUE, 4 ]
let s:purple = [ $COLOR_PURPLE, 5 ]
let s:teal = [ $COLOR_GREEN, 6 ]
let s:silver = [ $COLOR_LIGHT_GREY, 7 ]
let s:gray = [ $COLOR_DARK_GREY, 8]
let s:red = [ $COLOR_RED, 9 ]
let s:lime = [ $COLOR_GREEN, 10 ]
let s:yellow = [ $COLOR_YELLOW, 11 ]
let s:blue = [ $COLOR_BLUE, 12 ]
let s:fuchsia = [ $COLOR_PURPLE, 13 ]
let s:aqua = [ $COLOR_CYAN, 14 ]
let s:white = [ $COLOR_WHITE, 15 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:white, s:blue ], [ s:white, s:gray ] ]
let s:p.normal.middle = [ [ s:silver, s:black ] ]
let s:p.normal.right = [ [ s:white, s:blue ], [ s:white, s:gray ] ]
let s:p.normal.error = [ [ s:black, s:red ] ]
let s:p.normal.warning = [ [ s:black, s:yellow ] ]
let s:p.inactive.left =  [ [ s:silver, s:gray ], [ s:gray, s:black ] ]
let s:p.inactive.middle = [ [ s:silver, s:black ] ]
let s:p.inactive.right = [ [ s:silver, s:gray ], [ s:gray, s:black ] ]
let s:p.insert.left = [ [ s:white, s:green ], [ s:white, s:gray ] ]
let s:p.insert.right = copy(s:p.insert.left)
let s:p.replace.left = [ [ s:white, s:red ], [ s:white, s:gray ] ]
let s:p.replace.right = copy(s:p.replace.left)
let s:p.visual.left = [ [ s:white, s:purple ], [ s:white, s:gray ] ]
let s:p.visual.right = copy(s:p.visual.left)
let s:p.tabline.left = [ [ s:silver, s:black ] ]
let s:p.tabline.tabsel = copy(s:p.normal.right)
let s:p.tabline.middle = [ [ s:silver, s:black ] ]
let s:p.tabline.right = copy(s:p.normal.right)

let g:lightline#colorscheme#env#palette = lightline#colorscheme#flatten(s:p)

