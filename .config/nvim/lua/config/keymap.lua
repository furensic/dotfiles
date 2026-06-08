local map = vim.keymap.set

map("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
map("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
map("n", "<leader>gd", vim.lsp.buf.definition)
map("n", "<leader>gD", vim.lsp.buf.declaration)

map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")

map("n", "<leader>bc", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
