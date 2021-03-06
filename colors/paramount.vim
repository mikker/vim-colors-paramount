" Name:       paramount.vim
" Version:    0.1.0
" Maintainer: github.com/owickstrom
" License:    The MIT License (MIT)
"
" A minimal colorscheme for Vim that only puts emphasis on the paramount.
"
" Based on the pencil and off colorschemes:
"
" https://github.com/reedes/vim-colors-pencil
" https://github.com/reedes/vim-colors-off
"
"""
hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='paramount'

let s:black           = { "gui": "#000000", "cterm": "235" }
let s:darkest_gray    = { "gui": "#26282d", "cterm": "235" }
let s:subtle_black    = { "gui": "#1d2732", "cterm": "236" }
let s:dark_gray       = { "gui": "#3E3E3E", "cterm": "239" }
let s:lighter_black   = { "gui": "#606060", "cterm": "241" }
let s:medium_gray     = { "gui": "#888888", "cterm": "244" }
let s:light_gray      = { "gui": "#A8A8A8", "cterm": "248" }
let s:lighter_gray    = { "gui": "#cccccc", "cterm": "251" }
let s:lightest_gray   = { "gui": "#f8f1ea", "cterm": "255" }
let s:white           = { "gui": "#F1F1F1", "cterm": "15"  }
let s:actual_white    = { "gui": "#FFFFFF", "cterm": "231" }
let s:pink            = { "gui": "#fb007a", "cterm": "9"   }
let s:dark_red        = { "gui": "#C30771", "cterm": "1"   }
let s:light_red       = { "gui": "#FF5C82", "cterm": "1"   }
let s:blush           = { "gui": "#E26384", "cterm": "1"   }
let s:orange          = { "gui": "#D75F5F", "cterm": "167" }
let s:maroon          = { "gui": "#a34d4a", "cterm": "167" }
let s:darker_blue     = { "gui": "#005F87", "cterm": "18"  }
let s:dark_blue       = { "gui": "#008EC4", "cterm": "4"   }
let s:blue            = { "gui": "#20BBFC", "cterm": "12"  }
let s:light_blue      = { "gui": "#b6d6fd", "cterm": "153" }
let s:dark_cyan       = { "gui": "#20A5BA", "cterm": "6"   }
let s:light_cyan      = { "gui": "#4FB8CC", "cterm": "14"  }
let s:dark_green      = { "gui": "#10A778", "cterm": "29"   }
let s:light_green     = { "gui": "#5FD7A7", "cterm": "35"  }
let s:dark_purple     = { "gui": "#916ba7", "cterm": "134" }
let s:light_purple    = { "gui": "#a790d5", "cterm": "140" }
let s:yellow          = { "gui": "#f6dd37", "cterm": "11"  }
let s:dark_yellow     = { "gui": "#A89C14", "cterm": "3"   }
let s:gold            = { "gui": "#ffebb2", "cterm": "3"   }
let s:oil             = { "gui": "#30312e", "cterm": "3"   }
let s:soapstone       = { "gui": "#EDE4DA", "cterm": "241" }

let s:background = &background

if &background == "dark"
  let s:bg              = s:darkest_gray
  let s:bg_subtle       = s:lighter_black
  let s:bg_very_subtle  = s:oil
  let s:norm            = s:lighter_gray
  let s:norm_subtle     = s:medium_gray
  let s:purple          = s:light_purple
  let s:cyan            = s:light_cyan
  let s:green           = s:light_green
  let s:red             = s:light_red
  let s:visual          = s:light_purple

  let s:theme_color = s:light_purple
else
  let s:bg              = s:lightest_gray
  let s:bg_subtle       = s:light_gray
  let s:bg_very_subtle  = s:soapstone
  let s:norm            = s:dark_gray
  let s:norm_subtle     = s:medium_gray
  let s:purple          = s:dark_purple
  let s:cyan            = s:dark_cyan
  let s:green           = s:dark_green
  let s:red             = s:dark_red
  let s:visual          = s:light_blue

  let s:theme_color = s:blush
endif

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal",        {"bg": s:bg, "fg": s:norm})

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
   execute "set background=" . s:background
endif

call s:h("Cursor",        {"bg": s:theme_color, "fg": s:norm })
call s:h("Comment",       {"fg": s:bg_subtle, "gui": "italic"})

call s:h("Constant",      {"fg": s:theme_color})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant

"call s:h("Identifier",    {"fg": s:dark_blue})
hi! link Identifier       Normal
hi! link Function         Identifier

call s:h("Statement",     {"fg": s:norm_subtle})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:h("Operator",      {"fg": s:norm, "cterm": "bold", "gui": "bold"})

call s:h("PreProc",     {"fg": s:norm_subtle})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",          {"fg": s:norm})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:norm_subtle, "gui": "italic"})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm, "gui": "underline", "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:actual_white, "bg": s:red, "cterm": "bold"})
call s:h("Todo",          {"fg": s:theme_color, "gui": "underline", "cterm": "underline"})
call s:h("SpecialKey",    {"fg": s:light_green})
call s:h("NonText",       {"fg": s:medium_gray})
call s:h("Directory",     {"fg": s:dark_blue})
call s:h("ErrorMsg",      {"fg": s:pink})
call s:h("Search",        {"bg": s:yellow, "fg": s:dark_gray})
call s:h("IncSearch",     {"bg": s:yellow, "fg": s:dark_gray})
call s:h("MoreMsg",       {"fg": s:medium_gray, "cterm": "bold", "gui": "bold"})
hi! link ModeMsg MoreMsg
if &background == "dark"
  call s:h("LineNr",        {"fg": s:bg_subtle})
else
  call s:h("LineNr",        {"fg": s:light_gray})
end
call s:h("CursorLineNr",  {"fg": s:norm_subtle, "bg": s:bg_very_subtle})
call s:h("Question",      {"fg": s:red})
call s:h("StatusLine",    {"bg": s:bg_very_subtle})
call s:h("StatusLineNC",  {"bg": s:bg_very_subtle, "fg": s:medium_gray})
call s:h("VertSplit",     {"bg": s:bg_very_subtle, "fg": s:bg_very_subtle})
call s:h("Title",         {"fg": s:dark_blue})
call s:h("Visual",        {"fg": s:norm, "bg": s:visual})
call s:h("VisualNOS",     {"bg": s:bg_subtle})
call s:h("WarningMsg",    {"fg": s:red})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:medium_gray})
call s:h("FoldColumn",    {"fg": s:bg_subtle})
call s:h("DiffAdd",       {"fg": s:green})
call s:h("DiffDelete",    {"fg": s:red})
call s:h("DiffChange",    {"fg": s:dark_yellow})
call s:h("DiffText",      {"fg": s:dark_blue})
call s:h("SignColumn",    {"fg": s:light_green})

if has("gui_running")
  call s:h("SpellBad",    {"gui": "underline", "sp": s:red})
  call s:h("SpellCap",    {"gui": "underline", "sp": s:light_green})
  call s:h("SpellRare",   {"gui": "underline", "sp": s:pink})
  call s:h("SpellLocal",  {"gui": "underline", "sp": s:dark_green})
else
  call s:h("SpellBad",    {"cterm": "underline", "fg": s:red})
  call s:h("SpellCap",    {"cterm": "underline", "fg": s:light_green})
  call s:h("SpellRare",   {"cterm": "underline", "fg": s:pink})
  call s:h("SpellLocal",  {"cterm": "underline", "fg": s:dark_green})
endif

call s:h("Pmenu",         {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuSel",      {"fg": s:norm, "bg": s:theme_color})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("TabLineSel",    {"fg": s:theme_color, "bg": s:bg_subtle, "gui": "bold", "cterm": "bold"})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("CursorColumn",  {"bg": s:bg_very_subtle})
call s:h("CursorLine",    {"bg": s:bg_very_subtle})
call s:h("ColorColumn",   {"bg": s:bg_subtle})

call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:norm})
call s:h("qfLineNr",      {"fg": s:medium_gray})

call s:h("htmlH1",        {"fg": s:purple, "gui": "bold"})
call s:h("htmlH2",        {"fg": s:purple, "gui": "bold"})
call s:h("htmlH3",        {"fg": s:purple, "gui": "bold"})
call s:h("htmlH4",        {"fg": s:purple, "gui": "bold"})
call s:h("htmlH5",        {"fg": s:purple, "gui": "bold"})
call s:h("htmlH6",        {"fg": s:purple, "gui": "bold"})
call s:h("htmlLink",      {"bg": s:bg, "fg": s:theme_color})
call s:h("htmlItalic",    {"gui": "italic"})
call s:h("htmlBold",      {"gui": "bold"})

" Synatastic
call s:h("SyntasticWarningSign",    {"fg": s:yellow})
call s:h("SyntasticWarning",        {"bg": s:yellow, "fg": s:black, "gui": "bold", "cterm": "bold"})
call s:h("SyntasticErrorSign",      {"fg": s:red})
call s:h("SyntasticError",          {"bg": s:red, "fg": s:white, "gui": "bold", "cterm": "bold"})

" Neomake
hi link NeomakeWarningSign    SyntasticWarningSign
hi link NeomakeErrorSign    SyntasticErrorSign

" ALE
hi link ALEWarningSign    SyntasticWarningSign
hi link ALEErrorSign    SyntasticErrorSign

" LSP
hi link LspDiagnosticsError SyntasticError
hi link LspDiagnosticsErrorSign SyntasticErrorSign
" hi link LspDiagnosticsErrorFloating SyntasticErrorFloating
hi link LspDiagnosticsWarning SyntasticWarning
hi link LspDiagnosticsWarningSign SyntasticWarningSign
" hi link LspDiagnosticsWarningFloating SyntasticWarningFloating
hi link LspDiagnosticsInformation SyntasticWarning
hi link LspDiagnosticsInformationSign SyntasticWarningSign
" hi link LspDiagnosticsInformationFloating SyntasticWarningFloating
hi link LspDiagnosticsHelp SyntasticWarning
hi link LspDiagnosticsHelpSign SyntasticWarningSign
" hi link LspDiagnosticsHelpFloating SyntasticHelpFloating
" hi link LspReferenceText Normal
" hi link LspReferenceRead Normal
" hi link LspReferenceWrite Normal

" Signify, git-gutter
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
hi link GitGutterAdd                LineNr
hi link GitGutterDelete             LineNr
hi link GitGutterChange             LineNr
hi link GitGutterChangeDelete       LineNr

hi link diffAdded     DiffAdd
hi link diffRemoved   DiffDelete
hi link diffNewFile   Constant
hi link diffFile      Constant

" Sorbet types
hi Sig guifg=#f8c5a2 gui=italic cterm=italic
hi link SigBlock Sig
hi link SigBlockDelimiter Sig

hi link javaScriptLineComment Comment
