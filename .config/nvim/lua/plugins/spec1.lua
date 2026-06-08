return {
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			local ls = require("luasnip")
			-- Your snippet definition
			ls.add_snippets("yaml", {
				ls.parser.parse_snippet(
					{ trig = "proc" },
					[[
processors:
  - name: ${1:Processor Name}
    data_width: ${2:8}
    address_width: ${3:16}
    release: ${4:1976-01-01}
    manufacturer:
      - name: ${5:Manufacturer}
    package:
      - name: ${6:DIP}
        pins: ${7:40}
    clock:
      SI: MHz
      rates: [${8:1}]
    technology: ${9:4µm}
    transistors: ${10:8500}
    instruction_set: ${11:ISA}
    related_to:
      - name: ${12:Target}
        type: ${13:Predecessor}
]]
				),
			})
		end,
	},
	-- UI / Themes
	{
		"miikanissi/modus-themes.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("modus_vivendi")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = { options = { theme = "modus_vivendi" } },
	},
	{ "mawkler/modicator.nvim", config = true },
	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = [[<c-\>]],
			direction = "float",
		},
	},
	{
		"arborist-ts/arborist.nvim",
		opts = {
			ensure_installed = { "go" },
		},
	},
	-- File picker & Explorer
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = { picker = { enabled = true } },
		keys = {
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>ss",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "LSP Workspace Symbols",
			},
		},
	},
	{
		"stevearc/oil.nvim",
		config = true,
		keys = { { "-", "<cmd>Oil<cr>", desc = "Open parent directory" } },
	},

	-- Tabs
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = true,
	},

	-- Database management
	{ "tpope/vim-dadbod" },
	{ "kristijanhusak/vim-dadbod-ui" },

	-- LSP Management (Installation only)
	-- LSP Configuration (The new Neovim 0.12+ way)
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			local lspconfig = require("lspconfig")

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({})
					end,

					["yamlls"] = function()
						lspconfig.yamlls.setup({
							settings = {
								yaml = {
									schemas = {
										[vim.uri_from_fname(
											vim.fn.expand("~/.config/nvim/schemas/processor_schema.json")
										)] = "/**/processors.yaml",
									},
									validate = true,
									format = { enable = true },
								},
							},
						})
					end,
				},
			})
		end,
	},
	-- Formatting & Linting
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				go = { "goimports", "gofumpt" },
				lua = { "stylua" },
				sh = { "shfmt" },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				go = { "golangcilint" },
				sh = { "shellcheck" },
				sql = { "pgformatter" },
			}
		end,
	},

	-- Autocomplete Engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip", -- add this
			"L3MON4D3/LuaSnip", -- add this
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args) -- add this block
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback) -- add this
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- add this
					{ name = "buffer" },
					{ name = "path" },
				},
			})
		end,
	},
}
