" Markdown関連
" --
" Preview
NeoBundle 'kannokanno/previm'
" Open browser
NeoBundle 'tyru/open-browser.vim'

au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = ''
nnoremap <silent> ,po :<C-u>PrevimOpen<CR>
nnoremap <silent> ,pr :call previm#refresh()<CR>
