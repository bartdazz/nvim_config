return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"R-nvim/cmp-r",
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
			require("cmp_r").setup({})
			require("cmp_nvim_ultisnips").setup({})
			local lspkind = require("lspkind")
			local lsp_symbols = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "",
			}

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),

					["<Tab>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(1) then
							luasnip.jump(1)
						elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
							vim.fn["UltiSnips#JumpForwards"]()
						elseif cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
							vim.fn["UltiSnips#ExpandSnippet"]()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
							vim.fn["UltiSnips#JumpBackwards"]()
						elseif cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "cmp_r" },
					{ name = "ultisnips" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol", -- show only symbol annotations
						maxwidth = 50, -- set the max width correctly
						ellipsis_char = "...",
						show_labelDetails = true,
						before = function(entry, vim_item)
							vim_item.kind = lsp_symbols[vim_item.kind]
							if entry.source.name == "cmp_tabnine" then
								vim_item.kind = "   (TabNine)"
								if
									entry.completion_vim_item.data ~= nil
									and entry.completion_vim_item.data.detail ~= nil
								then
									vim_item.kind = "   (" .. entry.completion_vim_item.data.detail .. ")"
								end
							end
							vim_item.menu = ({
								buffer = "[Buffer]",
								cmp_tabnine = "[Cmp]",
								nvim_lsp = "[LSP]",
								treesitter = "[TS]",
								-- cody = "[SG]",
								-- path = "[Path]",
								luasnip = "[Snippet]",
							})[entry.source.name]
							return vim_item
						end,
					}),
				},
			})
		end, -- Ensure `end` properly closes the function
	},
	{ -- setting ultisnips
		"SirVer/ultisnips",
		-- dependencies = {
		--  "honza/vim-snippets", -- optional
		--},
		dependencies = { "quangnguyen30192/cmp-nvim-ultisnips" }, -- to use ultisnips with nvim-cmp
		config = function()
			vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "my_snippets" }
		end,
	},
}
