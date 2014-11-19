" Mattias .vimrc
" copied from various resources... you're better of reading some experts
" vimrc...
"
" .vimrc contains 
" runtime vimrc
" this file should be in the .vim directory
"
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.

""""""""""""""""
" => General
""""""""""""""""
set nocompatible
filetype off


"""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""
if has('win32') || has('win64')
  set rtp+=~/vimfiles/bundle/vundle/
  call vundle#begin('$HOME/vimfiles/bundle/')
else
  set rtp+=~/.vim/bundle/vundle/
  call vundle#begin()
endif

Plugin 'gmarik/vundle'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree.git'
"Plugin 'msanders/snipmate.vim.git'
"Plugin 'ervandew/supertab.git'
" Bundle 'joonty/vim-phpunitqf.git'
" Bundle 'wincent/Command-T.git'
Plugin 'kien/ctrlp.vim'
" Bundle 'fholgado/minibufexpl.vim.git'
"Bundle 'tomtom/checksyntax_vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'majutsushi/tagbar'
"Bundle 'bryanthankins/vim-aspnetide'   
Plugin 'bling/vim-airline'
Plugin 'JazzCore/neocomplcache-ultisnips'
Plugin 'SirVer/ultisnips'
" ultisnips snippets are separate
Plugin 'honza/vim-snippets'
Plugin 'Shougo/neocomplcache.vim'
"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'

map <F2> :NERDTreeToggle .<CR>
nmap<F3> :TagbarToggle<CR>
" let g:snips_trigger_key'<c-J>'
let g:SuperTabDefaultCompletionType="context"
let g:airline#extensions#tabline#enabled = 1
let g:airline_enable_syntastic = 1
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '..'
let g:UltiSnipsExpandTrigger='<tab>'

let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_auto_close_preview = 0
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>    neocomplcache#undo_completion()
inoremap <expr><C-l>    neocomplcache#complete_common_string()

inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
inoremap <expr>. neocomplcache#close_popup() . "."
inoremap <expr>( neocomplcache#close_popup() . "("
inoremap <expr>) neocomplcache#close_popup() . ")"
inoremap <expr><space> neocomplcache#close_popup() . " "
inoremap <expr>; neocomplcache#close_popup() . ";"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h>    neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>    neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>    neocomplcache#close_popup()
inoremap <expr><C-e>    neocomplcache#cancel_popup()
inoremap <expr><ESC> pumvisible() ? neocomplcache#cancel_popup() : "\<esc>"

let g:neocomplcache_enable_auto_select = 1

"imap <C-k>  <Plug>(neosnippet_expand_or_jump)
"smap <C-k>  <Plug>(neosnippet_expand_or_jump)


call vundle#end()




filetype plugin indent on
" or to ignore
"
"filetype plugin on
"
" :PluginList          - list configured
" :PluginInstall(!)    - install/(update)
" :PluginSearch(!) foo - search (or refresh cache) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

"""""""""""""""""""
" END Vundle      "
"""""""""""""""""""

set autoread

let mapleader = " "
let g:mapleader = " "

set nowb
set nobackup
set noswapfile
" set autochdir



" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

""""""""""
" => VIM ui
""""""""""
set wildmenu
set wildignore=*.0,*~,*.pyc,*.obj
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set mat=2 		" tenths of a seconds to blink when matching brackets
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hlsearch  		" highlight search results
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set ruler 		
set laststatus=2
set confirm
set cmdheight=2
set relativenumber
set number 		" linenumbers
set showtabline=2
set lazyredraw 		" don't redraw when running macros
set magic 		"  regex turn magic on
" no sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" ingen backslash, problem med vundle på windows
" set shellslash

" hide mouse pointer when writing
set mousehide

let g:dwm_master_pane_width=85  

set cpoptions+=$
set shortmess+=I

""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""
" enable syntax highlighting
if has("syntax")
  syntax on
endif

" turn on this option as well
syntax enable
colorscheme desert
set background=dark


"""""""""""""""""""""""""""
" => Files, backup and undo
"""""""""""""""""""""""""""
" turn off backup, use source control
set nobackup


"""""""""""""""""""""""""""
" => Text, tab indent
"""""""""""""""""""""""""""

" use spaces instead of tabs
" set expandtab

set smarttab

set tabstop=8
set expandtab
set softtabstop=4
set autoindent
" set smartindent
set shiftwidth=4
set wrap

" allow cursor to go to non existing places 
set virtualedit=all

set backspace=indent,eol,start  
set encoding=utf-8
"""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""
" Map space to / och Ctrl-space to ?
map <space> /
map <c-space> ?

" disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


map! jj <Esc>
" buffers
noremap <Leader>l :ls<CR>
noremap <Leader>b :bp<CR>
noremap <Leader>f :bn<CR>
noremap <Leader>g: e#<CR>

" remap 0 to first non blank character
map 0 ^


" Quickfix mode: msbuild error
"au FileType cs set errorformat=\ %#%f(%l\\\,%c):\ error\ CS%n:\ %m
set errorformat=\ %#%f(%l\\\,%c):\ %m
" au FileType cs set errorformat=%f(%l\\,%c):\ %m

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" felstavningar
iab teh the
iab Teh The
iab becuase because




"autocmd BufWriteCmd *.html,*.css,*.js :call Refresh_browser()
"function! Refresh_browser()
"    if &modified
"        write
"        silent !xdotool search --class google-chrome key ctrl+r
"    endif
"endfunction

