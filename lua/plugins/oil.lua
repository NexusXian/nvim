return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Oil" },
    keys = {
      { "-", "<cmd>Oil<CR>", desc = "Open parent directory (oil)" },
      { "<leader>o", "<cmd>Oil<CR>", desc = "Open parent directory (oil)" },
    },
    opts = {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
      win_options = {
        signcolumn = "yes:2",
      },
      keymaps = {
        ["<C-s>"] = { ":w<CR>", desc = "Save changes" },
        ["<C-h>"] = false,
        ["<C-l>"] = false,
      },
    },
    -- wildfire.vim maps <ENTER> buffer-locally (its "disable" hook) on oil's
    -- nofile buffers via BufReadPost, overriding oil's <CR>. Re-apply after it.
    config = function(_, opts)
      require("oil").setup(opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "oil",
        callback = function(args)
          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(args.buf) then
              vim.keymap.set("n", "<CR>", function()
                require("oil").select()
              end, { buffer = args.buf, desc = "Open the entry under the cursor" })
            end
          end)
        end,
      })
    end,
  },
  {
    "refractalize/oil-git-status.nvim",
    dependencies = { "stevearc/oil.nvim" },
    config = true,
  },
}
