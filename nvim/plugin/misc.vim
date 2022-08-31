""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings have not been migrated yet
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" vi: ft=vim