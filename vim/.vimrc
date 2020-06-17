filetype off
let mapleader = "," " remap leader to comma.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/dotfiles/vim/plugins.vim

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
set dir=~/.vim/swap
set expandtab
set foldmethod=indent
set foldnestmax=10
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
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000
set updatetime=300
set wildmenu
set grepprg=rg\ --vimgrep

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

augroup FileTypeGroup
  " Set file type to toml for .smithrc file
  au BufRead,BufNewFile *.smithrc setfiletype toml

  au BufRead,BufNewFile *.md setfiletype markdown
  au BufRead,BufNewFile *.eslintrc setfiletype json

  " Hack to fix exs file loading.
  " Set file type to elixir for .exs file
  au BufRead,BufNewFile *.exs setfiletype elixir

  " Set .envrc as bash file
  au BufRead,BufNewFile *.envrc setfiletype sh
augroup END

" Do not show line number in terminal
au TermOpen * setlocal nonumber norelativenumber

augroup autosave
  autocmd BufLeave,FocusLost * silent! wall " autosave.
augroup END

augroup autoSetTab
  autocmd FileType markdown setlocal conceallevel=0|setlocal expandtab|setlocal spell
  autocmd FileType text setlocal spell
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
nnoremap <leader>bp orequire 'pry'; binding.pry<esc> " insert binding.pry after current line.
nnoremap <leader>co <C-w><C-o> " close other opened panes.
nnoremap <leader>ct :!ctags -R .<CR> " generate ctags
nnoremap <leader>d. :1,.d<CR>
nnoremap <leader>ep <C-w>= " make all panes equal size.
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sp <C-w>s
nnoremap <leader>st :sp<CR>:term<CR>A
nnoremap <leader>jq :%!jq<CR>
nnoremap <leader>pt :setlocal paste!<CR> " toggle paste mode on/off.
nnoremap <leader>q <C-w>q
nnoremap <leader>rd :syntax sync fromstart<CR>:redraw!<CR>
nnoremap <leader>rf :checktime<CR> " Refresh all buffers
nnoremap <leader>rn :set relativenumber!<CR>
nnoremap <leader>rt :!ripper-tags -R .<CR> " generate ripper tags.
nnoremap <leader>sl O# frozen_string_literal: true<esc> " fix rubocop string literal error.
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ts :%s/\s\+$//<CR> " remove trailing whitespace.
nnoremap <leader>w :set nowrap!<CR> " no wrap.
nnoremap <leader>x :x<CR>
nnoremap <leader>hp <C-w>s
nnoremap <leader>vp <C-w>v
nnoremap <silent>Y y$
nnoremap <silent>y. :1,.y<CR>
nnoremap <silent>ya :1,$y<CR>
nnoremap <leader>ht :sp<CR>:term<CR>A
nnoremap <leader>vt :vs<CR>:term<CR>A
tnoremap <Esc> <C-\><C-n>
tnoremap <leader>x <C-\><C-n>:q!<CR>
vnoremap < <gv
vnoremap <leader>jq :!jq<CR>
vnoremap > >gv

""""""""""""""""""""""""""""""""""""""""
" Easy window navigation
""""""""""""""""""""""""""""""""""""""""
if has('nvim')
  " Hack to get C-h working in NeoVim
  nnoremap <BS> <C-W>h
  " Or run below command in terminal
  " infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
  " tic $TERM.ti
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
" Insert line number
com! -range InsertLineNumber <line1>,<line2>!nl -s '. ' -w 1
""

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

"" For haskell
function! CheckIfFileExists(filename)
  if filereadable(a:filename)
    return 1
  endif

  return 0
endfunction
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
