return {
	{
		"navarasu/onedark.nvim",
		config = function()
			-- Configure onedark.nvim
			require("onedark").setup({
				style = "light", -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
			})
			require("onedark").load()
		end,
	},
}
-- return {
-- 	"0xstepit/flow.nvim",
-- 	name = "Flow",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		require("flow").setup_options({
-- 			transparent = true, -- Set transparent background.
-- 			fluo_color = "pink", --  Fluo color: pink, yellow, orange, or green.
-- 			mode = "normal", -- Intensity of the palette: normal, dark, or bright. Notice that dark is ugly!
-- 			aggressive_spell = false, -- Display colors for spell check.
-- 		})
--
-- 		vim.cmd("colorscheme flow")
-- 	end,
-- }
