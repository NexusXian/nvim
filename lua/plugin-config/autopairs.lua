-- 自动加载并配置 nvim-autopairs
require('nvim-autopairs').setup({
    check_ts = true, -- 启用 Treesitter 检查以获得更智能的补全
    disable_filetype = { "TelescopePrompt", "vim" }, -- 禁用特定文件类型
})
-- 结合 nvim-cmp 的补全行为
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

