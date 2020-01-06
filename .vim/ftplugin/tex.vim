
"Spelling language
setlocal spell spelllang=en

"Dont transform formatting to unicode characters
setlocal conceallevel=0
"Disable IndentLine plugin as it overrides conceallevel
let indentLine_conceallevel=0


"Show spelling errors with underline
hi clear SpellBad       "word not recognized
hi clear SpellCap       "word not capitalized
hi clear SpellRare      "rare word
hi clear SpellLocal     "wrong spelling for selected region

"Colors of highlighted text
hi SpellBad cterm=underline ctermfg=124
hi SpellCap cterm=underline ctermfg=124

"Do the same for languagetool plugin
hi clear LanguageToolGrammarError
hi clear LanguageToolSpellingError
hi LanguageToolGrammarError ctermfg=124 cterm=underline
hi LanguageToolSpellingError ctermfg=124 cterm=underline

"Word wrap with line breaks
setlocal wrap
setlocal linebreak
setlocal tw=100



