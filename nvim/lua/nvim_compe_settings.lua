local cmd = vim.cmd;
local api = vim.api;
local options = vim.o;

options.completeopt = 'menu,menuone,noselect';

local opts = { noremap=true, silent=true, expr=true };

api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', opts);
api.nvim_set_keymap('i', '<C-y>', 'compe#confirm("<C-y>")', opts);
api.nvim_set_keymap('i', '<C-e>', 'compe#close("<C-e>")', opts);

require('compe').setup({
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'disable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    path = true;
    vsnip = true;
    treesitter = true;
  };
});
