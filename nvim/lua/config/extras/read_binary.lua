-- Open binary files
vim.api.nvim_create_autocmd("BufReadCmd", {
	pattern = "*.pdf",
	callback = function()
		local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
		vim.cmd("!open " .. filename .. " &")

		-- prevent binary file from opening
		local current_buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_delete(current_buf, { force = true })
	end,
})
