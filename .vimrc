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
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
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
Plugin 'flazz/vim-colorschemes'

call vundle#end()            " required
" End vundle


filetype plugin indent on    " required
