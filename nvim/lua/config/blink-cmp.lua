require("blink.cmp").setup({
	sources = {
		prividers = {
			{ "blink.cmp.sources.lsp", name = "LSP" },
			{ "blink.cmp.sources.path", name = "Path", score_offset = 3 },
			{ "blink.cmp.sources.snippets", name = "Snippets", score_offset = -3 },
			{ "blink.cmp.sources.buffer", name = "Buffer", fallback_for = { "LSP" } },
		},
	},
	highlight = {
		use_nvim_cmp_as_default = true,
	},
	windows = {
		documentation = {
			min_width = 15,
			max_width = 50,
			max_height = 15,
			border = "rounded",
			auto_show = true,
			auto_show_delay_ms = 200,
		},
		autocomplete = {
			min_width = 10,
			max_height = 10,
			border = "rounded",
			-- selection = "auto_insert", -- PENDING https://github.com/Saghen/blink.cmp/issues/117
			selection = "preselect",
			cycle = { from_top = false }, -- cycle at bottom, but not at the top
			draw = function(ctx)
				-- https://github.com/Saghen/blink.cmp/blob/819b978328b244fc124cfcd74661b2a7f4259f4f/lua/blink/cmp/windows/autocomplete.lua#L285-L349
				-- differentiate LSP snippets from user snippets and emmet snippets
				local icon, source = ctx.kind_icon, ctx.item.source
				local client = source == "LSP" and vim.lsp.get_client_by_id(ctx.item.client_id).name
				if source == "Snippets" or (client == "basics_ls" and ctx.kind == "Snippet") then
					icon = "󰩫"
				elseif source == "Buffer" or (client == "basics_ls" and ctx.kind == "Text") then
					icon = "󰦨"
				elseif client == "emmet_language_server" then
					icon = "󰯸"
				end

				-- FIX highlight for Tokyonight
				local iconHl = vim.g.colors_name:find("carbonfox") and "BlinkCmpKind" or "BlinkCmpKind" .. ctx.kind

				return {
					{
						" " .. ctx.item.label .. " ",
						fill = true,
						hl_group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
						max_width = 45,
					},
					{ icon .. ctx.icon_gap, hl_group = iconHl },
				}
			end,
		},
	},
	keymap = {
		accept = "<CR>",
		select_next = { "<Tab>", "<Down>" },
		select_prev = { "<S-Tab>", "<Up>" },
	},
	kind_icons = {
		Text = "󰊄",
		Method = "󰊕",
		Function = "󰊕",
		Constructor = "",
		Field = "󰇽",
		Variable = "󰂡",
		Class = "⬟",
		Interface = "",
		Module = "",
		Property = "󰜢",
		Unit = "",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "󰒕",
		Color = "󰏘",
		Reference = "",
		File = "󰉋",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰏿",
		Struct = "",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "󰅲",
	},
})
