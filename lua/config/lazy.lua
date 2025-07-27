-- 设置 leader 键
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    lazyrepo, lazypath,
  })

  if vim.v.shell_error ~= 0 then
    vim.schedule(function()
      vim.cmd("echohl ErrorMsg | echom 'Failed to clone lazy.nvim:' | echohl None")
      vim.cmd("echom '" .. out:gsub("'", "''") .. "'")
      vim.cmd("echom 'Press any key to exit...'")
    end)
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- 加载 lazy.nvim 并启用自动更新相关配置
require("lazy").setup({
  spec = {
    { import = "plugins" },  -- 你的插件目录
  },
  install = {
    colorscheme = { "habamax" },
  },
  checker = {
    enabled = true,        -- 启用自动检查更新
    notify = false,        -- 是否显示通知
    frequency = 3600 * 24, -- 每 24 小时检查一次（单位秒）
  },
  change_detection = {
    enabled = true,        -- 插件文件发生变化时检测
    notify = true,         -- 变化时通知
  },
  update = {
    concurrency = 5,       -- 并发更新任务数
    skip_prompts = true,   -- 自动跳过提示
  },
})

-- 启动 Neovim 时自动更新插件（可选）
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("lazy").update({ show = false})  -- 不显示更新界面
  end,
})

