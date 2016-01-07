""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set t_Co=256
"colorscheme gruvbox
colorscheme Tomorrow-Night
if has("gui_running")
  if has("gui_gtk2")
	set guifont=termsyn\ 18
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

syntax enable           " syntax highlighting
set mouse=""            " mouse is off

set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
"set showcmd            " show command in bottom bar. Usefull in powerline

set ignorecase          " regex pattern case
set smartcase
set incsearch           " incremental search

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

" re-map Ctrl-c to <Esc>
inoremap <C-c> <Esc>

" window navigation
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

map <Up>   <C-W>k
map <Down> <C-W>j
map <Left> <C-W>h
map <Right> <C-W>l


" remap leader key from \ to <space>
let mapleader=" "

" buffer navigation
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>g :e#<CR>

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

function! FormatCommitHeading()
	normal 0Js | $F_s | 
endfunction
noremap <Leader>m :call FormatCommitHeading()<CR>

" reload settings from $HOME/vimrc
noremap <Leader><C-r> :so ~/.vimrc<CR>

" end of line
noremap <Leader>e $

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
	echo "Plugging setting missing in" pluginpath
endif
