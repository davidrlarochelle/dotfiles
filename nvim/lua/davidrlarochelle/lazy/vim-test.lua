return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	config = function()
		vim.keymap.set("n", "<leader>r", ":TestNearest<CR>", {})
		vim.keymap.set("n", "<leader>rr", ":TestFile<CR>", {})
		vim.keymap.set("n", "<leader>RR", ":TestSuite<CR>", {})
		vim.keymap.set("n", "<leader>rl", ":TestLast<CR>", {})
		vim.keymap.set("n", "<leader>gt", ":TestVisit<CR>", {})
		vim.cmd("let test#strategy = 'vimux'")
	end,
}
