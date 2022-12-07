local dap = require('dap')
local dapui = require('dapui')

dap.adapters.codelldb = {
	type = 'server',
	port = "${port}",
	-- command = '/Users/wdylanbibb/Downloads/extension/debugAdapters/bin/OpenDebugAD7',
	executable = {
		command = '/Users/wdylanbibb/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/adapter/codelldb',
		args = { '--port', '${port}' },
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
		stopAtEntry = true,
	},
}
dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

dap.listeners.after.event_initialized.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close({ layout = 1 })
	dap.repl.close()
end

local wk = require('which-key')

wk.register ( {
	d = {
		name = "Debug",
		c = { dap.continue, 'Debug Continue/Start' },
		b = { dap.toggle_breakpoint, 'Toggle Breakpoint' },
		t = { dap.terminate, 'Terminate Debug Session' },
		s = {
			name = "Step",
			o = { dap.step_over, 'Step Over' },
			i = { dap.step_into, 'Step Into' },
		}
	}
}, { prefix = '<leader>' } )
