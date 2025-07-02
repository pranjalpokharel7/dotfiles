local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    rust = { "rustfmt" },

		-- web dev shit
		html = { "prettierd", "prettier" },
  	css = { "prettierd" , "prettier" },
  	javascript = { "prettierd", "prettier" },
  	typescript = { "prettierd", "prettier" },

    python = function(bufnr)
      if conform.get_formatter_info("ruff_format", bufnr).available then
        return { "ruff_format" }
      else
        return { "isort", "black" }
      end
    end,
    ["*"] = { "codespell" },
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


vim.keymap.set("n", "<leader>i", function()
  conform.format({ lsp_format = "fallback" })
end, { desc = "Format current buffer" })
