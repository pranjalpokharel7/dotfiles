local parsers = {
	"python",
	"markdown",
	"markdown_inline",

	-- node.js / web
	"javascript",
	"typescript",
	"tsx",
	"jsdoc",
	"html",
	"css",
	"json",
	"yaml",
	"graphql",
	"prisma",
	"dockerfile",
	"bash",
	"lua",
}

require("nvim-treesitter").install(parsers)

-- the `main` branch of nvim-treesitter does not enable highlighting itself
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
		if lang and pcall(vim.treesitter.start, args.buf, lang) then
			-- treesitter based indentation
			vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})
