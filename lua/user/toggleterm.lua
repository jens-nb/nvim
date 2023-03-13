local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

-- toggleterm settings
toggleterm.setup{
	open_mapping = [[<C-t>]],
	direction = "float"
}

-- integrate lazygit with toggleterm
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

