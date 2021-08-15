local vim_g = vim.g
local vim_cmd = vim.cmd

vim_g.nord_cursor_line_number_background = 1
vim_g.nord_uniform_diff_background = 1
vim_g.nord_uniform_status_lines = 1

vim_cmd([[
  colorscheme nord
  set background=dark
  set termguicolors
]])
