return {
  "nickjvandyke/opencode.nvim",
  version = "*", -- Latest stable release

  dependencies = {
    {
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = {},
        picker = {
          actions = {
            opencode_send = function(...)
              return require("opencode").snacks_picker_send(...)
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
      -- 可以以后再加自定义配置
    }

    vim.o.autoread = true
    -- Ask（发送当前内容/选区）
    vim.keymap.set({ "n", "x" }, "<leader>aa", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Opencode Ask" })

    -- 执行动作（select）
    vim.keymap.set({ "n", "x" }, "<leader>ax", function()
      require("opencode").select()
    end, { desc = "Opencode Action" })

    -- 打开/关闭窗口
    vim.keymap.set({ "n" }, "<leader>ac", function()
      require("opencode").toggle()
    end, { desc = "Opencode Toggle" })


    vim.keymap.set({ "n" }, "go", function()
      return require("opencode").operator("@this ")
    end, { desc = "Add range to opencode", expr = true })

    vim.keymap.set("n", "goo", function()
      return require("opencode").operator("@this ") .. "_"
    end, { desc = "Add line to opencode", expr = true })


    vim.keymap.set("n", "<leader>cu", function()
      require("opencode").command("session.half.page.up")
    end, { desc = "Opencode Scroll Up" })

    vim.keymap.set("n", "<leader>cd", function()
      require("opencode").command("session.half.page.down")
    end, { desc = "Opencode Scroll Down" })
  end,
}
