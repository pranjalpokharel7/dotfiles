vim.g.mapleader = ' ' 

vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>') -- select all text in the current buffer

-- clipboard
vim.keymap.set({'n', 'x'}, '<leader>y', '"+y') -- copy to clipboard using leader + y
vim.keymap.set({'n', 'x'}, '<leader>p', '"+p') -- pase from clipboard using leader + p

-- pane navigation using ctrl and movement keys
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
