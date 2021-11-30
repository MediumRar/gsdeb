""""make vim usable:
" make backspace work like most other apps
set backspace=2

"No vi compatiblity
set nocompatible

" How many lines of history to remember
set history=10000

" Automatically detect file types.
filetype plugin on
"filetype indent on

" Set to auto read when a file is changed from outside
set autoread

" Set title automatically
set title

" Set a more convinient map leader
let mapleader=','

" Don't make windows equal after a split
set noea

" Highlight search things
set hlsearch

" We don't like noise on errors
set noerrorbells
set nonumber

" default colorscheme works pretty well
syntax on
colorscheme default

"always display the status line
set laststatus=2

"Recover cursor position after leaving vim
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Style our Status Line
set statusline=%1*
" buffernr
set statusline+=%1*\[%n]
" File + path
set statusline+=\ %<%F\
" Rownumber
set statusline+=\ %=\ row:%l/%L
" Colnumber
set statusline+=\ col:%03c\
" Modified? Readonly?
set statusline+=%0*\ \ %m%r%w\ (%p)\ \

" Make vimdiff usable
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=18  gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=18  gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=18  gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=124 gui=none guifg=bg guibg=Red

" Use 4 spaces as tab
nnoremap <Leader>c :set cursorline! <CR>
set tabstop=4
set shiftwidth=4
set expandtab

" No visual on mouse select
set mouse-=a

