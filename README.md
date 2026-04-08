
#
因为更新至nvim 0.12之后master分支的tree-sitter变得异常卡顿，直接迁移到了main分支
所以这个分支是支持0.12之前nvim版本的master分支，但是不再维护已经归档，但可以继续使用


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

本配置适用于追求简洁、高效、现代化体验的 Neovim 用户，预配置了包括 LSP、DAP、自动补全、文件管理、终端、注释、Flutter、Go、LiveServer 等插件，支持多语言开发。

## 📦 插件管理工具

本配置使用 [lazy.nvim](https://github.com/folke/lazy.nvim) 作为插件管理器，具备启动速度快、模块化结构清晰等优点。

## 🚀 安装步骤

### 1. 克隆配置

```bash
git clone -b stable https://github.com/NexusXian/nvim.git ~/.config/nvim
```

### 2. 安装 Neovim 最新版（建议 v0.9+）
- Arch Linux 用户：

```bash
sudo pacman -S neovim
```
- macOS 用户（需先安装 Homebrew）：
```bash
brew install neovim
```

### 3. 安装依赖工具
```bash
# Node.js（用于 treesitter、lsp、live-server）
sudo pacman -S nodejs npm  # Arch
brew install node           # macOS

# Go（用于 Go 开发环境）
sudo pacman -S go           # Arch
brew install go             # macOS

# CMake（适用于 cmake-tools）
sudo pacman -S cmake        # Arch
brew install cmake          # macOS
```

### 4. 启动 Neovim 并自动安装插件
```bash
nvim
第一次启动时，lazy.nvim 会自动安装所有插件，并自动运行 :TSUpdate 来安装 Treesitter 解析器。
```


# 📦 插件介绍与快捷键说明（增强版）

---

## 🧩 插件列表

| 插件名 | 功能描述 |
|--------|-----------|
| `codecompanion` | AI 编程助手 |
| `nvim-autopairs` | 自动补全括号、引号等 |
| `bufferline.nvim` | 多 buffer 标签栏 |
| `cmake-tools.nvim` | CMake 项目管理支持 |
| `copilot-cmp` / `copilot.lua` | GitHub Copilot 支持 |
| `cmp.nvim` | 自动补全框架 |
| `cmp-nvim-lsp` | 与 LSP 协同的 cmp 源 |
| `lspkind.nvim` | 自动补全图标美化 |
| `deus.nvim` | 主题配色方案 |
| `tcomment.nvim` | 快捷注释 |
| `nvim-treesitter` | 语法高亮与结构分析 |
| `competitest.nvim` | Competitive Programming 测试工具 |
| `nvim-lspconfig` | Neovim 内置 LSP 支持 |
| `mason.nvim` / `mason-lspconfig.nvim` | LSP/DAP 安装管理器 |
| `nvim-dap` / `nvim-dap-ui` | 调试器框架和 UI |
| `dashboard-nvim` | 启动页美化 |
| `dropbar.nvim` | 顶部代码结构导航栏 |
| `flutter-tools.nvim` | Flutter 工具链支持 |
| `go.nvim` | Go 开发支持，包括 LSP、测试等 |
| `indent-blankline.nvim` | 缩进指示线 |
| `live-server.nvim` | 实时 HTML 预览 |
| `lualine.nvim` | 状态栏插件 |
| `markview.nvim` | Markdown 实时预览 |
| `nvim-notify` | 通知系统 |
| `plenary.nvim` | Lua 工具库（依赖项） |
| `telescope.nvim` | 模糊搜索、文件查找 |
| `toggleterm.nvim` | 内置终端窗口 |
| `rainbow-delimiters.nvim` | 彩虹括号显示 |
| `yazi.nvim` | 文件管理器（yazi）集成 |
| `supermaven.nvim` | AI 补全助手（Supermaven） |
| `vim-surround` | 修改/包裹括号、引号等 |
| `vim-visual-multi` | 多光标操作 |
| `vim-which-key` | 显示快捷键提示 |
| `wilder.nvim` | 增强命令行 |
| `wildfire.nvim` | 快捷选择语法范围 |
| `nvim-tree.lua` | 文件浏览器 |

---

## ⌨️ 快捷键说明（按功能分类）

### 🚀 基础快捷键（无插件依赖）

| 模式 | 快捷键 | 说明 | 插件来源 |
|------|--------|------|----------|
| i | `jk` | 插入模式退出（等效 `<Esc>`） | 原生配置 |
| n | `<C-a>` | 选择全文（ggVG的封装） | 原生配置 |
| n | `Y` | 当前行复制到系统剪贴板 | 原生配置 |
| v | `Y` | 选区复制到系统剪贴板 | 原生配置 |

### 🖥️ 终端操作

| 模式 | 快捷键 | 说明 | 插件来源 |
|------|--------|------|----------|
| n | `<C-/>` | 显示/隐藏浮动终端 | 原生终端 + 自定义逻辑 |
| t | `<Esc>` | 从终端模式退出到普通模式 | 原生终端 |

### 📂 文件与窗口管理

| 模式 | 快捷键 | 说明 | 插件来源 |
|------|--------|------|----------|
| n | `<Leader>e` | 打开/关闭文件树 | `nvim-tree.lua` |
| n | `H` | 切换到上一个 buffer | `bufferline.nvim` |
| n | `L` | 切换到下一个 buffer | `bufferline.nvim` |
| n | `<C-h>` | 导航到左侧窗口 | 原生窗口管理 |
| n | `<C-j>` | 导航到下方窗口 | 原生窗口管理 |
| n | `<C-k>` | 导航到上方窗口 | 原生窗口管理 |
| n | `<C-l>` | 导航到右侧窗口 | 原生窗口管理 |
| n | `<Leader>-` | 打开yazi文件管理器 | `yazi.nvim` |

### ⚙️ LSP 相关操作

| 模式 | 快捷键 | 说明 | 插件来源 |
|------|--------|------|----------|
| n | `gd` | 跳转到定义 | `nvim-lspconfig` |
| n | `gD` | 跳转到声明 | `nvim-lspconfig` |
| n | `gt` | 跳转到类型定义 | `nvim-lspconfig` |
| n | `gi` | 跳转到实现 | `nvim-lspconfig` |
| n | `gr` | 查找引用 | `nvim-lspconfig` |
| n | `K` | 悬停文档提示 | `nvim-lspconfig` |
| n | `<C-k>` | 签名帮助 | `nvim-lspconfig` |
| n | `<Leader>ca` | 显示Code Action | `nvim-lspconfig` |
| n | `<Leader>rn` | 重命名符号 | `nvim-lspconfig` |
| n | `<Leader>cf` | 格式化代码 | `nvim-lspconfig` |
| n | `<Leader>ai` | 组织导入 | `nvim-lspconfig` |

### 🐛 诊断信息（Diagnostics）

| 模式 | 快捷键 | 说明 | 插件来源 |
|------|--------|------|----------|
| n | `[d` | 跳转到上一个诊断 | `nvim-lspconfig` |
| n | `]d` | 跳转到下一个诊断 | `nvim-lspconfig` |
| n | `<Leader>dl` | 打开诊断位置列表 | `nvim-lspconfig` |
| n | `<Leader>dq` | 打开诊断Quickfix列表 | `nvim-lspconfig` |
| n | `<Leader>df` | 浮动显示诊断信息 | `nvim-lspconfig` |

### 🤖 AI 辅助工具

| 模式 | 快捷键 | 说明 | 插件来源 |
|------|--------|------|----------|
| n | `<Leader>a` | 打开CodeCompanion AI聊天窗口 | `codecompanion` |
| i | `<C-Return>` | 应用supermaven代码补全 | `supermaven` |
| n | `<Leader>cl` | 打开Claude Code | `claude Code` |



### 🧪 竞赛编程（Competitive Programming）

| 模式 | 快捷键 | 说明 | 插件来源 |
|------|--------|------|----------|
| n | `<Leader>cr` | 运行测试用例 | `competitest.nvim` |
| n | `<Leader>cp` | 接收题目 | `competitest.nvim` |

### 📱 Flutter 开发

| 模式 | 快捷键 | 说明 | 插件来源 |
|------|--------|------|----------|
| n | `<Leader>fo` | 显示/隐藏Flutter Outline | `flutter-tools.nvim` |

### 🐞 调试器（DAP）操作

| 模式 | 快捷键 | 说明 | 插件来源 |
|------|--------|------|----------|
| n | `<F5>` | 启动/继续调试 | `nvim-dap` |
| n | `<F10>` | Step Over（单步跳过） | `nvim-dap` |
| n | `<F11>` | Step Into（单步进入） | `nvim-dap` |
| n | `<F12>` | Step Out（单步退出） | `nvim-dap` |
| n | `<F6>` | 终止调试 | `nvim-dap` |
| n | `<F9>` | 重启调试 | `nvim-dap` |
| n | `<Leader>b` | 设置/取消断点 | `nvim-dap` |
| n | `<Leader>B` | 设置条件断点 | `nvim-dap` |
| n | `<Leader>lp` | 设置日志断点 | `nvim-dap` |
| n | `<Leader>cb` | 清除所有断点 | `nvim-dap` |
| n | `<Leader>du` | 切换调试UI | `nvim-dap-ui` |
| n | `<Leader>dr` | 打开REPL | `nvim-dap` |
| n | `<Leader>dl` | 运行上次配置 | `nvim-dap` |
| n/v | `<Leader>dh` | 悬停查看变量 | `nvim-dap-ui` |
| n/v | `<Leader>dp` | 预览变量 | `nvim-dap-ui` |
| n | `<Leader>df` | 查看调用栈 | `nvim-dap-ui` |
| n | `<Leader>ds` | 查看作用域 | `nvim-dap-ui` |

### 🧭 代码结构导航（Dropbar）

| 模式 | 快捷键 | 说明 | 插件来源 |
|------|--------|------|----------|
| n | `<Leader>;` | 弹出结构选择（pick） | `dropbar.nvim` |
| n | `[c` | 跳转到上一个上下文块 | `dropbar.nvim` |
| n | `]c` | 跳转到下一个上下文块 | `dropbar.nvim` |

### 💬 注释操作

| 模式 | 快捷键 | 说明 | 插件来源 |
|------|--------|------|----------|
| n | `<Leader>cc` | 注释/取消注释当前行 | `tcomment.nvim` |
| v | `<Leader>cc` | 注释/取消注释选中区域 | `tcomment.nvim` |

### 📜 代码补全与片段

| 模式   | 快捷键       | 说明                                                                 | 插件来源          |
|--------|--------------|----------------------------------------------------------------------|-------------------|
| i, s   | `<C-b>`      | 向上滚动补全文档预览 4 行                                            | nvim-cmp          |
| i, s   | `<C-f>`      | 向下滚动补全文档预览 4 行                                            | nvim-cmp          |
| i, s   | `<C-Space>`  | 手动触发代码补全菜单                                                 | nvim-cmp          |
| i, s   | `<C-e>`      | 取消当前补全操作（关闭补全菜单）                                     | nvim-cmp          |
| i, s   | `<CR>`       | 确认选中的补全项（仅在补全可见且有选中项时生效，否则执行默认回车功能） | nvim-cmp          |
| i, s   | `<Tab>`      | 1. 补全可见时选中下一个补全项；2. 可展开/跳转 LuaSnip 片段；3. 触发补全 | nvim-cmp、LuaSnip |
| i, s   | `<S-Tab>`    | 1. 补全可见时选中上一个补全项；2. 可回退 LuaSnip 片段跳转             | nvim-cmp、LuaSnip |
---

### 其他

| 模式 | 快捷键 | 说明 | 插件来源 |
|------|--------|------|----------|
| n | `<Leader>lg` | 打开lazygit | `lazygit.nvim` |
| n | `<Leader>t` |  翻译当前光标下的单词 | `kd.nvim` |


## 📝 补充说明

1. **模式说明**：
   - `n`：普通模式（Normal mode）
   - `i`：插入模式（Insert mode）
   - `v`：可视模式（Visual mode）
   - `t`：终端模式（Terminal mode）

2. **快捷键符号说明**：
   - `<Leader>`：默认通常为空格（可自定义）
   - `<C-x>`：Ctrl + x（如`<C-a>`表示Ctrl + a）
   - `<Fx>`：功能键（如`<F5>`表示F5键）

3. **推荐配置**：
   - 因为使用了liveserver插件，如果安装失败，请手动安装`live-server`：`npm install -g live-server`
   - 设置国内npm镜像加速安装：`npm config set registry https://registry.npmmirror.com`
   - 如果使用`go.nvim`，请确保安装了Go语言环境，并设置了GOPATH和GOROOT环境变量。

4. **冲突提示**：
   - LSP相关的`<C-k>`与窗口导航的`<C-k>`存在冲突，实际使用时以后加载的配置为准
   - 建议通过`vim-which-key`查看当前生效的快捷键（通常按`<Leader>`后等待片刻会显示提示）

