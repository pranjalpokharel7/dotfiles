require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			visible = true,
			show_hidden_count = true,
			hide_dotfiles = false,
		},
	},
})

vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>", { desc = "Open NeoTree" })
