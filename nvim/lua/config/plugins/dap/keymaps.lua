local dap = require("dap")

local opts = { silent = true }

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, opts)
vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, opts)

vim.keymap.set("n", "<leader>dc", dap.continue, opts)
-- vim.keymap.set("n", "<leader>do", dap.step_over, opts)
-- vim.keymap.set("n", "<leader>di", dap.step_into, opts)
-- vim.keymap.set("n", "<leader>dO", dap.step_out, opts)
vim.keymap.set("n", "<leader>dr", dap.repl.toggle, opts)
vim.keymap.set("n", "<leader>dt", dap.terminate, opts)

-- use arrow keys to move around in debugging mode
dap.listeners.after.event_initialized["arrow-keys"] = function()
  vim.keymap.set("n", "<Down>", dap.step_over)
  vim.keymap.set("n", "<Right>", dap.step_into)
  vim.keymap.set("n", "<Up>", dap.step_out)
	-- maybe reserve <Left> for something else?
end

dap.listeners.before.event_terminated["arrow-keys"] = function()
  vim.keymap.del("n", "<Down>")
  vim.keymap.del("n", "<Right>")
  vim.keymap.del("n", "<Up>")
end
