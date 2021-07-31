require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "css",
    "go",
    "haskell",
    "html",
    "javascript",
    "json",
    "jsonc",
    "lua",
    "nix",
    "ruby",
    "toml",
    "tsx",
    "typescript",
    "yaml",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = false,
  },

  textobjects = {
    select = {
      enable = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },

    move = {
      enable = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}

-- https://github.com/nvim-treesitter/nvim-treesitter/issues/78
-- Remove after upstream issue fixed
require "nvim-treesitter.highlight"
local hlmap = vim.treesitter.highlighter.hl_map
hlmap.error = "Normal"
