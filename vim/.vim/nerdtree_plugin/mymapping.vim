function! NERDTreeCustomOpenDir(node)
  call a:node.activate()
endfunction
call NERDTreeAddKeyMap({'key': '<CR>', 'scope': 'DirNode', 'callback': 'NERDTreeCustomOpenDir', 'quickhelpText': 'open dir'})
