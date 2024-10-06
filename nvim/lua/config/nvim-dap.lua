local dap, dapui = require("dap"), require("dapui")

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end

dap.adapters.codelldb = {
	type = 'server',
	port = "${port}",
	executable = {
		command = 'C:/Users/Kees Wolterstorff/AppData/Local/nvim-data/mason/packages/codelldb/extension/adapter/codelldb',
		args = {"--port", "${port}"},
		detached = false
	}
}



dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
	}
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
