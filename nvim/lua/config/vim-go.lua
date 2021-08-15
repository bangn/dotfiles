local vim_g = vim.g
local vim_cmd = vim.cmd

vim_g.go_auto_type_info = 0
vim_g.go_code_completion_enabled = 1
vim_g.go_disable_autoinstall = 0
vim_g.go_highlight_build_constraints = 1
vim_g.go_highlight_extra_types = 1
vim_g.go_highlight_fields = 1
vim_g.go_highlight_functions = 1
vim_g.go_highlight_methods = 1
vim_g.go_highlight_operators = 1
vim_g.go_highlight_structs = 1
vim_g.go_highlight_types = 1

-- For Test
vim_cmd([[
  au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
  au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
  au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
  au FileType go nmap <leader>gt :GoTest -short<CR>
]])

-- Indentation
vim_cmd([[
  au FileType go setlocal noexpandtab
  au FileType go setlocal shiftwidth=4
  au FileType go setlocal softtabstop=4
  au FileType go setlocal tabstop=4
]])

-- Do not set list for go type.
-- As it will display big red block before any indented line.
vim_cmd([[
  au FileType go setlocal nolist
]])
