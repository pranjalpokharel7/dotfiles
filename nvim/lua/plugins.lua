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
		tag = "v0.2.2",
		dependencies = { "nvim-lua/plenary.nvim" },
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

	-- gitsigns (vscode experience)
	{
		"lewis6991/gitsigns.nvim",
	},

	-- mason, manages lsp/formatter binaries
	{
		"mason-org/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
	},

	-- treesitter, syntax highlighting / textobjects
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},

	-- auto close/rename jsx & html tags
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	-- indent object (for python selection at indentation levels)
	{
		"michaeljsmith/vim-indent-object",
	},

	-- render markdown
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
		opts = {},
	}
}
