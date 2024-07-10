return {
	{
		"navarasu/onedark.nvim",
		config = function()
			-- Configure onedark.nvim
			require("onedark").setup({
				style = "darker", -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
			})
			require("onedark").load()
		end,
	},
}
