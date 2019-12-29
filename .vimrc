"      _  ____ 
"     | |/ ___|		
"  _  | | |    		Juan J Cadima
" | |_| | |___ 		https://github.com/jcadima
"  \___/ \____|		https://jcadima.dev


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","  
set nocompatible    " be iMproved
syntax enable
set number
set ruler
set shiftwidth=4
set softtabstop=4
set tabstop=4
set ttyfast					" Enable fast terminal connection
set cursorline				" highlight current line
set showmatch
set autoindent				" Copy indent to the new line

set backspace=indent		" Allow backspace in insert mode
set backspace+=eol			"_|
set backspace+=start		"_|

set hlsearch
set incsearch
set pastetoggle=<leader>z   " avoid typing :set paste and :set nopaste 
set scrolloff=10            " Keep min of 10 lines above/below cursor.
set clipboard=unnamedplus   " register + to system clipboard 
set noshowmode				" hide mode, using plugin

set visualbell				" disable window flashing/beeping, silence is golden 
set noerrorbells
set t_vb=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme hybrid_material
set guifont=Hack\ 12
let g:enable_bold_font = 1
hi LineNr ctermfg=242
hi CursorLineNr ctermfg=15
hi VertSplit ctermfg=8 ctermbg=0
hi Statement ctermfg=3


" ctrlp plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim

" open new files in tabs (ctrlp)
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }


" Ignore selected dirs/files (ctrlp)
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto-Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Group autocmd's to prevent duplication everytime vimrc is sourced
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle NERDTree with SHIFT n
map <S-n> :NERDTreeToggle<CR>

" edit vimrc on a new tab
nmap <leader>ev :tabedit $MYVIMRC<cr>

" copy all contents from beginning to end of file to clipbard buffer
nnoremap <leader>a gg"+yG

" remove text from current cursor position to the end of line
nnoremap rs v$d

" copy current line to a new line below and place cursor at the end in insert mode
nmap clb yypA
 
" copy current line to a new line above  and place cursor at the end in insert mode
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

" Delete paragraph/block
nnoremap <leader>dp v}d

" Save files with ,w
nnoremap <leader>w :w<cr>

" Save files in insert mode with ,w  <C-c> is CTRL-c which exits insert mode
inoremap <leader>w <C-c>:w<cr>

"surround word in double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

"surround word in single quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" remove highlights after searches
nmap <leader><space> :nohlsearch<cr>

" remap ESC key
inoremap fj <Esc>
cnoremap fj <Esc>

" Move lines up/down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Split Management
set splitbelow		" put new split window below and to the right
set splitright

" Navigate split windows with SHIFT-H, SHIFT-J, SHIFT-K, SHIFT-L
nmap <S-j> <C-W><C-J>
nmap <S-k> <C-W><C-K>
nmap <S-h> <C-W><C-H>
nmap <S-l> <C-W><C-L>

" Add simple hightlight removal
nmap <leader><space> :nohlsearch<cr>

" Map previous/next tabs with SHIFT [Left] , SHIFT [Right]
nnoremap <S-Left> :tabprevious<cr>
nnoremap <S-Right> :tabnext<cr>
