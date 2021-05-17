"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatic install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/bundle')

Plug 'aklt/plantuml-syntax'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dln/avro-vim'
Plug 'fatih/vim-go'
Plug 'folke/zen-mode.nvim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " Vim in firefox textarea
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
Plug 'mcchrish/nnn.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mzlogin/vim-markdown-toc'
Plug 'neovimhaskell/haskell-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvim-lua/plenary.nvim'
Plug 'romainl/vim-cool'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'sindrets/diffview.nvim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'wsdjeg/vim-fetch'

""""""""""""""""""""
" nvim-lsp
""""""""""""""""""""
Plug 'anott03/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

""""""""""""""""""""
" snippets
""""""""""""""""""""
Plug 'andys8/vscode-jest-snippets'
Plug 'Chris56974/ruby-and-rails-snippets'
Plug 'karuna/vscode-rspec-snippets'
Plug 'leventebalogh/vscode-snippet-console-log'
Plug 'magicwhite/ruby-snippet'
Plug 'xabikos/vscode-javascript'

call plug#end()

""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
nnoremap <leader>bf :Buffers<CR>
nnoremap <leader>rg :Rg
noremap <c-p> :FZF<CR>

""""""""""""""""""""""""""""""""""""""""
" Nord color
""""""""""""""""""""""""""""""""""""""""
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_diff_background = 1
let g:nord_uniform_status_lines = 1

set background=dark
colorscheme nord
set termguicolors

"""""""""""""""""""""""""""""""""""""""""
" Lightline
"""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
\ 'colorscheme': 'nord',
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

function! FilenameForLightline()
  return expand('%:pF')
endfunction

""""""""""""""""""""""""""""""""""""""""
" ALE linters
""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'sh': ['shellcheck'],
\   'ruby': ['rubocop', 'rufo'],
\   'elixir': ['credo'],
\   'haskell': ['hlint'],
\}
let g:ale_pattern_options = {
\   '.*\.erb$': {'ale_enabled': 0},
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'haskell': ['brittany', 'floskell', 'stylish-haskell'],
\   'javascript': ['prettier', 'eslint', 'prettier-eslint'],
\   'javascriptreact': ['prettier', 'eslint', 'prettier-eslint'],
\   'nix': ['nixpkgs-fmt'],
\   'ruby': ['rufo', 'rubocop'],
\   'sh': ['shfmt'],
\   'sql': ['sqlformat'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\}

let g:ale_completion_enabled    = 0
let g:ale_disable_lsp           = 1
let g:ale_echo_msg_error_str    = 'E'
let g:ale_echo_msg_warning_str  = 'W'
let g:ale_echo_msg_format       = '[%linter%][%code%] %s'
let g:ale_fix_on_save           = 1
let g:ale_keep_list_window_open = 0 " do not keep list if there is no error/warning
let g:ale_lint_on_enter         = 0 " don't want linters to run on opening a file
let g:ale_lint_on_save          = 1
let g:ale_lint_on_text_changed  = 'never'
let g:ale_open_list             = 'on_save'
let g:ale_set_highlights        = 1
let g:ale_set_loclist           = 0
let g:ale_set_quickfix          = 1
let g:ale_sh_shfmt_options      = '-i 2 -ci'
let g:ale_sign_error            = '⤫'
let g:ale_sign_warning          = '⚠'

" sqlformat options
let g:ale_sql_sqlformat_options = '-r -k upper'
nmap <silent> <leader>al :ALEToggle<CR>
nmap <silent> <leader>af :ALEFix<CR>

""""""""""""""""""""""""""""""""""""""""
" ESlint for react
""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:javascript_plugin_flow = 1

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

""""""""""""""""""""""""""""""""""""""""
" vim-commentary
""""""""""""""""""""""""""""""""""""""""
nmap <leader>cc gcc
vmap <leader>cc gcc

""""""""""""""""""""""""""""""""""""""""
" vim-fugitive mappings
""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gps :!git push<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gdm :Gdiff origin/master<CR>

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
let g:haskellmode_completion_ghc      = 0
let g:haskell_enable_quantification   = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo      = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax      = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles        = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers  = 1  " to enable highlighting of `static`
let g:haskell_backpack                = 1                " to enable highlighting of backpack keywords

""""""""""""""""""""""""""""""""""""""""
" markdown-preview
""""""""""""""""""""""""""""""""""""""""
nmap <leader>mp <Plug>MarkdownPreview
let g:mkdp_port = '9999'

""""""""""""""""""""""""""""""""""""""""
" plantuml-syntax
""""""""""""""""""""""""""""""""""""""""
if exists("g:loaded_plantuml_plugin")
  finish
endif
let g:loaded_plantuml_plugin = 1

if !exists("g:plantuml_executable_script")
  let g:plantuml_executable_script='plantuml'
endif
let s:makecommand=g:plantuml_executable_script." %"

nnoremap <leader>pu :w<CR> :silent make<CR>

" define a sensible makeprg for plantuml files
autocmd Filetype plantuml let &l:makeprg=s:makecommand

""""""""""""""""""""""""""""""""""""""""
" glacambre/firenvim
""""""""""""""""""""""""""""""""""""""""
let g:firenvim_config = {
    \ 'localSettings': {
        \ '.*': {
            \ 'selector': 'textarea',
            \ 'priority': 0,
        \ }
    \ }
\ }
if exists('g:started_by_firenvim')
  setlocal laststatus=0
  setlocal noruler
  setlocal noshowcmd
endif

""""""""""""""""""""""""""""""""""""""""
" nnn.vim
""""""""""""""""""""""""""""""""""""""""
let g:nnn#set_default_mappings = 0
nnoremap <silent> <leader>nn :NnnPicker<CR>

let g:nnn#command='nnn -H'
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#action = {
  \ '<c-x>': 'split',
  \ '<c-v>': 'vsplit',
\}

""""""""""""""""""""""""""""""""""""""""
" hashivim/vim-terraform
""""""""""""""""""""""""""""""""""""""""
let g:terraform_align=1
let g:terraform_fmt_on_save=1

""""""""""""""""""""""""""""""""""""""""
" vim-vsnip
""""""""""""""""""""""""""""""""""""""""
let g:vsnip_snippet_dir = "~/dotfiles/nvim/vsnip"
imap <expr> <C-j> vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"
imap <expr> <C-k> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<C-k>"

""""""""""""""""""""""""""""""""""""""""
" lua
""""""""""""""""""""""""""""""""""""""""
lua << EOF
  require('diffview_settings');
  require('gitsigns_settings');
  require('indent_blankline_settings');
  require('nvim_compe_settings');
  require('nvim_lsp_handler');
  require('nvim_lsp_settings');
  require('nvim_tree_settings');
  require('nvim_treesitter_settings');
  require('zen_mode_settings');
EOF

" vi: ft=vim
