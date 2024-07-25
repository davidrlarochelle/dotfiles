return {
	setup = function()
		local cmp = require("cmp")
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
			mapping = {
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				-- ["<CR>"] = cmp.mapping.confirm({
				-- 	behavior = cmp.ConfirmBehavior.Insert,
				-- 	select = true,
				-- }),

				["<Tab>"] = cmp.mapping(function(fallback)
					-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
					if cmp.visible() then
						local entry = cmp.get_selected_entry()
						if not entry then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						end
						cmp.confirm()
					else
						fallback()
					end
				end, { "i", "s", "c" }),
				-- local cmp = require("cmp")

				-- cmp.setup({
				-- 	mapping = {
				-- 		["<Tab>"] = cmp.mapping(function(fallback)
				-- 			-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
				-- 			if cmp.visible() then
				-- 				local entry = cmp.get_selected_entry()
				-- 				if not entry then
				-- 					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				-- 				end
				-- 				cmp.confirm()
				-- 			else
				-- 				fallback()
				-- 			end
				-- 		end, { "i", "s", "c" }),
				-- 	},
				-- })
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "buffer" },
			},
		})
	end,
}
