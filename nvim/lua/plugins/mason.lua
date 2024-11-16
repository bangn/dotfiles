return {
  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "prettier",
        "prettierd",
<<<<<<< HEAD
        "vale",
||||||| parent of 47a5d2e (nvim: Update lazyvim config)
=======
        "ruff",
        "shellcheck",
        "shfmt",
        "stylua",
>>>>>>> 47a5d2e (nvim: Update lazyvim config)
      },
    },
  },
}
