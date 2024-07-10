return {
	"mfussenegger/nvim-dap",
	config = function()
		require("dap").adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb-vscode",
			name = "lldb",
		}
	end,
}
