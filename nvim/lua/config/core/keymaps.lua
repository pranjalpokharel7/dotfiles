vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true }) -- save buffer
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true }) -- close
vim.keymap.set("n", "<leader>s", ":wa<CR>", { noremap = true }) -- save all buffers
vim.keymap.set("n", "<c-e>", ":e<CR>", { noremap = true }) -- reload buffer from file

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

-- split
vim.keymap.set("n", "<c-\\>", ":vs<CR>")
vim.keymap.set("n", "<c-_>", ":sp<CR>")

-- remove trailing ^M characters (wsl2 problems)
vim.keymap.set("n", "<c-a>", ":%s/\\r$//g<CR>", { desc = "Remove trailing ^M characters" })

-- close the quickfix window
vim.keymap.set('n', '<c-p>', ':cclose<CR>', { desc = 'Close quickfix' })
