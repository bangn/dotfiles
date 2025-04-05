return {
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    keys = {},
    init = function()
      -- Install the conform formatter on VeryLazy
      LazyVim.on_very_lazy(function()
        LazyVim.format.register({
          name = "conform.nvim",
          priority = 100,
          primary = true,
          format = function(buf)
            require("conform").format({ bufnr = buf })
          end,
          sources = function(buf)
            local ret = require("conform").list_formatters(buf)
            ---@param v conform.FormatterInfo
            return vim.tbl_map(function(v)
              return v.name
            end, ret)
          end,
        })
      end)
    end,
    opts = function()
      ---@type conform.setupOpts
      local opts = {
        default_format_opts = {
          timeout_ms = 3000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
          lsp_format = "fallback", -- not recommended to change
        },
        formatters_by_ft = {
          ["*"] = { "trim_whitespace" },
          css = { "prettierd", "prettier" },
          go = { "gofmt" },
          haskell = { "stylish-haskell", "ormolu" },
          html = { "prettierd", "prettier" },
          javascript = { "prettierd", "prettier" },
          javascriptreact = { "prettierd", "prettier" },
          json = { "jq" },
          lua = { "stylua" },
          markdown = { "vale", "markdownlint-cli2" },
          nix = { "alejandra" },
          python = { "ruff" },
          ruby = { "rubocop" },
          rust = { "rustfmt" },
          scss = { "prettierd", "prettier" },
          sh = { "shfmt" },
          typescript = { "prettierd", "prettier" },
          typescriptreact = { "prettierd", "prettier" },
          yaml = { "prettierd", "prettier" },
        },
        -- The options you set here will be merged with the builtin formatters.
        -- You can also define any custom formatters here.
        ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
        formatters = {
          injected = { options = { ignore_errors = true } },
          stylua = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
          },
          prettier = {
            prepend_args = { "--print-width", "100" },
          },
          shfmt = {
            prepend_args = { "-i", "2", "-ci" },
          },
        },
      }
      return opts
    end,
  },
}
