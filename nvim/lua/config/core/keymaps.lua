vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true }) -- save buffer
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true }) -- exit buffer
vim.keymap.set("n", "<leader>s", ":wa<CR>", { noremap = true }) -- save all buffers
vim.keymap.set("n", "<leader>a", ":qa<CR>", { noremap = true }) -- exit nvim (close all buffers)

-- pane navigation using ctrl and movement keys
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")

-- automatically add closing ( { [ ' " `
local opts = { noremap = true, silent = true }
vim.keymap.set("i", "{", "{}<ESC>i", opts)
vim.keymap.set("i", "(", "()<ESC>i", opts)
vim.keymap.set("i", "[", "[]<ESC>i", opts)
vim.keymap.set("i", "'", "''<ESC>i", opts)
vim.keymap.set("i", "`", "``<ESC>i", opts)
vim.keymap.set("i", '"', '""<ESC>i', opts)
