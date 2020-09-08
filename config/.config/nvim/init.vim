filetype off
let mapleader = "," " remap leader to comma.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.config/nvim/plugins.vim

au TermOpen * setlocal nonumber norelativenumber
tnoremap <Esc> <C-\><C-n>
tnoremap <leader>x <C-\><C-n>:q!<CR>

" Hack to get C-h working in NeoVim
nnoremap <BS> <C-W>h
" Or run below command in terminal
" infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
" tic $TERM.ti

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Generic settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent plugin on
behave xterm

syntax on

set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=~/.vim/bakup
set clipboard=unnamedplus
set colorcolumn=80
set cursorcolumn
set cursorline
set dir=~/.config/nvim/swap
set expandtab
set foldmethod=indent
set foldnestmax=10
set grepprg=rg\ --vimgrep
set hlsearch
set ignorecase
set incsearch
set iskeyword+=-
set lazyredraw
set linebreak
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set mouse=c
set nobackup
set nofoldenable
set noshowmode
set nowrap
set number
set relativenumber
set ruler
set scrolloff=3
set shiftwidth=2
set showcmd
set smartcase
set smarttab
set softtabstop=2
set synmaxcol=160
set tabstop=2
set textwidth=80
set ttyfast
set undodir=~/.config/nvim/undo
set undofile
set undolevels=1000
set undoreload=10000
set updatetime=300
set wildmenu

augroup autosave
  autocmd BufLeave,FocusLost * silent! wall " autosave.
augroup END

""""""""""""""""""""""""""""""""""""""""
" Mapping
""""""""""""""""""""""""""""""""""""""""

nnoremap <D-1> 1gt
nnoremap <D-2> 2gt
nnoremap <D-3> 3gt
nnoremap <D-4> 4gt
nnoremap <D-5> 5gt
nnoremap <D-6> 6gt
nnoremap <D-7> 7gt
nnoremap <D-8> 8gt
nnoremap <D-9> :tablast<CR>
nnoremap <leader><space> @q
nnoremap <leader>co <C-w><C-o> " close other opened panes.
nnoremap <leader>ct :!ctags -R .<CR> " generate ctags
nnoremap <leader>d. :1,.d<CR>
nnoremap <leader>ep <C-w>= " make all panes equal size.
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>jq :%!jq<CR>
nnoremap <leader>pt :setlocal paste!<CR> " toggle paste mode on/off.
nnoremap <leader>q <C-w>q
nnoremap <leader>rd :syntax sync fromstart<CR>:redraw!<CR>
nnoremap <leader>rf :checktime<CR> " Refresh all buffers
nnoremap <leader>rn :set relativenumber!<CR>
nnoremap <leader>rt :!ripper-tags -R .<CR> " generate ripper tags.
nnoremap <leader>sp <C-w>s
nnoremap <leader>st :sp<CR>:term<CR>A
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ts :%s/\s\+$//<CR> " remove trailing whitespace.
nnoremap <leader>vp <C-w>v
nnoremap <leader>vt :vs<CR>:term<CR>A
nnoremap <leader>w :set nowrap!<CR> " no wrap.
nnoremap <leader>x :x<CR>
nnoremap <leader>y. :1,.y<CR>
nnoremap <leader>ya :1,$y<CR>
nnoremap <silent>Y y$
vnoremap < <gv
vnoremap <leader>jq :!jq<CR>
vnoremap > >gv

" copy current file name (relative/absolute) to system clipboard (Mac version)
" See :help let :help expand :help registers for details
if has("mac")
  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>fn :let @*=expand("%:p")<CR>
endif

" copy current file name (relative/absolute) to system clipboard (Linux version)
if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
  " absolute path (/something/src/foo.txt)
  nnoremap <leader>fn :let @+=expand("%:p")<CR>
endif

""""""""""""""""""""""""""""""""""""""""
" Close the loclist/quickfix window automatically when the buffer is closed
""""""""""""""""""""""""""""""""""""""""
augroup CloseLocQuickFixlistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | cclose | endif
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create file's directory before saving, if it doesn't exist.
" Original: https://stackoverflow.com/a/4294176/151048
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
fun! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file !~# '\v^\w+\:\/'
    call mkdir(fnamemodify(a:file, ':h'), 'p')
  endif
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source:
" https://sharats.me/posts/automating-the-vim-workplace/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
"" CTRL-U in insert mode deletes a lot. Put an undo-point before it.
""""""""""""""""""""""""""""""""""""""""
inoremap <C-u> <C-g>u<C-u>

""""""""""""""""""""""""""""""""""""""""
"" Sort lines over motion
""""""""""""""""""""""""""""""""""""""""
xnoremap <silent> gs :sort i<CR>
nnoremap <silent> gs :set opfunc=SortLines<CR>g@
fun! SortLines(type) abort
    '[,']sort i
endfun

""""""""""""""""""""""""""""""""""""""""
"" Easier Alternative to :
""""""""""""""""""""""""""""""""""""""""
noremap <Space> :

""""""""""""""""""""""""""""""""""""""""
"" Map to change pwd to the repo-root-directory of the current buffer.
""""""""""""""""""""""""""""""""""""""""
nnoremap cu :call <SID>CdToRepoRoot()<CR>
let g:markers = split('.git .hg .svn .project .idea manage.py pom.xml')
fun s:CdToRepoRoot() abort
  for marker in g:markers
    let root = finddir(marker, expand('%:p:h') . ';')
    if !empty(root)
      let root = fnamemodify(root, ':h')
      exe "chdir" . root
      echo 'cd ' . root . ' (found ' . marker . ')'
      return
    endif
  endfor
  echoerr 'No repo root found.'
endfun

""""""""""""""""""""""""""""""""""""""""
"" Mapping to change pwd to the directory of the current buffer.
""""""""""""""""""""""""""""""""""""""""
nnoremap cm :tcd %:p:h<cr>:pwd<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source http://karolis.koncevicius.lt/posts/porn_zen_and_vimrc/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make n always search forward and N backward
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source https://vim.fandom.com/wiki/Highlight_all_search_pattern_matches
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight matches without moving
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <leader>h Highlighting()
