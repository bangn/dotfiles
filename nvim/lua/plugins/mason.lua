return {
  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "prettier",
        "prettierd",
        "vale",
      },
    },
  },
}
