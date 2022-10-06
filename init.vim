" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
set encoding=utf-8
" source $VIMRUNTIME/vimrc_example.vim
set ignorecase
set smartcase
set hlsearch
set mouse=a
syntax on
vnoremap // y/<C-R>"<CR>

set backupdir=.,~/tmp,~/
set directory=.,~/tmp,/var/tmp,/tmp
set undodir=.
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
Plugin 'vim-airline/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'drewtempelmeyer/palenight.vim'
" Plugin 'EdenEast/nightfox.nvim'
Plugin 'jpalardy/vim-slime.git'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'chrisbra/csv.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'tmhedberg/SimpylFold'
Plugin 'mtdl9/vim-log-highlighting'
Plugin 'ojroques/vim-oscyank'
Plugin 'nvim-treesitter/nvim-treesitter'
call vundle#end()            " required
" End vundle
filetype plugin indent on    " required

" set laststatus=2
let mapleader=" "
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>l :CtrlPLine %<CR>
let g:ctrlp_map = ''
let g:ctrlp_max_files=0
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

:let g:csv_delim='%'

" split mapping
set completeopt-=preview
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>w
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
" set airline
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#whitespace#enabled = 0
let g:coc_disable_startup_warning = 0

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  " Insert <tab> when previous text is space, refresh completion if not.
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
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
noremap <Leader>s :update<CR>

set number relativenumber
set nu rnu
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
colorscheme palenight
" colorscheme nightfox
set timeoutlen=1000 ttimeoutlen=0
set sidescroll=1
let g:slime_target = "tmux"
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
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>


:nnoremap <expr> <f2> &foldlevel ? 'zM' :'zR'
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

set foldmethod=indent

let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set undofile
set exrc
set secure

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "python"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
