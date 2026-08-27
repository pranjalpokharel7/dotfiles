local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		go = { "gofmt" },

		-- stop_after_first == run the first formatter which is available
		-- prettier picks up the project's .prettierrc automatically
		html = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		scss = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		jsonc = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", stop_after_first = true },
		markdown = { "prettierd", "prettier", stop_after_first = true },
		graphql = { "prettierd", "prettier", stop_after_first = true },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },

		python = function(bufnr)
			if conform.get_formatter_info("ruff_format", bufnr).available then
				return { "isort", "ruff_format", "docformatter" }
			else
				return { "isort", "black", "docformatter" } -- runs the formatters sequentially
			end
		end,

		-- NOTE: conform formatter entries are *names*, not shell strings -- the old
		-- `"codespell --ignore-words .codespellignore"` entry errored on every format.
		-- To re-enable codespell, register it as a custom formatter under `formatters`.
		-- ["*"] = { "codespell" },
		["_"] = { "trim_whitespace" },
	},

	-- Keep fallback to LSP formatting if no formatter is defined
	default_format_opts = {
		timeout_ms = 3000,
		async = false,
		quiet = false,
		lsp_format = "fallback",
	},

	-- Uncomment if you want format on save, I disable it because it makes saving files slow
	-- format_on_save = {
	--   lsp_format = "fallback",
	--   timeout_ms = 500,
	-- },

	-- Log only errors, and notify about issues
	log_level = vim.log.levels.ERROR,
	notify_on_error = true,
	notify_no_formatters = true,
})

-- keybindings
vim.keymap.set("n", "<leader>i", function()
	conform.format({ lsp_format = "fallback" })
end, { desc = "Format current buffer" })
