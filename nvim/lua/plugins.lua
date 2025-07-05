return {
	-- github, theme
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		name = "github-theme",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme github_dark]])
		end,
	},

	-- telescope, finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- treesitter, syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- lsp
	{
		"neovim/nvim-lspconfig",
	},

	-- neotree, directory listing drawer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		lazy = false, -- neo-tree will lazily load itself
	},

	-- toggleterm, terminal integration
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
	},

	-- lualine, status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- conform, formatting
	{
		"stevearc/conform.nvim",
		opts = {},
	},

	-- nvim-cmp, completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},

	-- debugger (experimental)
	{
		"mfussenegger/nvim-dap",
	},

	-- activity watcher?
	{
		"ActivityWatch/aw-watcher-vim"
	},
}
