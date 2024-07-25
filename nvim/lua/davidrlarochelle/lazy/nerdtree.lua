return {
	{
		"preservim/nerdtree",
		config = function()
			-- Add your NERDTree configuration here
			--       -- Show hidden files in NERDTree
			vim.g.NERDTreeShowHidden = 1

			-- Automatically open NERDTree on startup
			vim.cmd([[
               autocmd VimEnter * NERDTree | wincmd p
            ]])
			-- Custom key mappings to switch focus
			vim.api.nvim_set_keymap("n", "<leader>e", "<C-w>l", { noremap = true, silent = true }) -- Focus on editor
			vim.api.nvim_set_keymap("n", "<leader>t", "<C-w>h", { noremap = true, silent = true }) -- Focus on NERDTree
		end,
	},
}
