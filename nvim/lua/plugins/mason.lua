return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettier",
        "prettierd",
        "vale",
      },
    },
  },
}
