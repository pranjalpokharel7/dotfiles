return {
	-- catpuccin, theme
	{ 
		"catppuccin/nvim", 
		lazy = false, 
		name = "catppuccin", 
		priority = 1000,
		config = function() 
			vim.cmd([[colorscheme catppuccin-mocha]])
		end,
	},

  -- telescope, finder
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {'nvim-lua/plenary.nvim'},
	},

	-- treesitter, syntax highlighting
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate'
	},

	-- lsp
	{
		'neovim/nvim-lspconfig',
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
		'akinsho/toggleterm.nvim', version = "*", config = true
	},

	-- lualine, status line
	{
	  'nvim-lualine/lualine.nvim',
	  dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- conform, formatting
	{
  	'stevearc/conform.nvim',
  	opts = {},
	}
}
