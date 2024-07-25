require("davidrlarochelle.set")
require("davidrlarochelle.remap")
require("davidrlarochelle.lazy_init")

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup("ThePrimeagen", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
	require("plenary.reload").reload_module(name)
end

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = ThePrimeagenGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- autocmd("LspAttach", {
-- 	group = ThePrimeagenGroup,
-- 	callback = function(e)
-- 		local opts = { buffer = e.buf }
-- 		vim.keymap.set("n", "gd", function()
-- 			vim.lsp.buf.definition()
-- 		end, opts)
-- 		vim.keymap.set("n", "K", function()
-- 			vim.lsp.buf.hover()
-- 		end, opts)
-- 		vim.keymap.set("n", "<leader>vws", function()
-- 			vim.lsp.buf.workspace_symbol()
-- 		end, opts)
-- 		vim.keymap.set("n", "<leader>vd", function()
-- 			vim.diagnostic.open_float()
-- 		end, opts)
-- 		vim.keymap.set("n", "<leader>vca", function()
-- 			vim.lsp.buf.code_action()
-- 		end, opts)
-- 		vim.keymap.set("n", "<leader>vrr", function()
-- 			vim.lsp.buf.references()
-- 		end, opts)
-- 		vim.keymap.set("n", "<leader>vrn", function()
-- 			vim.lsp.buf.rename()
-- 		end, opts)
-- 		vim.keymap.set("i", "<C-h>", function()
-- 			vim.lsp.buf.signature_help()
-- 		end, opts)
-- 		vim.keymap.set("n", "[d", function()
-- 			vim.diagnostic.goto_next()
-- 		end, opts)
-- 		vim.keymap.set("n", "]d", function()
-- 			vim.diagnostic.goto_prev()
-- 		end, opts)
-- 	end,
-- })

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.NERDTreeWinSize = 60
-- Function to check if a buffer is a Telescope prompt
local function is_telescope_buffer()
	local ft = vim.bo.filetype
	return ft == "TelescopePrompt" or ft == "TelescopeResults"
end

vim.cmd([[
    augroup AutoCloseNERDTree
        autocmd!
        autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary' && !&buflisted && !&previewwindow && &filetype != 'TelescopePrompt' && &filetype != 'TelescopeResults') | NERDTree | endif
    augroup END
]])

-- Function to reload Neovim configuration
function _G.ReloadConfig()
	for name, _ in pairs(package.loaded) do
		if name:match("^user_config") then
			package.loaded[name] = nil
		end
	end
	dofile(vim.env.MYVIMRC)
end

vim.api.nvim_create_user_command("Reload", "lua ReloadConfig()", {})
