local vars = require("utils.vars")

vars.remap.fn("n", "<leader>bp", "orequire 'pry'; binding.pry<esc>", { noremap = true })
vars.remap.fn("n", "<leader>sl", "O# frozen_string_literal: true<esc>", { noremap = true })
