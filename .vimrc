"      _  ____ 
"     | |/ ___|		
"  _  | | |    		Juan J Cadima
" | |_| | |___ 		https://github.com/jcadima
"  \___/ \____|		https://jcadima.dev


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
let mapleader=","
set nocompatible	" be iMproved
syntax enable
set number
set ruler
set shiftwidth=4
set softtabstop=4
set tabstop=4
set ttyfast			" Enable fast terminal connection
set cursorline		" highlight current line
set showmatch
set autoindent		" Copy indent to the new line

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
set laststatus=2			" set status line
" set window split separator background same as bg (for Gvim):
hi vertsplit guifg=bg guibg=bg  


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" If we are running gvim set dark background and theme
" leave default terminal colors for vim
if has('gui_running')
	set background=dark
    colorscheme hybrid_material
endif

set guifont=Hack\ 12
let g:enable_bold_font = 1
hi LineNr ctermfg=242
hi CursorLineNr ctermfg=cyan
hi VertSplit ctermfg=8 ctermbg=0
hi Statement ctermfg=3
hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=darkgrey


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree Plugin Notes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Vim 8+ packages
" - Using Vim v8.0 built-in package management; see :help packages for more information
" - NERDTree (~/.vim/pack/vendor/start/nerdtree)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree plugin, show hidden files by default
let NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CTRL Plugin Notes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Install Location: ~/.vim/bundle/ctrlp.vim (Unix/Linux)
set runtimepath^=~/.vim/bundle/ctrlp.vim

" open new files in tabs 
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

" Ignore selected dirs/files
let g:ctrlp_custom_ignore = 'vendor\node_modules\DS_Store\|git'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto-Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" prevent duplication everytime vimrc is sourced
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

" Fix .yaml files indent
augroup yamlfiles
	autocmd!
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
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

" swap the current paragraph with the next
nnoremap g{ {dap}p{

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
inoremap jj <Esc>
cnoremap jj <Esc>

" remap 1/2 up/down:
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>

" Move lines up/down with SHIFT+UP , SHIFT+DOWN
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Split Management
set splitbelow		" put new split window below and to the right
set splitright

" split window horizontally/vertically mappings
nnoremap ,v <C-w>v
nnoremap ,h <C-w>s

" Navigate split windows with SHIFT-H, SHIFT-J, SHIFT-K, SHIFT-L
nmap <S-j> <C-W><C-J>
nmap <S-k> <C-W><C-K>
nmap <S-h> <C-W><C-H>
nmap <S-l> <C-W><C-L>

" Resize split window mappings
map + <c-w>+
map - <c-w>-
map <c-n> <c-w><
map <c-m> <c-w>>
map <c-=> <c-W>=  

" Add simple hightlight removal
nmap <leader><space> :nohlsearch<cr>

" Map previous/next tabs with SHIFT [Left] , SHIFT [Right]
nnoremap <S-Left> :tabprevious<cr>
nnoremap <S-Right> :tabnext<cr>
