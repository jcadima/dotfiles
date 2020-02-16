"      _  ____ 
"     | |/ ___|		
"  _  | | |    		Juan J Cadima
" | |_| | |___ 		https://github.com/jcadima
"  \___/ \____|		https://jcadima.dev
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGINS - VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set nocompatible 
filetype off
syntax enable
let mapleader=","
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'alvan/vim-closetag'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'ryanoasis/vim-devicons'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set number
set ruler
set shiftwidth=4
set softtabstop=4
set tabstop=4
set ttyfast         " Enable fast terminal connection
set cursorline      " highlight current line
set showmatch
set autoindent      " Copy indent to the new line
set backspace=indent        " Allow backspace in insert mode
set backspace+=eol          "
set backspace+=start        "
set hlsearch
set incsearch
set noswapfile		" disable creating of *.swp files
set foldmethod=manual	" use manual folding
set showcmd			" always show current command
set pastetoggle=<leader>z   " avoid typing :set paste and :set nopaste
set scrolloff=10            " Keep min of 10 lines above/below cursor.
set clipboard=unnamed   " register + to system clipboard
set noshowmode              " hide mode, using lightline
set laststatus=2            " set status line
set visualbell              " disable window flashing/beeping, silence is golden
set noerrorbells
set t_vb=


" set window split separator background same as bg (for Gvim):
hi vertsplit guifg=bg guibg=bg  
" Split Management
set splitbelow		" put new split window below and to the right
set splitright


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CTRLP MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor

" CTRLP Search files
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>fc :CtrlP app/Http/Controllers<cr>
nnoremap <leader>fv :CtrlP resources/views<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
" Show hidden files in results
let g:ctrlp_show_hidden = 1


" <c-v> Open in Vertical Split
" <c-x> Open in Horizontal Split
" <c-t> Open in new tab

" uncomment lines below to open new files in tabs
"let g:ctrlp_prompt_mappings = {
"    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
"    \ 'AcceptSelection("t")': ['<cr>'],
"    \ }


" Center search results
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FOLDING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('folding')
  if has('windows')
    let &fillchars='vert: '         
  endif
  set foldmethod=indent               
  set foldlevelstart=99              
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Comment (cc) and Uncomment (cu) code with //
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap   <leader>cc      :s,^\(\s*\)[^// \t]\@=,\1// ,e<CR>:nohls<CR>zvj
noremap   <leader>cu      :s,^\(\s*\)// \s\@!,\1,e<CR>:nohls<CR>zvj

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Return to last edit position when opening files 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lightline Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add export FZF_DEFAULT_COMMAND='git ls-files' to your .zshrc or .bashrc to
" make fzf ignore list of files and directories found in your .gitignore

let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'absolutepath' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lightline Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" If we are running gvim set dark background and theme
" leave default terminal colors for vim
if has('gui_running')
    set background=dark
    colorscheme hybrid_material
	set guifont=Hack\ 12
endif

let g:enable_bold_font = 1
hi LineNr ctermfg=242
hi CursorLineNr ctermfg=cyan
hi VertSplit ctermfg=8 ctermbg=0
hi Statement ctermfg=3
" hi CursorLine term=bold cterm=bold ctermbg=darkgrey


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree plugin, show hidden files by default
let NERDTreeShowHidden=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => HTML Autocomplete 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filenames like *.xml, *.html, *.xhtml, .php 
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,php'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto-Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle cursorline between normal and insert mode
:autocmd InsertEnter,InsertLeave * set cul!

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
" copy to system clipboard
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-u> "+p
vnoremap <C-u> "+p


" Toggle NERDTree with SHIFT n
map <S-n> :NERDTreeToggle<CR>

" edit vimrc on a new tab
nmap <leader>ev :tabedit $MYVIMRC<cr>

" select the word under cursor and overwrite with last yanked text
nnoremap <S-p> viw"0p

" copy all contents from beginning to end of file to clipbard buffer
nnoremap <leader>a gg"+yG

" remove text from current cursor position to the end of line
nnoremap rs v$hd

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

" Quit File
noremap <leader>q :q<cr>

" Quit Files with ,q  in insert mode
inoremap <leader>q <C-c>:q<cr>

" paste the last yanked line
nnoremap -0 "0p

" Delete paragraph/block
nnoremap <leader>dp v}d

" Save file 
nnoremap <leader>w :w<cr>

" Save and exit
inoremap <leader>x <C-c>:x<cr>

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

" remap 1/2 up/down SHIFT-k , SHIFT-j
nnoremap <S-k> <C-u>
nnoremap <S-j> <C-d>

" remap start end of line SHIFT-H, SHIFT-L
nnoremap <S-h> ^
nnoremap <S-l> $

" Navigate split windows
nmap <space>j  <C-W><C-J>
nmap <space>k  <C-W><C-K>
nmap <space>h  <C-W><C-H>
nmap <space>l <C-W><C-L>


" split window horizontally/vertically mappings
nnoremap ,v <C-w>v
nnoremap ,h <C-w>s

" Move lines up/down with SHIFT+UP , SHIFT+DOWN
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>


" remove search highlight with ,<space> 
nmap <leader><space> :nohlsearch<cr>

" Map tabs 
nnoremap 9 :tabprevious<cr>
nnoremap 0 :tabnext<cr>


