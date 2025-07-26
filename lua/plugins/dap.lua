return {
	-- 调试核心插件
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- 修复 nvim-dap-ui 依赖问题
			"nvim-neotest/nvim-nio",

			-- 调试 UI 界面
			{
				"rcarriga/nvim-dap-ui",
				config = function()
					require("dap.ui.widgets")
					require("dapui").setup({
						layouts = {
							{
								elements = {
									{ id = "scopes", size = 0.25 },
									"breakpoints",
									"stacks",
									"watches",
								},
								size = 40,
								position = "left",
							},
							{
								elements = {
									"repl",
									"console",
								},
								size = 0.25,
								position = "bottom",
							},
						},
					})
				end,
			},

			-- 调试变量显示增强
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {
					enabled = true,
					enabled_commands = true,
					highlight_changed_variables = true,
					highlight_new_as_changed = false,
					show_stop_reason = true,
					commented = false,
					only_first_definition = true,
					all_references = false,
					display_callback = function(variable, _buf, _stackframe, _node)
						return variable.name .. " = " .. variable.value
					end,
					virt_text_pos = "eol",
					all_frames = false,
					virt_lines = false,
					virt_text_win_col = nil,
				},
			},

			-- 调试适配器管理
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = "williamboman/mason.nvim",
				opts = {
					ensure_installed = {
						"codelldb", -- C/C++/Rust
						"dart-debug-adapter", -- Dart
						"delve", -- Go
					},
					automatic_installation = true,
					handlers = {},
				},
			},
		},

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- 自动打开/关闭 DAP UI
			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close

			-- C/C++/Rust (codelldb)
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = "codelldb",
					args = { "--port", "${port}" },
				},
			}

			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/",
							"file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			-- Dart
			dap.adapters.dart = {
				type = "executable",
				command = "dart-debug-adapter",
				args = {},
			}

			dap.configurations.dart = {
				{
					type = "dart",
					request = "launch",
					name = "Launch Dart Program",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
			}

			-- Go (delve)
			dap.adapters.go = {
				type = "server",
				port = "${port}",
				executable = {
					command = "dlv",
					args = { "dap", "-l", "127.0.0.1:${port}" },
				},
			}

			dap.configurations.go = {
				{
					type = "go",
					name = "Debug",
					request = "launch",
					program = "${file}",
				},
				{
					type = "go",
					name = "Debug test",
					request = "launch",
					mode = "test",
					program = "${file}",
				},
			}
		end,
	},
}
