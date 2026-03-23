return {
  "barrettruth/preview.nvim",
  init = function()
    vim.g.preview = {
      typst = true,
      latex = true,
      github = { extra_args = { "--embed-resources", "--mathml" } },
      markdown = { extra_args = { "--embed-resources", "--mathml" } },
    }
  end,
}
