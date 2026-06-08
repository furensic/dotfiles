vim.o.termguicolors = true
vim.o.cursorline = true

vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.g.mouse = 'a'
vim.opt.encoding = "utf-8"
vim.opt.swapfile = false

vim.opt.scrolloff = 7
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.fileformat = "unix"

vim.diagnostic.config({
	virtual_lines = true,
	virtual_text = false,
})
