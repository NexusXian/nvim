---

# Neovim 配置  

## 前言  

你是否讨厌在浏览器（Electron）中写代码？  
你是否因为在重型 IDE 中工作感到麻烦？  

那就来试试 **Neovim** 吧！  

### 为什么不用 Vim?  
~~我个人不喜欢任何在开源软件中夹带政治立场。~~  

或许你已经尝试过诸如 LazyVim 等开箱即用的 Neovim 配置，但这些配置通常显得**过于复杂**：  

- 快捷键设置很多，但绝大部分用不上；  
- 文件结构复杂，难以理解。  

如果你希望用少量插件实现 IDE 的大部分功能，那么我的这套配置将是一个非常合适的选择。  

---

## 配置特点  

- **代码高亮**  
- **代码补全**  
- **AI 助手**  
- **项目调试**  
- **多窗口支持**  
- **多语言支持**  
  - 本人主要开发 Go，但目前也支持 C/C++、Java、Python。  

---

## 核心插件  

- [packer.nvim](https://github.com/wbthomason/packer.nvim) - 插件管理器  
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua) - 文件树浏览  
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP 客户端配置  
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP 安装管理器  
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - 与 Mason 集成的 LSP 配置  
- [coc.nvim](https://github.com/neoclide/coc.nvim) - 代码补全与智能感知  
- [supermaven-nvim](https://github.com/NexusXian/supermaven-nvim) - Maven 集成支持  
- [vim-surround](https://github.com/tpope/vim-surround) - 操作括号和引号的插件  
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - 浮动终端  
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - 状态栏插件  
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - 标签页插件  
- [dracula.nvim](https://github.com/dracula/vim) - Dracula 主题  
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - 代码解析器  

---

## 快捷键  

**其中 `<leader>` 为空格键**  

| 快捷键                | 功能                                            |  
|-----------------------|-------------------------------------------------|  
| `<leader> + e`        | 打开文件树（nvim-tree）                         |  
| `r`                   | 运行 Go、C++、C、Java 程序，再次点击 `r` 停止程序 |  
| `<ctrl> + p / f`      | 分别为模糊查找文件和全局查找文件                 |  
| `<alt> + h/j/k/l`     | 在不同窗口中跳转（左、下、上、右）               |  
| `<ctrl> + h/l`        | 在不同标签中跳转（左、右）                       |  
| `<leader> + t`        | 打开浮动终端                                    |  
| `<leader> + w`        | 关闭当前窗口                                    |  

---

## 安装  

### 推荐的初始备份  
运行以下命令备份当前的 Neovim 配置：  

```bash  
mv ~/.config/nvim{,.bak}  # 配置文件  
mv ~/.local/share/nvim{,.bak}  # 插件数据（推荐）  
mv ~/.local/state/nvim{,.bak}  # 状态文件（推荐）  
mv ~/.cache/nvim{,.bak}  # 缓存文件（推荐）  
```  

### 克隆配置  
将此配置克隆到本地：  

```bash  
git clone git@github.com:NexusXian/nvim.git ~/.config/nvim  
```  

### 安装插件  
打开 Neovim 并运行以下命令同步插件：  

```bash  
:PackerSync  
```  

每次修改 `plugins.lua` 文件后，只需执行 `:w` 保存即可更新或安装插件（不要直接 `:wq` 退出）。  

---

试试这套简单又强大的 Neovim 配置吧！  

--- 

