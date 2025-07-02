require('telescope').setup {
	defaults = {
		file_ignore_patterns = {'env/.*', 'node%_modules/.*', 'venv/.*'}
	}
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>', { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>s', '<cmd>Telescope registers<cr>', { desc = 'Telescope registers' })
