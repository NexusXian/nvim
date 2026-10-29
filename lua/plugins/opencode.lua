local opencode_cmd = "opencode"
---@type snacks.terminal.Opts
local snacks_terminal_opts = {
	win = {
		position = "right",
		enter = false,
	},
}

return {
	"nickjvandyke/opencode.nvim",
	-- "main" supports OpenCode v2

	dependencies = {
		{
			"folke/snacks.nvim",
			optional = true,
			opts = {
				input = { enabled = true },
				picker = {
					enabled = true,
					actions = {
						opencode_send = function(picker) ---@param picker snacks.Picker
							local items = vim.tbl_map(function(item) ---@param item snacks.picker.Item
								return item.file
										and require("opencode").format({
											path = item.file,
											from = item.pos,
											to = item.end_pos,
										})
									or item.text
							end, picker:selected({ fallback = true }))

							require("opencode").prompt(table.concat(items, ", ") .. " ")
						end,
					},
					win = {
						input = {
							keys = {
								["<leader>aa"] = { "opencode_send", mode = { "n" } },
							},
						},
					},
				},
			},
		},
	},

	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			server = {
				start = function()
					require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
				end,
			},
		}

		-- Ask（发送当前内容/选区）
		vim.keymap.set({ "n", "x" }, "<leader>aa", function()
			require("opencode").ask("@this: ")
		end, { desc = "Opencode Ask" })

		-- 执行动作（select）
		vim.keymap.set({ "n", "x" }, "<leader>ax", function()
			require("opencode").select()
		end, { desc = "Opencode Action" })

		-- 打开/关闭窗口
		vim.keymap.set("n", "<leader>ac", function()
			require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
		end, { desc = "Opencode Toggle" })

		vim.keymap.set({ "n", "x" }, "go", function()
			return require("opencode").operator("@this")
		end, { desc = "Add range to opencode", expr = true })

		vim.keymap.set("n", "goo", function()
			return require("opencode").operator("@this") .. "_"
		end, { desc = "Add line to opencode", expr = true })
	end,
}
