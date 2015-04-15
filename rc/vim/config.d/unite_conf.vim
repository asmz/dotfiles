" Unite ignore file_rec patterns
" --
let s:unite_ignore_file_rec_patterns=
      \ ''
      \ .'vendor/\|\.sass-cache/\|'
      \ .'node_modules/\|bower_components/\|'
      \ .'cache/\|log/\|logs\|'
      \ .'\.\(bmp\|gif\|jpe\?g\|png\|webp\|ai\|psd\)"\?$'
call unite#custom#source('file_rec/async,file_rec/git', 'ignore_pattern', s:unite_ignore_file_rec_patterns)
