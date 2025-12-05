return {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = {{'.luarc.json', '.luarc.jsonc'}, '.git'},

	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
		},
	},

	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
}
