-- mason installs lsp servers / formatters into stdpath("data")/mason/bin
-- and prepends that dir to vim.env.PATH, so conform & vim.lsp find them.
require("mason").setup()

require("mason-tool-installer").setup({
	ensure_installed = {
		-- node / web lsp
		"typescript-language-server", -- ts_ls: nest + next
		"eslint-lsp", -- eslint: inline lint diagnostics + code actions
		"html-lsp",
		"css-lsp",
		"json-lsp",
		"tailwindcss-language-server",
		"emmet-language-server",

		-- required by nvim-treesitter (main branch) to compile parsers
		"tree-sitter-cli",

		-- formatters
		"prettierd",
		"prettier",
	},

	-- install on startup if missing, but don't block or spam on every launch
	run_on_start = true,
	auto_update = false,
	start_delay = 3000,
})
