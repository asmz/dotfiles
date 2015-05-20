" color
" --
syntax on
colorscheme desert
set syntax=htmldjango

" brackets match
" --
set showmatch
set matchtime=1

" statusline
" --
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
