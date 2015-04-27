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
