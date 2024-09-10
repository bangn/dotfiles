local vars = require("utils.vars")

if not vim.g.vscode then
    vars.remap.fn("n", "<leader>vs", "<C-w>v", { noremap = true })
    vars.remap.fn("n", "<leader>sp", "<C-w>s", { noremap = true })
    vars.remap.fn("n", "<leader>x", ":x<CR>", { noremap = true })
end

vars.remap.fn("n", "<leader><space>", "@q", { noremap = true })
vars.remap.fn("n", "<leader>co", "<C-w><C-o>", { noremap = true })
vars.remap.fn("n", "<leader>ct", ":!ctags -R .<CR>", { noremap = true })
vars.remap.fn("n", "<leader>ep", "<C-w>=", { noremap = true })
vars.remap.fn("n", "<leader>ev", ":vsplit $MYVIMRC<CR>", { noremap = true })
vars.remap.fn("n", "<leader>fn", ':let @+=expand("%:p")<CR>', { noremap = true })
vars.remap.fn("n", "<leader>jq", ":%!jq<CR>", { noremap = true })
vars.remap.fn("n", "<leader>q", "<C-w>q", vars.remap.opts)
vars.remap.fn("n", "<leader>rd", ":syntax sync fromstart<CR>:redraw!<CR>", { noremap = true })
vars.remap.fn("n", "<leader>rn", ":set relativenumber!<CR>", { noremap = true })
vars.remap.fn("n", "<leader>rt", ':!ripper-tags -R .<CR> " generate ripper tags.', vars.remap.opts)
vars.remap.fn("n", "<leader>st", ":sp<CR>:term<CR>A", { noremap = true })
vars.remap.fn("n", "<leader>sv", ":source $MYVIMRC<CR>", { noremap = true })
vars.remap.fn("n", "<leader>ts", ":%s/s+$//<CR>", { noremap = true })
vars.remap.fn("n", "<leader>vt", ":vs<CR>:term<CR>A", { noremap = true })
vars.remap.fn("n", "<leader>w", ":set nowrap!<CR>", { noremap = true })
vars.remap.fn("n", "<leader>y.", ":1,.y<CR>", { noremap = true })
vars.remap.fn("n", "<leader>ya", ":1,$y<CR>", { noremap = true })
vars.remap.fn("n", "<Space>", ":", { noremap = true })
vars.remap.fn("n", "gs", ":set opfunc=SortLines<CR>g@", {})
vars.remap.fn("v", "<", "<gv", {})
vars.remap.fn("v", "<leader>jq", ":!jq<CR>", {})
vars.remap.fn("v", "<Space>", ":", { noremap = true })
vars.remap.fn("v", ">", ">gv", {})
vars.remap.fn("x", "gs", ":sort i<CR>", {})

-- make n always search forward and N backward
vars.remap.fn("n", "<expr>", "n 'Nn'[v:searchforward]", {})
vars.remap.fn("n", "<expr>", "N 'nN'[v:searchforward]", {})

-- cd to current buffer
vars.remap.fn("n", "cm", ":tcd %:p:h<cr>:pwd<cr>", {})

-- terminal mappings
vars.remap.fn("t", "<Esc>", "<C-\\><C-n>", vars.remap.opts)
vars.remap.fn("t", "<leader>x", "<C-\\><C-n>:q!<CR>", vars.remap.opts)

-- CTRL-U, CTRL-W in insert mode deletes a lot. Put an undo-point before it.
vars.remap.fn("i", "<C-u>", "<C-g>u<C-u>", vars.remap.opts)
vars.remap.fn("i", "<C-w>", "<C-g>u<C-w>", vars.remap.opts)

-- tabs
vars.remap.fn("n", "<C-t>", ":tabnew<CR>", { noremap = true })
vars.remap.fn("n", "gl", "gt", { noremap = true })
vars.remap.fn("n", "gh", "gT", { noremap = true })

vars.remap.fn("n", "g1", " 1gt", { noremap = true })
vars.remap.fn("n", "g2", " 2gt", { noremap = true })
vars.remap.fn("n", "g3", " 3gt", { noremap = true })
vars.remap.fn("n", "g4", " 4gt", { noremap = true })
vars.remap.fn("n", "g5", " 5gt", { noremap = true })
vars.remap.fn("n", "g6", " 6gt", { noremap = true })
vars.remap.fn("n", "g7", " 7gt", { noremap = true })
vars.remap.fn("n", "g8", " 8gt", { noremap = true })
vars.remap.fn("n", "g9", " 9gt", { noremap = true })
vars.remap.fn("n", "g0", " 10gt", { noremap = true })

-- commenting
vars.remap.fn("n", "<leader>cc", "gcc", {})
vars.remap.fn("v", "<leader>cc", "gcc", {})
