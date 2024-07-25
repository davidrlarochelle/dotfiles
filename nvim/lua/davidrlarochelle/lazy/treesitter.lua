return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				endwise = { enable = true },
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				throttle = true, -- Throttles plugin updates (may improve performance)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
					default = {
						"class",
						"function",
						"method",
						-- Add more patterns here
						-- Note that these can be specific to a filetype
					},
				},
				exact_patterns = {
					-- Example for a specific filetype with Lua patterns
					-- If it has a `key` it won't match the `default` pattern
					-- For example, to only match a pattern exactly as provided here:
					-- lua = {
					--     'function', -- This is only exact if `function` is the whole keyword
					-- },
				},
			})
		end,
	},
}
