local toggleterm = require("toggleterm")

toggleterm.setup({
	-- size can be a number or function which is passed the current terminal
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,

	-- keybinding to toggle terminal
	open_mapping = [[<C-t>]],

	hide_numbers = true,
	shade_filetypes = {},
	autochdir = false,

	-- terminal mappings
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,

	persist_size = true, -- remember previous terminal size
	persist_mode = true, -- remember previous terminal mode

	direction = "horizontal", -- or 'float' or 'vertical' or 'tab'

	close_on_exit = true, -- close terminal window when process exits
	clear_env = false, -- use only env vars from `env`, not sure why this is relevant

	shell = vim.o.shell,

	auto_scroll = true, -- auto scroll to bottom of terminal

	-- tinker around with this
	highlights = {
		Normal = {
			guibg = "#1e1e1e", -- background color for terminal window
		},
		FloatBorder = {
			guifg = "#a9b1d6",
			guibg = "#1e1e1e",
		},
		NormalFloat = {
			link = "Normal",
		},
	},

	-- experimental, don't know what this does
	shade_terminals = true,
	shading_factor = -20,
	shading_ratio = -3,

	-- terminal options for floating mode, might remove
	float_opts = {
		border = "curved",
		width = function()
			return math.floor(vim.o.columns * 0.8)
		end,
		height = function()
			return math.floor(vim.o.lines * 0.8)
		end,
		row = function()
			return math.floor(vim.o.lines * 0.1)
		end,
		col = function()
			return math.floor(vim.o.columns * 0.1)
		end,
		winblend = 3,
		zindex = 50,
		title_pos = "center",
	},

	-- disable winbar, unnecessary clutter
	winbar = {
		enabled = false,
	},

	responsiveness = {
		horizontal_breakpoint = 135,
	},
})

-- set keymaps for terminal mode 
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
