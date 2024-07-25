return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.5",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
	},

	config = function()
		-- Define the custom function
		local builtin = require("telescope.builtin")

		local function project_files()
			local opts = {} -- define here if you want to define something
			vim.fn.system("git rev-parse --is-inside-work-tree")
			if vim.v.shell_error == 0 then
				builtin.git_files(opts)
			else
				builtin.find_files(opts)
			end
		end
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "^villeco/client/", "^node_modules/" },
			},
		})

		require("telescope").load_extension("undo")
		vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
		vim.keymap.set(
			"n",
			"<C-j>",
			'<cmd>lua require("telescope.actions").move_selection_next()<CR>',
			{ noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<C-k>",
			'<cmd>lua require("telescope.actions").move_selection_previous()<CR>',
			{ noremap = true, silent = true }
		)
	end,
}
