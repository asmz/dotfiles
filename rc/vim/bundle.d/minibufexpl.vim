" minibufexpl : バッファをタブ表示
" --
NeoBundle 'fholgado/minibufexpl.vim'

" 表示をトグル
nnoremap gbb :TMiniBufExplorer<CR>
" 表示してフォーカスを一覧にもってくる
nnoremap gbg :MiniBufExplorer<CR>
" 勝手に開くバッファ数
let g:miniBufExplorerMoreThanOne = 0

nnoremap tp : bp<CR>
nnoremap tn : bn<CR>
