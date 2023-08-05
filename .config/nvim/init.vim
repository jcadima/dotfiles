"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
syntax on
set updatetime=250
set background=dark
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set cursorline      " highlight current line
set expandtab
set wildmenu
set wildmode=list:longest,full
set ttyfast
set showmatch
set hlsearch
set incsearch
set number
set matchtime=1
set laststatus=2
set t_Co=256
set scrolloff=10  " Keep min of 10 lines above/below cursor
set backspace=indent,eol,start
set visualbell
set noerrorbells
set splitbelow
set splitright
set cmdheight=2
set noshowmode
set nobackup   " no more swapfiles
set nowritebackup
set noswapfile
set noundofile
set encoding=UTF-8
set fileencoding=UTF-8
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set foldmethod=manual

" Store yank or delete with paste on system clipboard
set clipboard=unnamed
set clipboard+=unnamedplus

if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPlug plugin manager
" call plug#begin('~/AppData/Local/nvim/plugged')  " Windows 
call plug#begin()  " Linux
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/html5.vim'
Plug 'airblade/vim-rooter'
Plug 'sindrets/diffview.nvim' " Diff View Git
Plug 'justinmk/vim-sneak'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

" makes vim autocomplete (), [], {}, '', "", etc
Plug 'jiangmiao/auto-pairs'

" makes vim close html tags
Plug 'alvan/vim-closetag'

" Adds dev icons
Plug 'ryanoasis/vim-devicons'
" see the git status of the current line in
" the gutter
Plug 'airblade/vim-gitgutter'

" better way to comment lines inside vim
Plug 'preservim/nerdcommenter'

" file tree navigator
Plug 'scrooloose/nerdtree'

" matches pairs of things (if-else, tags, etc)
Plug 'andymass/vim-matchup'

" necessary to follow styles of a project
Plug 'editorconfig/editorconfig-vim'

" PHP specific plugins
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
Plug 'jwalton512/vim-blade'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MAPPINGS 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","

" removes highlighting of search terms
nnoremap <leader><space> :nohlsearch<CR>


if executable('intelephense')
  augroup LspPHPIntelephense
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'intelephense',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
        \ 'whitelist': ['php'],
        \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
        \ 'workspace_config': {
        \   'intelephense': {
        \     'files': {
        \       'maxSize': 1000000,
        \       'associations': ['*.php', '*.phtml'],
        \       'exclude': [],
        \     },
        \     'completion': {
        \       'insertUseDeclaration': v:true,
        \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
        \       'triggerParameterHints': v:true,
        \       'maxItems': 100,
        \     },
        \     'format': {
        \       'enable': v:true
        \     },
        \   },
        \ }
        \})
  augroup END
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AUTOCLOSE HTML TAGS 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filenames like *.xml, *.html, *.xhtml, ...
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
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Return to last edit position when opening files 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" Tab / Shift Tab to navigate between tabs
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

" remap ESC key
inoremap jj <Esc>
cnoremap jj <Esc>

" j and k 
inoremap kk <Esc>
cnoremap kk <Esc>


inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> gb <C-O><CR>

" use ALT + hjkl to move between split/vsplit panels
nnoremap <A-j> <C-W><C-J>
nnoremap <A-k> <C-W><C-K>
nnoremap <A-l> <C-W><C-L>
nnoremap <A-h> <C-W><C-H>

" Goto previous and next tabs
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" 1/2 page up/down
nnoremap <S-j>  <C-d>
nnoremap <S-k> <C-u>

" Enable spell check on git commit messages
autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell

" Highlight Markdown files
autocmd BufRead,BufNewFile *.md,*.txt set filetype=markdown 

autocmd BufRead,BufNewFile *.php set tabstop=4 shiftwidth=4 tabstop=4
autocmd BufRead,BufNewFile *.blade.php set filetype=blade.html
autocmd BufRead,BufNewFile *.js set tabstop=2 shiftwidth=2 tabstop=2

" Format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" Make Arrowkey do something useful, resize the viewports accordingly and
" it also forces us to use the default Vim movement keys HJKL
nnoremap <Left> :vertical resize -5<CR>
nnoremap <Right> :vertical resize +5<CR>
nnoremap <Up> :resize -5<CR>
nnoremap <Down> :resize +5<CR>

" Show the buffer number on the top of window tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


" Switch to the next buffer
nnoremap <Tab> :bnext<CR>

" Switch to the previous buffer
nnoremap <S-Tab> :bprev<CR>

" Map <Leader>s to search and replace in the current buffer
" replace string currently in cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Show the buffer number on the top of window tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


" <CTRL>+E opens NERDTree file explorer on the right
" after Caleb Porzio VSCode newsletter tip, file tree navigator only on the
" right as it does not make my current code jump when we open it =)
nmap <silent> <C-E> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  TELESCOPE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find files using Telescope command-line sugar.
nnoremap <Space>f <cmd>Telescope find_files<cr>
nnoremap <Space>g <cmd>Telescope live_grep<cr>
nnoremap <Space>b <cmd>Telescope buffers<cr>
nnoremap <Space>h <cmd>Telescope help_tags<cr>


" Laravel Shortcuts for Telescope
nnoremap <Space>m <cmd>Telescope find_files cwd=app/Models<CR>
nnoremap <Space>c <cmd>Telescope find_files cwd=app/Http<CR>
nnoremap <Space>v <cmd>Telescope find_files cwd=resources/views<CR>
nnoremap <Space>d <cmd>Telescope find_files cwd=database<CR>


autocmd CursorHold * silent call CocActionAsync('highlight')

" set the colorsheme
" list: https://github.com/rafi/awesome-vim-colorschemes
colorscheme jellybeans
