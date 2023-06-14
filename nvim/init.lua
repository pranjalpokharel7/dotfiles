vim.opt.number = true -- show line numbers
vim.relativenumber = true -- relative numbers

vim.opt.ignorecase = true -- ignore case while searching
vim.opt.smartcase = true -- but case will matter when you use upper case

vim.opt.mouse = 'a' -- use mouse (double click will select the word!)
vim.opt.hlsearch = false -- stop highlighting search results

vim.opt.wrap = true -- word wrap is activated
vim.opt.breakindent = true -- every wrapped line will be indented to remain consistent with the previous line's indentation

vim.opt.tabstop = 2 -- maximum space tab occupies, can experiment with 4
vim.opt.shiftwidth = 2 -- blank characters used to indent a line, eq to tabstop
vim.opt.expandtab = false -- do not convert tab character to spaces

vim.g.mapleader = ' ' -- experiment with space as map leader
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>') -- normal mode, leader + w -> save file
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>') -- normal mode, leader + q -> close file
vim.keymap.set({'n', 'x'}, '<leader>y', '"+y') -- copy to clipboard using leader + y in normal (n) and visual (x) mode
vim.keymap.set({'n', 'x'}, '<leader>p', '"+p') -- pase from clipboard using leader + p in normal (n) and visual (x) mode
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>') -- select all text in the current buffer using leader + a
