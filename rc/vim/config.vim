" auto paste mode
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

" Unite ignore file_rec patterns
let s:unite_ignore_file_rec_patterns=
      \ ''
      \ .'vendor/\|\.sass-cache/\|'
      \ .'node_modules/\|bower_components/\|'
      \ .'cache/\|log/\|logs\|'
      \ .'\.\(bmp\|gif\|jpe\?g\|png\|webp\|ai\|psd\)"\?$'
call unite#custom#source('file_rec/async,file_rec/git', 'ignore_pattern', s:unite_ignore_file_rec_patterns)
