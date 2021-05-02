local api = vim.api;
local opts = { noremap=true, silent=true };

api.nvim_set_keymap('n', '<leader>dv', ':DiffviewOpen<CR>', opts);
api.nvim_set_keymap('n', '<leader>dc', ':DiffviewClose<CR>', opts);
