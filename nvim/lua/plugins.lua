return {
	-- catpuccin
	{ 
		"catppuccin/nvim", 
		lazy = false, 
		name = "catppuccin", 
		priority = 1000,
		config = function() 
			vim.cmd([[colorscheme catppuccin-mocha]])
		end,
	},

  -- telescope
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {'nvim-lua/plenary.nvim'},
	},

	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate'
	},
}
