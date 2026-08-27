local servers = {
	"pyright",

	-- node.js: nest (backend) + next (frontend)
	"ts_ls",
	"eslint",
	"html",
	"cssls",
	"jsonls",
	"tailwindcss",
	"emmet_language_server",
}

-- enable diagnostics
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
})

-- Use an LspAttach autocmd rather than the on_attach config field: several of
-- nvim-lspconfig's bundled server defaults (ts_ls, pyright, eslint, ...) ship their
-- own on_attach, and vim.lsp.config() merges per-key, so their on_attach silently
-- replaces ours instead of composing with it. LspAttach fires independently of that.
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local opts = { buffer = bufnr, silent = true }

		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

		-- code actions: eslint autofix, "add missing import", "organize imports", ...
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

		vim.api.nvim_set_keymap(
			"n",
			"<leader>do",
			"<cmd>lua vim.diagnostic.open_float()<CR>",
			{ noremap = true, silent = true }
		)

		-- mouse based lsp functionality
		vim.keymap.set("n", "<M-LeftMouse>", function()
			vim.cmd([[execute "normal! \<LeftMouse>"]])
			vim.lsp.buf.references()
		end, { desc = "Alt+Click: Find references", buffer = bufnr })
	end,
})

-- advertise nvim-cmp's extra completion capabilities (snippets, additionalTextEdits)
-- to every server; without this you lose auto-import completions in ts_ls.
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
	capabilities = cmp_lsp.default_capabilities(capabilities)
end

vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.lsp.config("pyright", {
	settings = {
		python = {
			pythonPath = ".venv/bin/python", -- since we are using uv for setting up venv
		},
	},
})

-- Resolve the *project's* typescript (node_modules/typescript/lib) rather than the
-- copy bundled with mason's typescript-language-server. Under pnpm this lives in the
-- package dir (apps/web/node_modules/typescript -> ../../node_modules/.pnpm/...),
-- so we walk up from the buffer and follow symlinks.
local function find_tsdk(start)
	local found = vim.fs.find(function(name, path)
		return name == "typescript" and vim.uv.fs_stat(path .. "/typescript/lib/tsserver.js") ~= nil
	end, { path = start, upward = true, type = "link", limit = math.huge })
	-- `type = "link"` only matches pnpm-style symlinks; also try real dirs (npm/yarn)
	if vim.tbl_isempty(found) then
		found = vim.fs.find(function(name, path)
			return name == "typescript" and vim.uv.fs_stat(path .. "/typescript/lib/tsserver.js") ~= nil
		end, { path = start, upward = true, type = "directory", limit = math.huge })
	end
	local dir = found[1]
	return dir and (vim.uv.fs_realpath(dir) or dir) .. "/lib" or nil
end

-- ts_ls: inlay hints are off by default, toggle with <leader>th below
vim.lsp.config("ts_ls", {
	-- Root at the nearest tsconfig so each pnpm workspace package (nest api, next web)
	-- gets its own tsserver with its own node_modules + compilerOptions. The lspconfig
	-- default roots at the lockfile, which in a pnpm monorepo is only at the repo root.
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local pkg_root = vim.fs.root(fname, { "tsconfig.json", "jsconfig.json" })
		local repo_root = vim.fs.root(fname, { "pnpm-lock.yaml", "package-lock.json", "yarn.lock", "bun.lock", ".git" })
		on_dir(pkg_root or repo_root or vim.fn.getcwd())
	end,

	before_init = function(params, config)
		local tsdk = find_tsdk(config.root_dir)
		if tsdk then
			params.initializationOptions = params.initializationOptions or {}
			params.initializationOptions.tsserver = { path = tsdk .. "/tsserver.js" }
		end
	end,

	settings = {
		typescript = {
			preferences = { importModuleSpecifier = "non-relative" }, -- nest/next use path aliases
			updateImportsOnFileMove = { enabled = "always" },
		},
		javascript = {
			updateImportsOnFileMove = { enabled = "always" },
		},
	},
})

-- eslint attaches per project; it needs an eslint config file in the project root
vim.lsp.config("eslint", {
	settings = {
		workingDirectories = { mode = "auto" }, -- monorepo friendly
	},
})

-- emmet in jsx/tsx expands `div.foo>p*3` with <C-y>, in insert mode
vim.lsp.config("emmet_language_server", {
	filetypes = {
		"html",
		"css",
		"scss",
		"javascriptreact",
		"typescriptreact",
	},
})

for _, server in ipairs(servers) do
	vim.lsp.enable(server)
end

-- toggle inlay hints (parameter names / inferred types) -- handy in TS, noisy in review
vim.keymap.set("n", "<leader>th", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end, { desc = "Toggle inlay hints" })
