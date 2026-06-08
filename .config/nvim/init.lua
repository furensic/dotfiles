require("config.lazy")
require("config.options")
require("config.keymap")
require("config.autocmd")

require("config.statusline")

require("modicator").setup({
	integration = {
		lualine = { enabled = true, mode_selection = nil, highlight = "bg" },
	},
})
