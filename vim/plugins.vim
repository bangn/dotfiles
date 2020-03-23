""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/bundle')

Plug 'aklt/plantuml-syntax'
Plug 'altercation/vim-colors-solarized'
Plug 'chreekat/vim-paren-crosshairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'eagletmt/neco-ghc'
Plug 'fatih/vim-go'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " Vim in firefox textarea
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/vim-sqlfmt'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mzlogin/vim-markdown-toc'
Plug 'neovimhaskell/haskell-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'romainl/vim-cool'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'SirVer/ultisnips'
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
Plug 'Yggdroot/indentLine'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

call plug#end()

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

"""""""""""""""""""""""""""""""""""""""""
" Lightline
"""""""""""""""""""""""""""""""""""""""""
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
nnoremap <Leader>sf :SQLFmt<CR>

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

" vi: ft=vim
