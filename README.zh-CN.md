# 🌟NexusNvim


![sexImg](https://github.com/NexusXian/githubImg/blob/master/bg/ttk.png)
![主页面](https://github.com/NexusXian/githubImg/blob/master/nvim/neovim01.png)
![查找文件](https://github.com/NexusXian/githubImg/blob/master/nvim/neovim02.png)
![nvim.lazy](https://github.com/NexusXian/githubImg/blob/master/nvim/neovim03.png)
![侧边栏和大模型助手](https://github.com/NexusXian/githubImg/blob/master/nvim/neovim04.png)
![lsp报错](https://github.com/NexusXian/githubImg/blob/master/nvim/neovim05.png)
![ai补全](https://github.com/NexusXian/githubImg/blob/master/nvim/neovim06.png)
![代码补全](https://github.com/NexusXian/githubImg/blob/master/nvim/neovim07.png)
![lsp源码介绍](https://github.com/NexusXian/githubImg/blob/master/nvim/neovim08.png)
![代码运行](https://github.com/NexusXian/githubImg/blob/master/nvim/neovim09.png)

[English](README.md) | 简体中文

NexusNvim 是一套基于 Lua 和 lazy.nvim 的 Neovim 配置，面向日常编码、Go、Flutter、前端、C/C++、Rust、调试、数据库、AI 辅助和快速文件操作。

## 特性

| 模块 | 内容 |
|------|------|
| 插件管理 | `lazy.nvim` |
| 主题 | `deus.nvim` |
| LSP | `nvim-lspconfig`、`mason.nvim`、`mason-lspconfig.nvim` |
| 补全 | `nvim-cmp`、`LuaSnip`、`friendly-snippets`、`cmp-dotenv` |
| AI | `opencode.nvim`、`supermaven.nvim` |
| 文件管理 | `neo-tree.nvim`、`yazi.nvim` |
| 搜索 | `telescope.nvim` |
| Git | `gitsigns.nvim`、`lazygit.nvim` |
| 调试 | `nvim-dap`、`nvim-dap-ui`、`mason-nvim-dap.nvim` |
| 语言 | Go、Flutter、HTML、CSS、TypeScript、Lua、Rust、C/C++、YAML、JSON、Protobuf、Zig |
| 编辑增强 | 自动括号、注释、多光标、surround、Hop、Dropbar、Treesitter、彩虹括号 |
| 工具 | ToggleTerm、LiveServer、CMake、CompetiTest、Dadbod、Notify、Presence |

## 安装

### 1. 安装 Neovim

建议使用 Neovim `0.12+`。

```bash
# Arch Linux
sudo pacman -S neovim

# macOS
brew install neovim
```

### 2. 克隆配置

```bash
git clone -b stable https://github.com/NexusXian/nvim.git ~/.config/nvim
```

### 3. 安装常用依赖

```bash
# Arch Linux
sudo pacman -S nodejs npm go cmake ripgrep fd lazygit

# macOS
brew install node go cmake ripgrep fd lazygit
```

### 4. 启动

```bash
nvim
```

首次启动会自动安装 lazy.nvim 和插件。

## 快捷键

`<Leader>` 默认为空格。

### 基础

| 模式 | 快捷键 | 说明 |
|------|--------|------|
| i | `jk` | 退出插入模式 |
| n | `<Leader>sa` | 全选 |
| n | `Y` | 复制当前行到系统剪贴板 |
| v | `Y` | 复制选区到系统剪贴板 |

### 文件、窗口和 Buffer

| 模式 | 快捷键 | 说明 |
|------|--------|------|
| n | `<Leader>e` | 打开或关闭 Neo-tree |
| n | `H` | 上一个 buffer |
| n | `L` | 下一个 buffer |
| n | `<Leader>q` | 关闭当前 buffer |
| n | `<Leader>bo` | 关闭其他 buffer |
| n | `<Leader>br` | 关闭右侧 buffer |
| n | `<Leader>bp` | 选择并关闭 buffer |
| n | `<Leader>bs` | 选择 buffer |
| n | `<C-h>` | 切到左侧窗口 |
| n | `<C-j>` | 切到下方窗口 |
| n | `<C-k>` | 切到上方窗口 |
| n | `<C-l>` | 切到右侧窗口 |
| n | `<M-Up>` | 增加窗口高度 |
| n | `<M-Down>` | 减少窗口高度 |
| n | `<M-Right>` | 增加窗口宽度 |
| n | `<M-Left>` | 减少窗口宽度 |
| n | `<Leader>vs` | 垂直分屏 |
| n | `<Leader>sw` | 水平分屏 |

### 搜索

| 模式 | 快捷键 | 说明 |
|------|--------|------|
| n | `<Leader>ff` | 查找文件 |
| n | `<Leader>fF` | 查找被忽略的文件 |
| n | `<Leader>F` | 最近文件 |
| n | `<Leader>fb` | 搜索 buffer |
| n | `<Leader>fB` | 搜索全部 buffer |
| n | `<Leader>o` | 当前文件函数或方法 |
| n | `<Leader>O` | 当前文件符号 |
| n | `<Leader>fh` | 搜索帮助 |
| n | `<Leader>fm` | 搜索标记 |
| n | `<Leader>fd` | 搜索诊断 |
| n | `<Leader>fc` | 搜索命令 |
| n | `<Leader>fy` | 剪贴板历史 |

### LSP 和诊断

| 模式 | 快捷键 | 说明 |
|------|--------|------|
| n | `gd` | 跳转定义 |
| n | `gD` | 跳转声明 |
| n | `gt` | 跳转类型定义 |
| n | `gi` | 跳转实现 |
| n | `gr` | 查找引用 |
| n | `K` | 悬停文档 |
| n | `<Leader>k` | 签名帮助 |
| n | `<Leader>ca` | Code Action |
| n | `<Leader>rn` | 重命名 |
| n | `<Leader>cf` | 格式化 |
| n | `<Leader>ai` | 组织导入 |
| n | `<Leader>ui` | 添加缺失的 TS imports |
| n | `[d` | 上一个诊断 |
| n | `]d` | 下一个诊断 |
| n | `<Leader>dl` | 诊断位置列表 / DAP 运行上次配置 |
| n | `<Leader>dq` | 诊断 Quickfix 列表 |
| n | `<Leader>df` | 浮动诊断 / DAP 调用栈 |

### 补全和片段

| 模式 | 快捷键 | 说明 |
|------|--------|------|
| i, s | `<C-b>` | 向上滚动补全文档 |
| i, s | `<C-f>` | 向下滚动补全文档 |
| i, s | `<C-Space>` | 触发补全 |
| i, s | `<C-e>` | 关闭补全 |
| i, s | `<CR>` | 确认补全 |
| i, s | `<Tab>` | 下一个补全项或展开片段 |
| i, s | `<S-Tab>` | 上一个补全项或回退片段 |
| i, s | `<C-j>` | 跳到下一个片段节点 |
| i, s | `<C-k>` | 跳到上一个片段节点 |

### AI

| 模式 | 快捷键 | 说明 |
|------|--------|------|
| n, x | `<Leader>aa` | Opencode Ask |
| n, x | `<Leader>ax` | Opencode Action |
| n | `<Leader>ac` | 打开或关闭 Opencode |
| n | `go` | 添加范围到 Opencode |
| n | `goo` | 添加当前行到 Opencode |
| n | `<Leader>cu` | Opencode 向上滚动 |
| n | `<Leader>cd` | Opencode 向下滚动 |

### 调试

| 模式 | 快捷键 | 说明 |
|------|--------|------|
| n | `<F5>` | 启动或继续调试 |
| n | `<F10>` | Step Over |
| n | `<F11>` | Step Into |
| n | `<F12>` | Step Out |
| n | `<F6>` | 终止调试 |
| n | `<F9>` | 重启调试 |
| n | `<Leader>db` | 切换断点 |
| n | `<Leader>dB` | 条件断点 |
| n | `<Leader>lp` | 日志断点 |
| n | `<Leader>cb` | 清除所有断点 |
| n | `<Leader>du` | 切换 DAP UI |
| n | `<Leader>dr` | 打开 REPL |
| n, v | `<Leader>dh` | 查看变量 |
| n, v | `<Leader>dp` | 预览变量 |
| n | `<Leader>ds` | 查看作用域 |

### 开发工具

| 模式 | 快捷键 | 说明 |
|------|--------|------|
| n | `<Leader>cr` | 运行 CompetiTest 测试 |
| n | `<Leader>cp` | 接收 CompetiTest 题目 |
| n | `<Leader>fo` | Flutter Outline |
| n | `<Leader>fl` | Flutter Reload |
| n | `<Leader>fq` | Flutter Quit |
| n | `<Leader>fr` | Flutter Run |
| n | `<Leader>fe` | 选择 Flutter Emulator |
| n | `<Leader>gi` | Go imports |
| n | `<Leader>gmt` | Go mod tidy |
| n | `<Leader>mk` | Markdown 预览 |
| n | `<Leader>mks` | 停止 Markdown 预览 |

### Git、终端和编辑增强

| 模式 | 快捷键 | 说明 |
|------|--------|------|
| n | `<Leader>lg` | 打开 Lazygit |
| n | `<Leader>g-` | 上一个 Git hunk |
| n | `<Leader>g=` | 下一个 Git hunk |
| n | `<Leader>gb` | 当前行 blame |
| n | `<Leader>gr` | 重置 hunk |
| n | `<Leader>H` | 预览 hunk |
| n | `<Leader>gB` | 打开 blame 窗口 |
| n | `<C-t>` | 打开终端 |
| n | `<Leader>cc` | 注释当前行 |
| v | `<Leader>cc` | 注释选区 |
| n | `<Leader>;` | Dropbar 结构选择 |
| n | `[c` | 跳到上一个上下文 |
| n | `]c` | 跳到下一个上下文 |
| n | `<Leader>ww` | HopWord |
| n | `<Leader>ll` | HopLine |

## 说明

如果 LiveServer 安装失败，可以手动执行：

```bash
npm install -g live-server
```

如果插件安装较慢，可以设置 npm 镜像：

```bash
npm config set registry https://registry.npmmirror.com
```
