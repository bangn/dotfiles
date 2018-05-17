"Plug settings
set nocompatible
filetype off

call plug#begin('~/.vim/bundle')

Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/vim-sqlfmt'
Plug 'mhinz/vim-mix-format'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'rewrite' }
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

call plug#end()
"End Plug` settings

"Generic settings
let mapleader = "," " remap leader to comma.
filetype indent plugin on
behave xterm
autocmd BufLeave,FocusLost * silent! wall " autosave.
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType markdown set tabstop=4|set shiftwidth=4|set expandtab|set spell
syntax on
set t_Co=256 " tell the term has 256 colors.
set showmode " show current mode.
set ruler " show current position.
set nowrap " wrapping preferences.
set linebreak " wrap lines at convenient points.
set textwidth=80
set nobackup
set ignorecase " ignore case when searching.
set scrolloff=3 " always keep N lines above or below cursor.
set cursorline " highlight current line.
set cursorcolumn " highlight current column.
set smartcase " be smart when searching.
set incsearch " incremental search.
set nu " set number.
set expandtab " use spaces insted of tabs.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set ai " auto indent.
set smarttab
set colorcolumn=80
set backspace=indent,eol,start " allow backspacing over everything in insert mode.
set hlsearch " highlight search.
set showcmd " display incomplete commands.
set foldmethod=manual " fold based on indent.
set foldnestmax=10 " deepest fold is 10 levels.
set nofoldenable " dont fold by default.
set mouse=a " enable mouse use in all modes.
set synmaxcol=80
set ttyfast " improve smoothness of redrawing.
set lazyredraw
set re=1
if !has('nvim')
  set ttymouse=xterm2 " enable mouse mode.
endif
"backup and undo dir
set backupdir=~/.vim/bakup
set undofile
set undolevels=1000 " how many undos
set undoreload=10000 " number of lines to save for undo
set undodir=~/.vim/undo
set dir=~/.vim/swap
"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set clipboard=unnamedplus " exchange clipboard
let g:rubycomplete_rails = 1
set autoread " set to auto read when a file is changed from the outside
set iskeyword+=- " treat words with dash as a word.
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif
"End Generic settings

"NerdTree settings
let NERDTreeShowHidden=1
let g:NERDTreeMapOpenSplit='s'
let g:NERDTreeMapOpenVSplit='v'
let g:NERDSpaceDelims = 1 " add spaces after comment delimiters by default.
let g:NERDTreeShowLineNumbers = 1
map <Leader>nt :NERDTreeToggle<CR>
"End NerdTree settings

"FZF settings
noremap <c-p> :FZF<CR>
"End FZF settings

"Use ag with ack.vim
cnoreabbrev Ack Ack! " Dont jump to the first result.
nnoremap <Leader>ag :Ack!<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"

"Do not display baloon evaluation
if has("gui_macvim")
  set noballooneval
  set balloonexpr=
endif
"End do not display baloon evaluation

"Powerline settings
set laststatus=2 " always display the statusline in all windows.
set encoding=utf8
if has("gui_running")
  set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular\ 12 " using Source Code Pro.
endif
set fillchars+=stl:\ ,stlnc:\
if !has('nvim') && !has("gui_macvim") && !has("gui_running")
  set term=xterm-256color
endif
set termencoding=utf-8
"End Powerline settings

" Lightline
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
\   'gitbranch': 'fugitive#head'
\ },
\ }
" End Lightline

" ALE linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'sh': ['shellcheck'],
\   'ruby': ['rubocop'],
\   'elixir': ['credo'],
\}
let g:ale_pattern_options = {
\   '.*\.json$': {'ale_enabled': 0},
\   '.*\.erb$': {'ale_enabled': 0},
\}
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'sh': ['shfmt'],
\   'haskell': ['hfmt'],
\}
let g:ale_open_list = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0 " don't want linters to run on opening a file
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_sh_shfmt_options = '-i 2 -ci'
nmap <silent> <leader>al :ALEToggle<CR>
nmap <silent> <leader>af :ALEFix<CR>
" End ALE linters

" ESlint for react settings
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:javascript_plugin_flow = 1
" End ESlint for react settings

" Solarized colors settings
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
"End Solarized colors settings

"vim-test settings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>c :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR><Paste>
if has('nvim')
  let test#strategy = "neovim"
  tmap <C-o> <C-\><C-n>
elseif has("gui_macvim")
  let test#strategy = "iterm"
end
let test#python#runner = 'pytest'
"End vim-test settings

"vim-rubocop settings
let g:vimrubocop_config = '~/.rubocop.yml'
let g:vimrubocop_keymap = 0
nmap <Leader>rc :RuboCop<CR>
"End vim-rubocop settings

"deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#num_processes = 1
"End deoplete settings

"vim-commentary mappings
map <Leader>cc gcc
"End vim-commentary mappings

"vim-fugitive mappings
map <Leader>gs :Gstatus<CR>
map <Leader>gd :Gvdiff<CR>
map <Leader>gw :Gwrite<CR>
map <Leader>gps :!git push<CR>
"End vim-fugitive mappings

"vim-go
let g:go_auto_type_info = 1
let g:go_disable_autoinstall = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

""For Test
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gt :GoTest -short<cr>
""End for Test

""indentation
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
""End indentation

"" Do not set list for go type.
"" As it will display big red block before any indented line.
au FileType go set nolist

"End vim-go

"Mapping
map <Leader><space> @q " run macro q
map - orequire 'pry'; binding.pry<esc> " insert binding.pry after current line.
map <Leader>rd :syntax sync fromstart<cr>:redraw!<cr>
map <C-e> <C-w>= " make all panes equal size.
map <leader>pt :setlocal paste!<cr> " toggle paste mode on/off.

nnoremap <leader>co <C-w><C-o> " close other opened panes.
nnoremap <leader>w :set nowrap!<cr> " no wrap.
nnoremap <leader>ts :%s/\s\+$//<cr> " remove trailing whitespace.
nnoremap <leader>rt :!ripper-tags -R .<cr> " generate ripper tags.
nnoremap <leader>ct :!ctags -R .<cr> " generate ctags
nnoremap <leader>sl O# frozen_string_literal: true<cr><esc> " fix rubocop string literal error.
nnoremap <leader>sq :!sqlfmt %

""Mapping to choose tab
nmap <D-1> 1gt
nmap <D-2> 2gt
nmap <D-3> 3gt
nmap <D-4> 4gt
nmap <D-5> 5gt
nmap <D-6> 6gt
nmap <D-7> 7gt
nmap <D-8> 8gt
nmap <D-9> :tablast<CR>
""End Mapping to choose tab

""Maximize split pane mapping
nnoremap <leader>z :MaximizerToggle<CR>
vnoremap <leader>z :MaximizerToggle<CR>gv
nnoremap <C-W>o :MaximizerToggle<CR>
""End Maximize split pane mapping

"Easy window navigation
if has('nvim')
  " Hack to get C-h working in NeoVim
  nmap <BS> <C-W>h
  " Or run below command in terminal
  " infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
  " tic $TERM.ti
endif
"End Easy window navigation

"Make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv
"End Make < > shifts keep selection

"Set file type to toml for .smithrc file
au BufRead,BufNewFile *.smithrc setfiletype toml
"End set file type to toml for .smithrc file

"Hack to fix exs file loading.
"Set file type to elixir for .exs file
au BufRead,BufNewFile *.exs setfiletype elixir
"End Set file type to elixir for .exs file

"Functions
"" Format JSON file
com! FormatJSON %!python -m json.tool
""

"" Insert line number
com! -range InsertLineNumber <line1>,<line2>!nl -s '. ' -w 1
""

"End Functions
