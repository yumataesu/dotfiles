require("toggleterm").setup()
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	hidden = true
})

function lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>lua lazygit_toggle()<CR>", { noremap = true, silent = true })
