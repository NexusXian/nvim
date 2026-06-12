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

English | [简体中文](README.zh-CN.md)

NexusNvim is a Lua-based Neovim configuration powered by lazy.nvim. It is built for daily coding, Go, Flutter, frontend work, C/C++, Rust, debugging, databases, AI assistance, and fast file operations.

## Features

| Module | Content |
|------|------|
| Plugin manager | `lazy.nvim` |
| Theme | `deus.nvim` |
| LSP | `nvim-lspconfig`、`mason.nvim`、`mason-lspconfig.nvim` |
| Completion | `nvim-cmp`、`LuaSnip`、`friendly-snippets`、`cmp-dotenv` |
| AI | `opencode.nvim`、`supermaven.nvim` |
| File management | `neo-tree.nvim`、`yazi.nvim` |
| Search | `telescope.nvim` |
| Git | `gitsigns.nvim`、`lazygit.nvim` |
| Debugging | `nvim-dap`、`nvim-dap-ui`、`mason-nvim-dap.nvim` |
| Languages | Go、Flutter、HTML、CSS、TypeScript、Lua、Rust、C/C++、YAML、JSON、Protobuf、Zig |
| Editing | Autopairs, comments, multi-cursor, surround, Hop, Dropbar, Treesitter, rainbow delimiters |
| Tools | ToggleTerm、LiveServer、CMake、CompetiTest、Dadbod、Notify、Presence |

## Installation

### 1. Install Neovim

Neovim `0.12+` is recommended.

```bash
# Arch Linux
sudo pacman -S neovim

# macOS
brew install neovim
```

### 2. Clone This Config

```bash
git clone -b stable https://github.com/NexusXian/nvim.git ~/.config/nvim
```

### 3. Install Common Dependencies

```bash
# Arch Linux
sudo pacman -S nodejs npm go cmake ripgrep fd lazygit

# macOS
brew install node go cmake ripgrep fd lazygit
```

### 4. Start Neovim

```bash
nvim
```

On the first launch, lazy.nvim and all plugins will be installed automatically.

## Keymaps

`<Leader>` is Space.

### Basic

| Mode | Key | Description |
|------|--------|------|
| i | `jk` | Exit insert mode |
| n | `<Leader>sa` | Select all |
| n | `Y` | Yank current line to system clipboard |
| v | `Y` | Yank selection to system clipboard |

### Files, Windows, And Buffers

| Mode | Key | Description |
|------|--------|------|
| n | `<Leader>e` | Toggle Neo-tree |
| n | `H` | Previous buffer |
| n | `L` | Next buffer |
| n | `<Leader>q` | Close current buffer |
| n | `<Leader>bo` | Close other buffers |
| n | `<Leader>br` | Close right buffers |
| n | `<Leader>bp` | Pick and close buffer |
| n | `<Leader>bs` | Pick buffer |
| n | `<C-h>` | Move to left window |
| n | `<C-j>` | Move to lower window |
| n | `<C-k>` | Move to upper window |
| n | `<C-l>` | Move to right window |
| n | `<M-Up>` | Increase window height |
| n | `<M-Down>` | Decrease window height |
| n | `<M-Right>` | Increase window width |
| n | `<M-Left>` | Decrease window width |
| n | `<Leader>vs` | Vertical split |
| n | `<Leader>sw` | Horizontal split |

### Search

| Mode | Key | Description |
|------|--------|------|
| n | `<Leader>ff` | Find files |
| n | `<Leader>fF` | Find ignored files |
| n | `<Leader>F` | Recent files |
| n | `<Leader>fb` | Search buffers |
| n | `<Leader>fB` | Search all buffers |
| n | `<Leader>o` | Functions or methods in current file |
| n | `<Leader>O` | Symbols in current file |
| n | `<Leader>fh` | Search help |
| n | `<Leader>fm` | Search marks |
| n | `<Leader>fd` | Search diagnostics |
| n | `<Leader>fc` | Search commands |
| n | `<Leader>fy` | Clipboard history |

### LSP And Diagnostics

| Mode | Key | Description |
|------|--------|------|
| n | `gd` | Go to definition |
| n | `gD` | Go to declaration |
| n | `gt` | Go to type definition |
| n | `gi` | Go to implementation |
| n | `gr` | Find references |
| n | `K` | Hover docs |
| n | `<Leader>k` | Signature help |
| n | `<Leader>ca` | Code Action |
| n | `<Leader>rn` | Rename |
| n | `<Leader>cf` | Format |
| n | `<Leader>ai` | Organize imports |
| n | `<Leader>ui` | Add missing TS imports |
| n | `[d` | Previous diagnostic |
| n | `]d` | Next diagnostic |
| n | `<Leader>dl` | Diagnostic location list / DAP run last |
| n | `<Leader>dq` | Diagnostic quickfix list |
| n | `<Leader>df` | Floating diagnostic / DAP call stack |

### Completion And Snippets

| Mode | Key | Description |
|------|--------|------|
| i, s | `<C-b>` | Scroll docs up |
| i, s | `<C-f>` | Scroll docs down |
| i, s | `<C-Space>` | Trigger completion |
| i, s | `<C-e>` | Close completion |
| i, s | `<CR>` | Confirm completion |
| i, s | `<Tab>` | Next completion item or expand snippet |
| i, s | `<S-Tab>` | Previous completion item or jump back in snippet |
| i, s | `<C-j>` | Jump to next snippet node |
| i, s | `<C-k>` | Jump to previous snippet node |

### AI

| Mode | Key | Description |
|------|--------|------|
| n, x | `<Leader>aa` | Opencode Ask |
| n, x | `<Leader>ax` | Opencode Action |
| n | `<Leader>ac` | Toggle Opencode |
| n | `go` | Add range to Opencode |
| n | `goo` | Add current line to Opencode |
| n | `<Leader>cu` | Scroll Opencode up |
| n | `<Leader>cd` | Scroll Opencode down |

### Debugging

| Mode | Key | Description |
|------|--------|------|
| n | `<F5>` | Start or continue debugging |
| n | `<F10>` | Step Over |
| n | `<F11>` | Step Into |
| n | `<F12>` | Step Out |
| n | `<F6>` | Terminate debugging |
| n | `<F9>` | Restart debugging |
| n | `<Leader>db` | Toggle breakpoint |
| n | `<Leader>dB` | Conditional breakpoint |
| n | `<Leader>lp` | Log point |
| n | `<Leader>cb` | Clear all breakpoints |
| n | `<Leader>du` | Toggle DAP UI |
| n | `<Leader>dr` | Open REPL |
| n, v | `<Leader>dh` | Inspect variable |
| n, v | `<Leader>dp` | Preview variable |
| n | `<Leader>ds` | View scopes |

### Development Tools

| Mode | Key | Description |
|------|--------|------|
| n | `<Leader>cr` | Run CompetiTest tests |
| n | `<Leader>cp` | Receive CompetiTest problem |
| n | `<Leader>fo` | Flutter Outline |
| n | `<Leader>fl` | Flutter Reload |
| n | `<Leader>fq` | Flutter Quit |
| n | `<Leader>fr` | Flutter Run |
| n | `<Leader>fe` | Select Flutter Emulator |
| n | `<Leader>gi` | Go imports |
| n | `<Leader>gmt` | Go mod tidy |
| n | `<Leader>mk` | Start Markdown preview |
| n | `<Leader>mks` | Stop Markdown preview |

### Git, Terminal, And Editing

| Mode | Key | Description |
|------|--------|------|
| n | `<Leader>lg` | Open Lazygit |
| n | `<Leader>g-` | Previous Git hunk |
| n | `<Leader>g=` | Next Git hunk |
| n | `<Leader>gb` | Current line blame |
| n | `<Leader>gr` | Reset hunk |
| n | `<Leader>H` | Preview hunk |
| n | `<Leader>gB` | Open blame window |
| n | `<C-t>` | Open terminal |
| n | `<Leader>cc` | Comment current line |
| v | `<Leader>cc` | Comment selection |
| n | `<Leader>;` | Dropbar structure picker |
| n | `[c` | Previous context |
| n | `]c` | Next context |
| n | `<Leader>ww` | HopWord |
| n | `<Leader>ll` | HopLine |

## Notes

If LiveServer installation fails, install it manually:

```bash
npm install -g live-server
```

If plugin installation is slow, set an npm mirror:

```bash
npm config set registry https://registry.npmmirror.com
```
