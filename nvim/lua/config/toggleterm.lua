require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,

	open_mapping = [[<C-t>]],

	-- open/create terminal in insert mode
	on_create = function(t)
    vim.cmd("startinsert")
  end,

  on_open = function(t)
    vim.cmd("startinsert")
  end,

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
      link = 'Normal',
    },
  },

	-- experimental, don't know what this does
	shade_terminals = true,
  shading_factor = -20,
  shading_ratio = -3,

	-- terminal options for floating mode
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

  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return "emerald #" .. term.id
    end
  },

  responsiveness = {
    horizontal_breakpoint = 135,
  }
}

