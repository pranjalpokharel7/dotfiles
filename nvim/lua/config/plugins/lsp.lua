local servers = { "rust_analyzer", "clangd", "pyright", "gopls", "ts_ls" }

-- enable diagnostics
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
})

local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, silent = true }

	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>do",
		"<cmd>lua vim.diagnostic.open_float()<CR>",
		{ noremap = true, silent = true }
	)
end

for _, server in ipairs(servers) do
	if server == "pyright" then
		vim.lsp.config.pyright = {
			settings = {
				python = {
					pythonPath = ".venv/bin/python" -- since we are using uv for setting up venv
				}
			},
			on_attach = on_attach,
		}
	else
		vim.lsp.config(server, {
			on_attach = on_attach,
		})
	end
end

for _, server in ipairs(servers) do
	vim.lsp.enable(server)
end
