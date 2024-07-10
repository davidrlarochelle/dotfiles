return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-plenary",
			"olimorris/neotest-rspec",
            "nvim-neotest/nvim-nio",
		},
		config = function()
			local neotest = require("neotest")
			neotest.setup({
				adapters = {
					require("neotest-rspec")({
						rspec_cmd = function()
							return vim.tbl_flatten({
								"bundle",
								"exec",
								"rspec",
							})
						end,
						root_files = { "Gemfile", ".rspec", ".gitignore" },
						filter_dirs = { ".git", "node_modules" },
						transform_spec_path = function(path)
							return path
						end,
					}),
					require("neotest-vitest"),
					require("neotest-plenary").setup({
						-- this is my standard location for minimal vim rc
						-- in all my projects
						min_init = "./scripts/tests/minimal.vim",
					}),
				}
			})
            -- Custom key mappings to run tests
            vim.api.nvim_set_keymap('n', '<leader>rr', '<cmd>lua require("neotest").run.run()<CR>', { noremap = true, silent = true }) -- Run the nearest test
            vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', { noremap = true, silent = true }) -- Run the entire test file
            vim.api.nvim_set_keymap('n', '<leader>ts', '<cmd>lua require("neotest").summary.toggle()<CR>', { noremap = true, silent = true }) -- Toggle test summary
            vim.keymap.set("n", "<leader>tc", function()
                neotest.run.run()
            end)
		end,
	},
}

