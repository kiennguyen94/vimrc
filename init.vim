set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
set encoding=utf-8
" source $VIMRUNTIME/vimrc_example.vim
set ignorecase
set smartcase
set hlsearch
set mouse=i
syntax on
vnoremap // y/<C-R>"<CR>

set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set smartindent
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
" :imap ;; <Esc>
:imap jk <Esc>
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

nnoremap gb :ls<CR>:b<Space>


" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'neoclide/coc.nvim'
Plugin 'Rykka/InstantRst'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'jpalardy/vim-slime.git'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'junegunn/vim-easy-align'
Plugin 'chrisbra/csv.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'prabirshrestha/async.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tmhedberg/SimpylFold'
Plugin 'mtdl9/vim-log-highlighting'
" Plugin 'prabirshrestha/vim-lsp'

call vundle#end()            " required
" End vundle
filetype plugin indent on    " required

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let mapleader=" "
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>l :CtrlPLine %<CR>
let g:ctrlp_map = ''
let g:ctrlp_max_files=0
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

:let g:csv_delim='%'
" if executable('clangd')
"     au User lsp_setup call lsp#register_server({
"             \ 'name': 'clangd',
"             \ 'cmd': {server_info->['clangd', '-background-index']},
"             \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"             \
"     })
" endif
" let g:register_server = {
"     'name' : 'clangd',
"     'cmd' : {server_info->['clangd', '-background-index']},
"     'whitelist' : ['c', 'cpp', 'objc', 'objcpp'],
" }
" let g:lsc_server_commands = {
"   \ 'c': 'cquery --init="{\"cacheDirectory\": \"/tmp/cquery_cache\"}"',
"   \ 'cpp': 'cquery --init="{\"cacheDirectory\": \"/tmp/cquery_cache\"}"',
"   \ }
"
" split mapping
set completeopt-=preview
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>w
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
" set airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#coc#enabled = 1
let g:coc_disable_startup_warning = 1

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_server_python_interpreter = '/n/w1-knguyen/anaconda2/install/envs/py36/bin/python'
" let g:ycm_semantic_triggers = { 'cpp': [ 're!.' ] }
" let g:ycm_global_ycm_extra_conf = "/home/knguyen/.vim/ycm_extra_conf.py""

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'
" set completeopt-=preview
" let g:ycm_semantic_completion_toggle = '<c-q>'
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
noremap <Leader>s :update<CR>

set number relativenumber
set nu rnu
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /^\s* \s*\|\s\+$/
colorscheme palenight
set timeoutlen=1000 ttimeoutlen=0
set foldmethod=syntax
set sidescroll=1
let g:slime_target = "tmux"
" let g:slime_python_ipython
let g:slime_python_ipython = 1
let g:slime_paste_file = "$HOME/.slime_paste"
" " guibg=lightgrey guifg=blue
hi Terminal ctermbg=Black ctermfg=White
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

au BufRead,BufNewFile *.wsgi set filetype=python

:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>
set cursorcolumn
set cursorline
" :autocmd InsertEnter,InsertLeave * set cul!
" :autocmd InsertEnter * set cul
" :autocmd InsertLeave * set nocul
" let &t_SI = "\e[3 q"
" let &t_EI = "\e[5 q"
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
" if exists('$TMUX')
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
" else
"     let &t_SI = "\e[5 q"
"     let &t_EI = "\e[2 q"
" endif
" set
" set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
" noremap <leader>x :!git blame % > %.blame<CR>:vsplit %.blame<CR>

command! -nargs=* Blame call s:GitBlame()

function! s:GitBlame()
   let cmdline = "git blame -w " . bufname("%")
   let nline = line(".") + 1
   vertical rightb new
   setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
   execute "$read !" . cmdline
   setlocal nomodifiable
   execute "normal " . nline . "gg"
   execute "set filetype=rst"
endfunction

"======================================================
" function runs git show on report of git blame;
" the first token of a line is taken as SHA checsum of the
" git commit
"======================================================
command! -nargs=* GShow call s:GitShowFromBlame()

function! s:GitShowFromBlame()
   let curline = getline( "." )
   let tokens = split(curline)
   let cmdline = "git show  -w " . tokens[0]
   "botright new
   "topleft new
   "vsplit new
   "vnew new
   vertical new
   setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
   execute "$read !" . cmdline
   setlocal nomodifiable
   execute "normal 1gg"
   execute "set filetype=git"
endfunction

command! -nargs=* GDiff call s:GitDiff()

function! s:GitDiff()
   let cmdline = "git diff " . bufname("%")
   let nline = line(".") + 1
   vertical rightb new
   setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
   execute "$read !" . cmdline
   setlocal nomodifiable
   execute "set filetype=git"
endfunction


command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
" command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  let x = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  vert botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  " execute '$read !'. x
  setlocal nomodifiable
  1
endfunction

command! Vb normal! <C-v>

:cnoremap <C-K> <Up>
:cnoremap <C-J> <Down>
:cnoremap <C-H> <Left>
:cnoremap <C-L> <Right>

:nnoremap <expr> <f2> &foldlevel ? 'zM' :'zR'
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

" function! s:ExecuteInShell(command)
"   let command = join(map(split(a:command), 'expand(v:val)'))
"   let winnr = bufwinnr('^' . command . '$')
"   silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
"   setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
"   echo 'Execute ' . command . '...'
"   silent! execute 'silent %!'. command
"   silent! execute 'resize ' . line('$')
"   silent! redraw
"   silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
"   silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
"   echo 'Shell command ' . command . ' executed.'
" endfunction
" command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)
