" .vimrc 

syntax on                 " Syntax highlighting.
syntax enable


set nocompatible          " No compatibility with VI.
filetype on               " Recognize filetype extension.
filetype indent on        " Enable file indent.
filetype plugin on        " Allow plugins to be loaded by file type.


set background=dark       " Light background for color schemes.
colorscheme solarized            " Solarized color scheme.
highlight ColorColumn ctermbg=10

set smartindent
set colorcolumn=80
set expandtab             " Expand tabs with spaces.
set ignorecase            " Ignore case in regular expressions
set incsearch             " Immediately highlight search matches.
set modeline              " Check for a modeline.
set noerrorbells          " No beeps on errors.
set nohls                 " Don't highlight all regex matches.
set nowrap                " Don't soft wrap.
set number                " Display line numbers.
set ruler                 " Display row, column and % of document.
set scrolloff=10          " Keep min of 10 lines above/below cursor.
set shiftwidth=2          " >> and << shift 3 spaces.
set showcmd               " Show partial commands in the status line.
set showmatch             " Show matching () {} [] etc..
set showmode              " Show current mode.
set smartcase             " Searches are case-sensitive if caps used.
set softtabstop=2         " See spaces as tabs.
set tabstop=2             " <Tab> move three characters.
set textwidth=79          " Hard wrap at 79 characters.
set virtualedit=block     " Allow the cursor to go where there's no char.
set wildmode=longest,list " Tab completion works like bash.


" Toggle paste mode.
noremap <Leader>p :set paste!<CR>

" Toggle highlighting of the last search.
noremap <Leader>h :set hlsearch! hlsearch?<CR>





