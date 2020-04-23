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

augroup autosave
  autocmd BufLeave,FocusLost * silent! wall " autosave.
augroup END

augroup setFileType
  au BufRead,BufNewFile *.md set filetype=markdown
augroup END

augroup autoSetTab
  autocmd FileType python setlocal tabstop=4|setlocal shiftwidth=4|setlocal expandtab
  autocmd FileType markdown setlocal conceallevel=0|setlocal expandtab|setlocal spell
  autocmd FileType text setlocal spell
augroup END

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

if !has('nvim')
  set ttymouse=xterm2
endif

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

  " Hack to fix exs file loading.
  " Set file type to elixir for .exs file
  au BufRead,BufNewFile *.exs setfiletype elixir

  " Set .envrc as bash file
  au BufRead,BufNewFile *.envrc setfiletype sh
augroup END

" Do not show line number in terminal
au TermOpen * setlocal nonumber norelativenumber

""""""""""""""""""""""""""""""""""""""""
" Mapping
""""""""""""""""""""""""""""""""""""""""
nnoremap - orequire 'pry'; binding.pry<esc> " insert binding.pry after current line.
nnoremap <C-e> <C-w>= " make all panes equal size.
nnoremap <Leader>rf :checktime<CR> " Refresh all buffers
nnoremap <leader><space> @q
nnoremap <leader>co <C-w><C-o> " close other opened panes.
nnoremap <leader>ct :!ctags -R .<CR> " generate ctags
nnoremap <leader>d. :1,.d<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>pt :setlocal paste!<CR> " toggle paste mode on/off.
nnoremap <leader>rd :syntax sync fromstart<CR>:redraw!<CR>
nnoremap <leader>rt :!ripper-tags -R .<CR> " generate ripper tags.
nnoremap <leader>sl O# frozen_string_literal: true<esc> " fix rubocop string literal error.
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ts :%s/\s\+$//<CR> " remove trailing whitespace.
nnoremap <leader>w :set nowrap!<CR> " no wrap.
nnoremap <silent>Y y$
nnoremap <silent>sp <C-w>s
nnoremap <silent>vs <C-w>v
nnoremap <silent>y. :1,.y<CR>
nnoremap <silent>ya :1,$y<CR>
""" Closing pane/window
nnoremap <leader>x :x<CR>
nnoremap <leader>q <C-w>q

"" Terminal mode
""" Enter
nnoremap st :sp<CR>:term<CR>A
nnoremap vt :vs<CR>:term<CR>A
""" Escape terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <Leader>x <C-\><C-n>:q!<CR>

"" Mapping to format JSON file
nnoremap <leader>jq :%!jq<CR>
vnoremap <leader>jq :!jq<CR>

"" Mapping to choose tab
nnoremap <D-1> 1gt
nnoremap <D-2> 2gt
nnoremap <D-3> 3gt
nnoremap <D-4> 4gt
nnoremap <D-5> 5gt
nnoremap <D-6> 6gt
nnoremap <D-7> 7gt
nnoremap <D-8> 8gt
nnoremap <D-9> :tablast<CR>

" Make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

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
"" Simple mappings for buffer switching.
""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>d :b *
nnoremap <Leader>ls :ls<CR>

""""""""""""""""""""""""""""""""""""""""
"" Vertical line selection
""""""""""""""""""""""""""""""""""""""""
nnoremap <expr> vm <SID>VisualVLine()
fun! s:VisualVLine() abort
  let [_, lnum, col; _] = getcurpos()
  let line = getline('.')
  let col += strdisplaywidth(line) - strwidth(line)

  let [from, to] = [lnum, lnum]
  while strdisplaywidth(getline(from - 1)) >= col
      let from -= 1
  endwhile

  while strdisplaywidth(getline(to + 1)) >= col
      let to += 1
  endwhile

  return "\<C-v>" .
              \ (to == lnum ? '' : (to - lnum . 'jo')) .
              \ (from == lnum ? '' : (lnum - from . 'k'))
endfun

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

"" Close the loclist/quickfix window automatically when the buffer is closed
augroup CloseLocQuickFixlistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | cclose | endif
augroup END

""""""""""""""""""""""""""""""""""""""""
"" Maximize split pane mapping
""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>z :MaximizerToggle<CR>
vnoremap <leader>z :MaximizerToggle<CR>gv
nnoremap <C-W>o :MaximizerToggle<CR>

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
