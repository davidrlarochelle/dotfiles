return {
	"0xJohnnyboy/scretch.nvim",
	requires = "nvim-telescope/telescope.nvim",
	-- or
	-- requires = 'ibhagwan/fzf-lua' ,
	config = function()
		require("scretch").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})
		local scretch = require("scretch")
		vim.keymap.set("n", "<leader>sn", scretch.new)
		vim.keymap.set("n", "<leader>snn", scretch.new_named)
		vim.keymap.set("n", "<leader>sft", scretch.new_from_template)
		vim.keymap.set("n", "<leader>sl", scretch.last)
		vim.keymap.set("n", "<leader>ss", scretch.search)
		vim.keymap.set("n", "<leader>st", scretch.edit_template)
		vim.keymap.set("n", "<leader>sg", scretch.grep)
		vim.keymap.set("n", "<leader>sv", scretch.explore)
		vim.keymap.set("n", "<leader>sat", scretch.save_as_template)
	end,
}
