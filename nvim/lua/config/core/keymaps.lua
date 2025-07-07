vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true }) -- save buffer
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true }) -- exit buffer
vim.keymap.set("n", "<leader>s", ":wa<CR>", { noremap = true }) -- save all buffers
vim.keymap.set("n", "<leader>a", ":wa<CR>:qa<CR>", { noremap = true }) -- exit nvim (save and close all buffers)

-- pane navigation using ctrl and movement keys
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- automatically add closing ( { [ ' " `
local opts = { noremap = true, silent = true }
vim.keymap.set("i", "{", "{}<ESC>i", opts)
vim.keymap.set("i", "(", "()<ESC>i", opts)
vim.keymap.set("i", "[", "[]<ESC>i", opts)
vim.keymap.set("i", "`", "``<ESC>i", opts)
vim.keymap.set("i", '"', '""<ESC>i', opts)
