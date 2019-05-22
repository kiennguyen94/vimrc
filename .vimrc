set encoding=utf-8
source $VIMRUNTIME/vimrc_example.vim
set ignorecase
set smartcase
set hlsearch
set mouse=
syntax on
colorscheme desert
vnoremap // y/<C-R>"<CR>

set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set hidden
set textwidth=0 wrapmargin=0

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
:imap ;; <Esc>
set nocompatible              " be iMproved, required
filetype off                  " required

" Broken auto bracketing
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap { {<CR>}<Esc>O
" autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
" inoremap ) <c-r>=ClosePair(')')<CR>
" inoremap ] <c-r>=ClosePair(']')<CR>
" inoremap } <c-r>=CloseBracket()<CR>

" Auto bracketing
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O
" end Auto bracketing

:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>
nnoremap gb :ls<CR>:b<Space>


" Vundle 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline' 
Plugin 'bling/vim-bufferline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'severin-lemaignan/vim-minimap'

call vundle#end()            " required
" End vundle
filetype plugin indent on    " required

let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let mapleader=" "
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>l : CtrlPLine<CR>
let g:ctrlp_map = '<c-k>'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

"set airline 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'
let g:ycm_semantic_completion_toggle = '<c-q>'
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

set number relativenumber
set nu rnu
colorscheme palenight
set cursorline
set timeoutlen=1000 ttimeoutlen=0
" set foldmethod=syntax
set sidescroll=1
"
