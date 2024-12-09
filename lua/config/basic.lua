-- enable tabnine
vim.g.tabnine_enable = 1
-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'
-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 高亮所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
--vim.wo.colorcolumn = "80"
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = false
-- 边输入边搜索
vim.o.incsearch = true
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = false
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = '<,>,[,]'
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
vim.o.timeoutlen = 500
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "space:·"
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
-- 补全最多显示10行
vim.o.pumheight = 10
-- 永远显示 tabline
vim.o.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode = false
-- 自动补全括号
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        -- 使用表来定义需要补全的括号
        local pairs = { ["("] = ")", ["{" ] = "}", ["["] = "]", ["'"] = "'", ['"'] = '"' }
        local buf = vim.api.nvim_get_current_buf()
        -- 设置插入模式时，捕获输入
        vim.api.nvim_buf_set_keymap(buf, "i", "(", "()<left>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(buf, "i", "{", "{}<left>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(buf, "i", "[", "[]<left>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(buf, "i", "'", "''<left>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(buf, "i", '"', '""<left>', { noremap = true, silent = true })
    end,
})
-- 针对插入模式的括号自动换行缩进
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    callback = function()
        local line = vim.fn.getline(".")
        if line:match("%b()$") or line:match("%b{}$") or line:match("%b[]$") then
            vim.cmd("normal! gvgj") -- 使用 Visual 模式选中当前行及下一行
            vim.cmd("normal! >")      -- 向右缩进
            vim.cmd("normal! gvgk") -- 取消选择
        end
    end,
})

-- 自动保存每次退出输入模式
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*", -- 适用于所有文件
    callback = function()
        vim.cmd("silent! write") -- 保存文件，不显示信息
    end,
})
-- 启用持久撤销
vim.opt.undofile = true -- 开启持久撤销功能

-- 正确设置 undodir 为字符串路径
local undo_dir = vim.fn.stdpath("data") .. "/undo" -- 获取撤销文件目录
vim.opt.undodir = undo_dir

-- 确保目录存在
vim.fn.mkdir(undo_dir, "p") -- "p" 选项会递归创建目录

