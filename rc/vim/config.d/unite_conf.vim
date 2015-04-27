" Unite ignore file_rec patterns
" --
let s:unite_ignore_file_rec_patterns=
      \ ''
      \ .'vendor/\|\.sass-cache/\|'
      \ .'node_modules/\|bower_components/\|'
      \ .'cache/\|log/\|logs\|tmp/deploy\|'
      \ .'\.\(bmp\|gif\|jpe\?g\|png\|webp\|ai\|psd\)"\?$'
call unite#custom#source('file_rec/async,file_rec/git', 'ignore_pattern', s:unite_ignore_file_rec_patterns)

" unite grep に ag(The Silver Searcher) を使う
" --
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column --ignore "tmp/deploy" --ignore ".svn" --ignore ".git" --ignore ".png" --ignore ".jpg" --ignore "log" --ignore "logs" --ignore "cache"'
  let g:unite_source_grep_recursive_opt = ''
"  let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --ignore "tmp/deploy" --ignore ".svn" --ignore ".git" --ignore ".png" --ignore ".jpg" --ignore "log" --ignore "logs" --ignore "cache" --hidden -g ""'
endif
