"      _  ____ 
"     | |/ ___|		
"  _  | | |    		Juan J Cadima
" | |_| | |___ 		https://github.com/jcadima
"  \___/ \____|


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mapleader=","  
set nocompatible    " be iMproved
syntax enable
set number
set ruler
set shiftwidth=2
set cursorline
set showmatch
set hlsearch
set pastetoggle=<leader>z  " avoid typing :set paste and :set nopaste 
set scrolloff=10          " Keep min of 10 lines above/below cursor.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme nord
hi LineNr ctermfg=242
hi CursorLineNr ctermfg=15
hi VertSplit ctermfg=8 ctermbg=0
hi Statement ctermfg=3


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" copy all contents from beginning to end of file to clipbard buffer
nnoremap <leader>a gg"+yG

" remove  text from current cursor position to the end of line
nnoremap rs v$d

" copy current line to a new line below and place cursor at the end in insert mode
nmap clb yypA
 
"j copy current line to a new line above  and place cursor at the end in insert mode
nmap cla yyPA
 
" Clone whole paragraph below
nmap cpa yap<S-{>p 

" Clone whole paragraph above
nmap cpb yap<S-}>p 

" Save and quit with ,x 
noremap <leader>x :x<cr>

" Save and Quit with ,x in Insert Mode
inoremap <leader>x <C-c>:x<cr>

" Quit Files with ,q
noremap <leader>q :q!<cr>

" Quit Files with ,q  in insert mode
inoremap <leader>q <C-c>:q!<cr>

" Save files with ,s
nnoremap <leader>s :w<cr>

" Save files in insert mode with ,s  <C-c> is CTRL-c which exits insert mode
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

" Move lines up/down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FUNCTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

fun! CurDir()
  let curdir = substitute(getcwd(), $HOME, "~", "")
  return curdir
endfun

fun! HasPaste()
  if &paste
    return '[PASTE]'
  else
    return ''
  endif
endfun
