return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-l>",
            next = "<C-j>",
            prev = "<C-k>",
          },
        },
        panel = { enabled = false },
      })
    end,
  },
}
