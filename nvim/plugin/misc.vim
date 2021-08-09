""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings have not been migrated yet
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set iskeyword+=-

augroup autosave
  autocmd BufLeave,FocusLost * silent! wall " autosave.
augroup END

augroup CloseLocQuickFixlistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | cclose | endif
augroup END

function! SortLines(type) abort
  '[,']sort i
endfunction

let g:markers = split('.git .hg .svn .project .idea manage.py pom.xml')
function! s:CdToRepoRoot() abort
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
nnoremap cu :call <SID>CdToRepoRoot()<CR>

augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file !~# '\v^\w+\:\/'
    call mkdir(fnamemodify(a:file, ':h'), 'p')
  endif
endfun

""""""""""""""""""""""""""""""""""""""""
" plantuml-syntax
""""""""""""""""""""""""""""""""""""""""
let g:loaded_plantuml_plugin = 1
if !exists("g:plantuml_executable_script")
  let g:plantuml_executable_script='plantuml'
endif
let s:makecommand=g:plantuml_executable_script." %"
" define a sensible makeprg for plantuml files
autocmd Filetype plantuml let &l:makeprg=s:makecommand
nnoremap <leader>pu :w<CR> :silent make<CR>

""""""""""""""""""""""""""""""""""""""""
" wilder.nvim
""""""""""""""""""""""""""""""""""""""""
call wilder#enable_cmdline_enter()
set wildcharm=<Tab>
cmap <expr> <C-n> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <C-p> wilder#in_context() ? wilder#previous() : "\<S-Tab>"
" only / and ? are enabled by default
call wilder#set_option('modes', ['/', '?', ':'])

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     [
      \       wilder#check({_, x -> empty(x)}),
      \       wilder#history(),
      \       wilder#result({
      \         'draw': [{_, x -> ' ' . x}],
      \       }),
      \     ],
      \     wilder#python_file_finder_pipeline({
      \       'file_command': {_, arg -> stridx(arg, '.') != -1 ? ['fd', '-tf', '-H'] : ['fd', '-tf']},
      \       'dir_command': ['fdfind', '-td'],
      \       'filters': ['fuzzy_filter', 'difflib_sorter'],
      \       'cache_timestamp': {-> 1},
      \     }),
      \     wilder#cmdline_pipeline({
      \       'language': 'python',
      \       'fuzzy': 1,
      \       'set_pcre2_pattern': 0,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern({
      \         'start_at_boundary': 0,
      \       }),
      \       'sorter': wilder#python_difflib_sorter(),
      \       'engine': 're',
      \     }),
      \   ),
      \ ])

let s:highlighters = [
      \ wilder#lua_fzy_highlighter(),
      \ ]

call wilder#set_option('renderer', wilder#renderer_mux({
      \ ':': wilder#popupmenu_renderer({
      \   'highlighter': s:highlighters,
      \   'left': [
      \     wilder#popupmenu_devicons(),
      \   ],
      \   'right': [
      \     ' ',
      \     wilder#popupmenu_scrollbar(),
      \   ],
      \ }),
      \ '/': wilder#wildmenu_renderer({
      \   'highlighter': s:highlighters,
      \ }),
      \ }))
" vi: ft=vim
