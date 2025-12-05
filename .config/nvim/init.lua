local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('miikanissi/modus-themes.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('mawkler/modicator.nvim')
vim.call('plug#end')

require('config.colorscheme')
require('config.options')
require('config.statusline')
require('config.lsp')
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
