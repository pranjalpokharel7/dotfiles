vim.keymap.set("n", "<leader>e", vim.cmd.Ex) -- go to explorer
vim.keymap.set("n", "<leader>w", vim.cmd.write) -- save file 
vim.keymap.set("n", "<leader>q", vim.cmd.quit) -- quit file

-- pane navigation using ctrl and movement keys
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- automatically add closing ( { [ ' " `
local opts = { noremap = true, silent = true }
vim.keymap.set("i", "{", "{}<ESC>i", opts)
vim.keymap.set("i", "(", "()<ESC>i", opts)
vim.keymap.set("i", "[", "[]<ESC>i", opts)
vim.keymap.set("i", "'", "''<ESC>i", opts)
vim.keymap.set("i", "`", "``<ESC>i", opts)
vim.keymap.set("i", "\"", "\"\"<ESC>i", opts)

-- terminal openings
vim.keymap.set("n", "<leader>t", ":botright terminal<CR>", opts)
