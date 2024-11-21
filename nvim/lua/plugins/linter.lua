return {
  "mfussenegger/nvim-lint",
  event = "LazyFile",
  opts = {
    events = { "BufWritePost", "InsertLeave" },
    linters_by_ft = {
      python = { "pylint", "ruff" },
      javascript = { "prettier", "eslint" },
      typescript = { "prettier", "eslint" },
      nix = { "nix" },
      ruby = { "rubocop" },
      kotlin = { "ktlint" },
      bash = { "shellcheck" },
      sh = { "shellcheck" },
      zsh = { "shellcheck" },
    },
  },
  config = function(_, opts)
    local Lint = require("lint")
    Lint.linters_by_ft = opts.linters_by_ft

    vim.api.nvim_create_autocmd(opts.events, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = function()
        Lint.try_lint()
      end,
    })
  end,
}
