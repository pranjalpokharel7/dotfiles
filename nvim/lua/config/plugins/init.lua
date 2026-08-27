-- plugins that I don't require temporarily
--require("config.plugins.dap") -- currently using debugger in vscode

require("config.plugins.treesitter")
require("config.plugins.mason") -- must load before lsp so binaries are on PATH
require("config.plugins.telescope")
require("config.plugins.neotree")
require("config.plugins.toggleterm")
require("config.plugins.lualine")
require("config.plugins.conform")
require("config.plugins.lsp")
require("config.plugins.cmp")
require("config.plugins.gitsigns")
