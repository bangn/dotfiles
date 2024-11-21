-- Hack to fix exs file loading.
-- Set file type to elixir for .exs file
vim.cmd([[autocmd BufRead,BufNewFile *.exs setfiletype elixir]])
