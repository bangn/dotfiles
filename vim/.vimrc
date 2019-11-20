filetype off

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/bundle')

Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'aklt/plantuml-syntax'
Plug 'altercation/vim-colors-solarized'
Plug 'chreekat/vim-paren-crosshairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go'
Plug 'glacambre/firenvim', { 'do': function('firenvim#install(0)') } " Vim in firefox textarea
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/vim-sqlfmt'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mileszs/ack.vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'neovimhaskell/haskell-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Generic settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "," " remap leader to comma.
filetype indent plugin on
behave xterm

augroup autosave
  autocmd BufLeave,FocusLost * silent! wall " autosave.
augroup END

augroup autoSetTab
  autocmd FileType python setlocal tabstop=4|setlocal shiftwidth=4|setlocal expandtab
  autocmd FileType markdown setlocal conceallevel=0|setlocal expandtab|setlocal spell
  autocmd FileType text setlocal spell
augroup END

syntax on
set ai " auto indent.
set backspace=indent,eol,start " allow backspacing over everything in insert mode.
set colorcolumn=80
set cursorcolumn " highlight current column.
set cursorline " highlight current line.
set expandtab " use spaces instead of tabs.
set foldmethod=manual " fold manually
set foldnestmax=10 " deepest fold is 10 levels.
set hlsearch " highlight search.
set ignorecase " ignore case when searching.
set incsearch " incremental search.
set lazyredraw
set linebreak " wrap lines at convenient points.
set mouse=c " enable mouse use in command-line mode.
set nobackup
set nofoldenable " dont fold by default.
set nowrap " wrapping preferences.
set nu " set number.
set ruler " show current position.
set scrolloff=3 " always keep N lines above or below cursor.
set shiftwidth=2
set showcmd " display incomplete commands.
set showmode " show current mode.
set smartcase " be smart when searching.
set smarttab
set softtabstop=2
set synmaxcol=160
set t_Co=256 " tell the term has 256 colors.
set tabstop=2
set textwidth=80
set ttyfast " improve smoothness of redrawing.
if !has('nvim')
  set ttymouse=xterm2 " enable mouse mode.
endif
"backup and undo dir
set backupdir=~/.vim/bakup
set dir=~/.vim/swap
set undodir=~/.vim/undo
set undofile
set undolevels=1000 " how many undos
set undoreload=10000 " number of lines to save for undo
"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set clipboard=unnamedplus " exchange clipboard
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
let g:rubycomplete_rails = 1
set autoread " set to auto read when a file is changed from the outside
set iskeyword+=- " treat words with dash as a word.
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
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

""""""""""""""""""""""""""""""""""""""""
" Mapping
""""""""""""""""""""""""""""""""""""""""
nnoremap - orequire 'pry'; binding.pry<esc> " insert binding.pry after current line.
nnoremap <C-e> <C-w>= " make all panes equal size.

nnoremap <leader><space> @q " run macro q
nnoremap <leader>co <C-w><C-o> " close other opened panes.
nnoremap <leader>ct :!ctags -R .<CR> " generate ctags
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>pt :setlocal paste!<CR> " toggle paste mode on/off.
nnoremap <leader>rd :syntax sync fromstart<CR>:redraw!<CR>
nnoremap <leader>rt :!ripper-tags -R .<CR> " generate ripper tags.
nnoremap <leader>sl O# frozen_string_literal: true<esc> " fix rubocop string literal error.
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ts :%s/\s\+$//<CR> " remove trailing whitespace.
nnoremap <leader>w :set nowrap!<CR> " no wrap.

""" Closing pane/window
nnoremap <leader>x :x<CR>
nnoremap <leader>q <C-w>q

""" Folding
nnoremap <leader>f $zf%

"" Terminal mode
""" Enter
nnoremap st :sp<CR>:term<CR>A
nnoremap vt :vs<CR>:term<CR>A
""" Escape terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <Leader>x <C-\><C-n>:q!<CR>

nnoremap <silent> sp <C-w>s
nnoremap <silent> vs <C-w>v

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

nnoremap <Leader>rf :checktime<CR> " Refresh all buffers

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden        = 1
let g:NERDTreeMapOpenSplit    = 's'
let g:NERDTreeMapOpenVSplit   = 'v'
let g:NERDSpaceDelims         = 1 " add spaces after comment delimiters by default.
let g:NERDTreeShowLineNumbers = 1
nnoremap <Leader>nt :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""
noremap <c-p> :FZF<CR>

""""""""""""""""""""""""""""""""""""""""
" Use ag with ack.vim
""""""""""""""""""""""""""""""""""""""""
cnoreabbrev Ack Ack! " Dont jump to the first result.
nnoremap <Leader>ag :Ack!<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"

""""""""""""""""""""""""""""""""""""""""
" Lightline
""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
\ 'colorscheme': 'solarized',
\ 'active': {
\   'left': [['mode', 'paste'], [ 'gitbranch', 'readonly', 'filename', 'modified' ]],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ 'component_function': {
\   'gitbranch': 'fugitive#head',
\   'filename': 'FilenameForLightline'
\ },
\ }

"" Show full path of filename
function! FilenameForLightline()
  return expand('%F')
endfunction

""""""""""""""""""""""""""""""""""""""""
" ALE linters
""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'sh': ['shellcheck'],
\   'ruby': ['rubocop', 'rufo', 'standardrb'],
\   'elixir': ['credo'],
\   'haskell': ['hlint'],
\}
let g:ale_pattern_options = {
\   '.*\.erb$': {'ale_enabled': 0},
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier-eslint'],
\   'typescript': ['prettier-eslint'],
\   'sh': ['shfmt'],
\   'haskell': ['brittany', 'floskell', 'stylish-haskell'],
\   'ruby': ['rufo', 'standardrb', 'rubocop'],
\}
let g:ale_completion_enabled             = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_echo_msg_format                = '[%linter%] %s'
let g:ale_fix_on_save                    = 1
let g:ale_keep_list_window_open          = 0 " do not keep list if there is no error/warning
let g:ale_lint_on_enter                  = 0 " don't want linters to run on opening a file
let g:ale_lint_on_save                   = 1
let g:ale_lint_on_text_changed           = 'never'
let g:ale_open_list                      = 'on_save'
let g:ale_set_highlights                 = 1
let g:ale_set_loclist                    = 0
let g:ale_set_quickfix                   = 1
let g:ale_sh_shfmt_options               = '-i 2 -ci'
let g:ale_sign_error                     = '⤫'
let g:ale_sign_warning                   = '⚠'
nmap <silent> <leader>al :ALEToggle<CR>
nmap <silent> <leader>af :ALEFix<CR>

"" Close the loclist/quickfix window automatically when the buffer is closed
augroup CloseLocQuickFixlistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | cclose | endif
augroup END

"" For haskell
function! CheckIfFileExists(filename)
  if filereadable(a:filename)
    return 1
  endif

  return 0
endfunction

""""""""""""""""""""""""""""""""""""""""
" ESlint for react
""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:javascript_plugin_flow = 1

""""""""""""""""""""""""""""""""""""""""
" Solarized colors
""""""""""""""""""""""""""""""""""""""""
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast   = "high"
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""
" vim-test
""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>c :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
if has('nvim')
  let test#strategy = "neovim"
elseif has("gui_macvim")
  let test#strategy = "iterm"
end
let test#python#runner = 'pytest'

""""""""""""""""""""""""""""""""""""""""
" deoplete
""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#num_processes = 1

""""""""""""""""""""""""""""""""""""""""
" vim-commentary
""""""""""""""""""""""""""""""""""""""""
nmap <Leader>cc gcc
vmap <Leader>cc gcc

""""""""""""""""""""""""""""""""""""""""
" vim-fugitive mappings
""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>fo :foldopen<CR>
nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gps :!git push<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gdm :Gdiff origin/master<CR>

""""""""""""""""""""""""""""""""""""""""
" vim-go
""""""""""""""""""""""""""""""""""""""""
let g:go_auto_type_info              = 0
let g:go_code_completion_enabled     = 1
let g:go_disable_autoinstall         = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types       = 1
let g:go_highlight_fields            = 1
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_operators         = 1
let g:go_highlight_structs           = 1
let g:go_highlight_types             = 1

"" For Test
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gt :GoTest -short<CR>

"" indentation
au FileType go setlocal noexpandtab
au FileType go setlocal shiftwidth=4
au FileType go setlocal softtabstop=4
au FileType go setlocal tabstop=4

"" Do not set list for go type.
"" As it will display big red block before any indented line.
au FileType go setlocal nolist

""""""""""""""""""""""""""""""""""""""""
" vim haskell
""""""""""""""""""""""""""""""""""""""""
"" Disable haskell-vim omnifunc
augroup haskell
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc "Use neco-ghc for completion
augroup END
let g:haskellmode_completion_ghc = 0
let g:necoghc_use_stack          = 1
let g:ycm_semantic_triggers      = {'haskell' : ['.']}
"" haskell-vim
let g:haskell_enable_quantification   = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo      = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax      = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles        = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers  = 1  " to enable highlighting of `static`
let g:haskell_backpack                = 1                " to enable highlighting of backpack keywords

""""""""""""""""""""""""""""""""""""""""
" vim snippets
""""""""""""""""""""""""""""""""""""""""
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

""""""""""""""""""""""""""""""""""""""""
" neosnippet
""""""""""""""""""""""""""""""""""""""""
"" Plugin key-mappings.
"" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-c> <Plug>(neosnippet_expand_or_jump)
smap <C-c> <Plug>(neosnippet_expand_or_jump)
xmap <C-c> <Plug>(neosnippet_expand_target)

"" SuperTab like snippets behavior.
"" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
""imap <expr><TAB>
"" \ pumvisible() ? "\<C-n>" :
"" \ neosnippet#expandable_or_jumpable() ?
"" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

""""""""""""""""""""""""""""""""""""""""
" markdown-preview
""""""""""""""""""""""""""""""""""""""""
nmap <C-m> <Plug>MarkdownPreview
let g:mkdp_port = '9999'

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

""""""""""""""""""""""""""""""""""""""""
" vim-gutentags
""""""""""""""""""""""""""""""""""""""""
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_generate_on_missing      = 1
let g:gutentags_generate_on_new          = 1
let g:gutentags_generate_on_write        = 1

""""""""""""""""""""""""""""""""""""""""
" plantuml-syntax
""""""""""""""""""""""""""""""""""""""""
if exists("g:loaded_plantuml_plugin")
  finish
endif
let g:loaded_plantuml_plugin = 1

if !exists("g:plantuml_executable_script")
  let g:plantuml_executable_script='java -jar /home/bangn/sources/planuml-jar/plantuml.jar'
endif
let s:makecommand=g:plantuml_executable_script." %"

nnoremap <Leader>pu :w<CR> :silent make<CR>

" define a sensible makeprg for plantuml files
autocmd Filetype plantuml let &l:makeprg=s:makecommand

""""""""""""""""""""""""""""""""""""""""
" vim-sqlfmt
""""""""""""""""""""""""""""""""""""""""
let g:sqlfmt_command = "sqlformat"
let g:sqlfmt_options = "-r -k upper"
let g:sqlfmt_auto    = 1
nnoremap <Leader>sqlf :SQLFmt<CR>

""""""""""""""""""""""""""""""""""""""""
" Yggdroot/indentLine
""""""""""""""""""""""""""""""""""""""""
let g:indentLine_faster     = 1
let g:indentLine_setConceal = 0


""""""""""""""""""""""""""""""""""""""""
" glacambre/firenvim
""""""""""""""""""""""""""""""""""""""""
let g:firenvim_config = {
    \ 'localSettings': {
        \ '.*': {
            \ 'selector': 'textarea,input[type="text"]',
            \ 'priority': 0,
        \ }
    \ }
\ }

""""""""""""""""""""""""""""""""""""""""
" junegunn/goyo
""""""""""""""""""""""""""""""""""""""""
nmap <leader>yo :Goyo 100<CR>
nmap <leader>yf :Goyo!<CR>

function! s:goyoEnter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  setlocal number
  setlocal noshowmode
  setlocal noshowcmd
  setlocal scrolloff=999
  Limelight
endfunction

function! s:goyoLeave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  setlocal showmode
  setlocal showcmd
  setlocal scrolloff=5
  Limelight!
endfunction

augroup Goyo
  autocmd! User GoyoEnter nested call <SID>goyoEnter()
  autocmd! User GoyoLeave nested call <SID>goyoLeave()
augroup END

""""""""""""""""""""""""""""""""""""""""
" junegunn/limelight
""""""""""""""""""""""""""""""""""""""""
nmap <leader>jl :Limelight<CR>
nmap <leader>jlo :Limelight!<CR>
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert line number
com! -range InsertLineNumber <line1>,<line2>!nl -s '. ' -w 1
""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
