-- this file includes configuration specific to markdown files i.e. for note taking

-- move visual lines instead of logical lines since we don't break lines in markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    local opts = { silent = true, buffer = true }
    vim.keymap.set("n", "j", "gj", opts)
    vim.keymap.set("n", "k", "gk", opts)
    vim.keymap.set("n", "<Down>", "gj", opts)
    vim.keymap.set("n", "<Up>", "gk", opts)
  end,
})
