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

filetype plugin indent on

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

"""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree.git'
Bundle 'msanders/snipmate.vim.git'
Bundle 'ervandew/supertab.git'
" Bundle 'joonty/vim-phpunitqf.git'
" Bundle 'wincent/Command-T.git'
Bundle 'kien/ctrlp.vim'
" Bundle 'fholgado/minibufexpl.vim.git'
"Bundle 'tomtom/checksyntax_vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'majutsushi/tagbar'
"Bundle 'bryanthankins/vim-aspnetide'   
Bundle 'bling/vim-airline'


map <F2> :NERDTreeToggle .<CR>
nmap<F3> :TagbarToggle<CR>
" let g:snips_trigger_key'<c-J>'
let g:SuperTabDefaultCompletionType="context"
let g:airline#extensions#tabline#enabled = 1
let g:airline_enable_syntastic = 1
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_enable_signs = 1
"let g:syntastic_error_symbol = 'x'
"let g:syntastic_warning_symbol = '..'

"autocmd BufWriteCmd *.html,*.css,*.js :call Refresh_browser()
"function! Refresh_browser()
"    if &modified
"        write
"        silent !xdotool search --class google-chrome key ctrl+r
"    endif
"endfunction

