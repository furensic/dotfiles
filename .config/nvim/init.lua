local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('miikanissi/modus-themes.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('mawkler/modicator.nvim')
Plug('akinsho/toggleterm.nvim')
vim.call('plug#end')

require('config.colorscheme')
require('config.options')
require('config.statusline')
require('config.lsp')
require('config.autocmd')
require('modicator').setup({
	integration = {
		lualine = {
			enabled = true,
			mode_section = nil,
			highlight = 'bg',
		},
	},
})


vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.number = true
vim.opt.clipboard = "unnamedplus"

require("toggleterm").setup{
	open_mapping = [[<c-\>]],
	direction = 'float',
}
