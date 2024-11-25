return {
  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    lazy = false,
    config = function()
      local wilder = require("wilder")
      local highlighters = {
        wilder.lua_fzy_highlighter(),
      }

      wilder.setup({
        modes = { ":", "/", "?" },
      })
      -- Add the keymaps for <C-n> and <C-p>
      vim.keymap.set("c", "<C-n>", function()
        return wilder.in_context() and wilder.next() or "<Tab>"
      end, { expr = true })

      vim.keymap.set("c", "<C-p>", function()
        return wilder.in_context() and wilder.previous() or "<S-Tab>"
      end, { expr = true })

      wilder.set_option("pipeline", {
        wilder.branch(
          wilder.python_file_finder_pipeline({
            file_command = { "fd", "-tf", "f", "-H" },
            dir_command = { "fd", "-td" },
            filters = { "fuzzy_filter", "difflib_sorter" },
          }),
          wilder.cmdline_pipeline({
            language = "python",
            -- 0 turns off fuzzy matching
            -- 1 turns on fuzzy matching
            -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
            fuzzy = 1,
            set_pcre2_pattern = 0,
          }),
          wilder.python_search_pipeline({
            pattern = wilder.python_fuzzy_pattern(),
            sorter = wilder.python_difflib_sorter(),
            engine = "re",
          })
        ),
      })

      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
          max_height = "75%", -- max height of the palette
          min_height = 0, -- set to the same as 'max_height' for a fixed height window
          prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
          reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
          highlighter = highlighters,
          left = { " ", wilder.popupmenu_devicons() },
          right = { " ", wilder.popupmenu_scrollbar() },
        }))
      )
    end,

    build = ":UpdateRemotePlugins",
    dependencies = {
      "romgrk/fzy-lua-native", -- Optional: for better fuzzy matching
    },
  },
  -- Disable noice.nvim's cmdline
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.cmdline = {
        enabled = false, -- disable noice cmdline
      }
      return opts
    end,
  },
}
