return {
  "kelly-lin/ranger.nvim",
  keys = '<leader>r',
  config = function()
    require("ranger-nvim").setup({ replace_netrw = true })
    vim.api.nvim_set_keymap("n", "<leader>r", "", {
      noremap = true,
      callback = function()
        require("ranger-nvim").open(true)
      end,
    })
  end,
}
