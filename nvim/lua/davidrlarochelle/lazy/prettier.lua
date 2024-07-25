return {
	"prettier/vim-prettier",
	setup = function()
		vim.g["prettier#autoformat"] = 1
		vim.g["prettier#autoformat_require_pragma"] = 0
		vim.g["prettier#autoformat_config_file"] = vim.fn.expand("~/.config/nvim/.prettierrc")
	end,
}
