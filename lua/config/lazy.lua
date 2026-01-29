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

-- 加载 lazy.nvim 配置
require("lazy").setup({
  spec = {
    { import = "plugins" }, 
  },
  install = {
    colorscheme = { "habamax" },
  },
  -- 1. 关闭自动检查更新
  checker = {
    enabled = false,       -- 改为 false，不再去后台偷偷看有没有新版本
  },
  -- 2. 关闭配置变更通知
  change_detection = {
    enabled = true,        -- 依然允许热加载配置
    notify = false,        -- 但不再弹出“Config change detected”的提示
  },
  -- 3. 其他 UI 设置（可选）
  ui = {
    border = "rounded",
  },
})

-- 4. 彻底删除原有的 VimEnter 自动更新 autocmd
-- 已经直接删除了 require("lazy").update 的那段代码