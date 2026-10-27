-- 上次使用的主题保存在 stdpath("state")/theme，不存在或无效时回退 nordfox
local theme_file = vim.fn.stdpath("state") .. "/theme"
local themes = {
  "nordfox",
  "tokyonight", "tokyonight-day", "tokyonight-moon", "tokyonight-storm",
  "catppuccin-latte", "catppuccin-frappe", "catppuccin-macchiato", "catppuccin-mocha",
}

local function saved_theme()
  local f = io.open(theme_file, "r")
  if f then
    local name = f:read("*l") or ""
    f:close()
    if vim.tbl_contains(themes, name) then
      return name
    end
  end
  return "nordfox"
end

local function set_theme(name)
  vim.cmd.colorscheme(name)
  local f = io.open(theme_file, "w")
  if f then
    f:write(name)
    f:close()
  end
end

return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      local name = saved_theme()
      local ok, err = pcall(vim.cmd.colorscheme, name)
      if not ok then
        vim.notify("colorscheme " .. name .. " 加载失败: " .. err, vim.log.levels.WARN)
        vim.cmd.colorscheme("nordfox")
      end
      vim.keymap.set("n", "<leader>uC", function()
        vim.ui.select(themes, { prompt = "Colorscheme" }, function(choice)
          if choice then
            set_theme(choice)
          end
        end)
      end, { desc = "Colorscheme select" })
    end,
  },
  { "folke/tokyonight.nvim", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
}
