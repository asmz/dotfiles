" Unite
" --
NeoBundle 'Shougo/unite.vim'

" insert modeで開始
let g:unite_enable_start_insert = 1

" key bindings
nnoremap <silent> ,ug :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>Unite file<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,ur :<C-u>Unite file_rec/async:!<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
  " let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --ignore ".svn" --ignore ".git" --ignore ".png" --ignore ".jpg"  --ignore "logs" --ignore "cache" --hidden -g ""'
endif
