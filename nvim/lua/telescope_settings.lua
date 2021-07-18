local api = vim.api;
local cmd = vim.cmd;
local map_opts = { noremap=true };

api.nvim_set_keymap('n', '<leader>fbc', '<cmd>lua require("telescope.builtin").git_bcommits()<cr>', map_opts);
api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', map_opts);
api.nvim_set_keymap('n', '<leader>fgb', '<cmd>lua require("telescope.builtin").git_branches()<cr>', map_opts);
api.nvim_set_keymap('n', '<leader>fgc', '<cmd>lua require("telescope.builtin").git_commits()<cr>', map_opts);
api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").oldfiles()<cr>', map_opts);
api.nvim_set_keymap('n', '<leader>flbd', '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>', map_opts)
api.nvim_set_keymap('n', '<leader>flca', '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>', map_opts);
api.nvim_set_keymap('n', '<leader>fld', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', map_opts)
api.nvim_set_keymap('n', '<leader>flg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', map_opts);
api.nvim_set_keymap('n', '<leader>fli', '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>', map_opts);
api.nvim_set_keymap('n', '<leader>flr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', map_opts)
api.nvim_set_keymap('n', '<leader>flwd', '<cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<cr>', map_opts)
api.nvim_set_keymap('n', '<leader>fm', '<cmd>lua require("telescope.builtin").keymaps()<cr>', map_opts);
api.nvim_set_keymap('n', '<leader>fsb', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', map_opts);
api.nvim_set_keymap('n', '<leader>fsc', '<cmd>lua require("telescope.builtin").command_history()<cr>', map_opts);
api.nvim_set_keymap('n', '<leader>fsh', '<cmd>lua require("telescope.builtin").search_history()<cr>', map_opts);
api.nvim_set_keymap('n', '<leader>fso', '<cmd>lua require("telescope.builtin").live_grep({grep_open_files = true})<cr>', map_opts);
api.nvim_set_keymap('n', '<leader>fsp', '<cmd>lua require("telescope.builtin").spell_suggest()<cr>', map_opts);
api.nvim_set_keymap('v', '<leader>flca', '<cmd>lua require("telescope.builtin").lsp_range_code_actions()<cr>', map_opts);

require('telescope').setup({
  defaults = {
    extensions = {},
    vimgrep_arguments = {
      'rg',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    scroll_strategy = 'cycle',
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new
  }
})
