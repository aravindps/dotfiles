""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set t_Co=256
if has("gui_running")
  if has("gui_gtk2")
	set guifont=M+\ 2m\ 16
  elseif has("gui_macvim")
    set guifont=Inconsolata\ 12     " Not yet tested
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI  " Not yet tested
  endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" utils
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set relativenumber      " enable relative line number
set number              " show current line number
set wildmenu            " visual autocomplete for command menu

set cursorline          " highlight current line
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4        " number of space characters inserted for indentation
set list                " marks tabs and spaces at EOL

syntax enable           " syntax highlighting
set mouse=""            " mouse is off

set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
"set showcmd            " show command in bottom bar. Usefull in powerline

set ignorecase          " regex pattern case
set smartcase
set incsearch           " incremental search

set nostartofline       " Prevent the cursor from changing the current column
                        " when jumping different buffer
set autoread            " reload file from disk
set noswapfile          " disables swp file
set undofile            " Maintain undo history between sessions
set undodir=~/.vim/undodir


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keymap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" re-map ;(semi-colon) to :(colon)
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;


" J inverse K
nnoremap K f<space>r<CR>

" Y yank till the EOL
nnoremap Y y$

" re-map Ctrl-c to <Esc>
inoremap <C-c> <Esc>

" window navigation - disabled as it conflicts with some vim features
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
"command              " overritten       | actual vim function
"----------------------------------------|--------------------
"noremap gh   <C-w>h  " left window      | selection
"noremap gj   <C-w>j  " down window      | move down in line wraps
"noremap gk   <C-w>k  " up window        | move up in line wraps
"noremap gl   <C-w>l  " right window     |
"noremap gs   <C-w>s  " horizontal split | sleep
"noremap g\|  <C-w>v  " vertical split   |
"noremap gr   <c-w>r  " swap window      |

" alternative window navigation with arrow keys
map <Up>    <C-W>k
map <Down>  <C-W>j
map <Left>  <C-W>h
map <Right> <C-W>l


" remap leader key from \ to <space>
let mapleader=" "

" buffer navigation
nnoremap <Leader>l :ls<CR>:
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>d :bd<CR>

" Ngb to jump to buffer number  N = 0 to 10
let c = 1
while c <= 9
    execute "nnoremap <Leader>" . c . " :" . c . "b\<CR>"
	let c += 1
endwhile
nnoremap <Leader>0 :10b<CR>

" other way
" let c = 1
" while c <= 99
"     execute "nnoremap " . c . "gb :" . c . "b\<CR>"
"     let c += 1
" endwhile

" force write wth sudo permision
noremap <Leader>W :w !sudo tee % > /dev/null
noremap <Leader>w :w<CR>

noremap <Leader>r     :e!<CR>                      " reload current file from disk
noremap <Leader><C-r> :so ~/.vimrc<CR>             " reload settings from $HOME/vimrc
noremap <Leader><C-e> :e ~/.vimrc<CR>              " edit settings from $HOME/vimrc
noremap <Leader>e     $                            " end of line
" Include all the files
set path+=**
" find files
noremap <Leader>f     :find 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load plugins using Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let pluginpath="~/.vim/plugins"
if filereadable(expand(pluginpath))
	if filewritable(expand("~/.vim/bundle/Vundle.vim"))
		source ~/.vim/plugins
	else
		echo "Vundle is not available. Install 'VundleVim/Vundle.vim'"
	endif
else
	echo "Plugging setting missing in " pluginpath
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load custom vim function
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vimfunctionpath="~/.vim/vim_functions"
if filereadable(expand(vimfunctionpath))
	source ~/.vim/vim_functions
else
	echo "Vim custom functions missing in " vimfunctionpath
endif
"colorscheme dracula
"colorscheme tender
colorscheme onedark
set termguicolors
