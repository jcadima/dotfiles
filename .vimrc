let mapleader=","         " set leader key to ,

syntax enable
set number
set ruler				   " display row, column, % of document
set shiftwidth=2
set showcmd				   
set cursorline			   " set current line cursorline
set showmatch			   " show matching {} ()
set hlsearch               " highlight search
set pastetoggle=<leader>z  " avoid typing :set paste and :set nopaste 
set scrolloff=10           " Keep min of 10 lines above/below cursor.

" copy all contents from beginning to end of file to clipbard buffer
nnoremap <leader>a gg"+yG

" remove  text from current cursor position to the end of line
nnoremap rs v$d

" copy current line to a new line below and place cursor at the end in insert mode
nmap clb yypA
 
" copy current line to a new line above  and place cursor at the end in insert mode
nmap cla yyPA
 
" Clone whole paragraph below
nmap cpa yap<S-{>p 

" Clone whole paragraph below
nmap cpb yap<S-}>p 

" Save and quit with ,x 
noremap <leader>x :x<cr>

" Save and Quit with ,x in Insert Mode
inoremap <leader>x <C-c>:x<cr>

" Quit File with ,q
noremap <leader>q :q<cr>

" Quit File with ,q  in insert mode
inoremap <leader>q <C-c>:q<cr>

" Save File with ,s
nnoremap <leader>s :w<cr>

" Save Files in insert mode with ,s  <C-c> is CTRL-c which exits insert mode
inoremap <leader>s <C-c>:w<cr>

"surround word in double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

"surround word in single quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" reload .vimrc
nnoremap <leader>rv :source $MYVIMRC<CR>

" remap ESC key
inoremap jk <Esc>
cnoremap jk <Esc>

" Move line up/down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

