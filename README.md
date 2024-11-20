# Neovim Configuration  

## Introduction  

Do you dislike writing code in browser-based editors (e.g., Electron)?  
Are you frustrated with the heaviness of traditional IDEs?  

If so, it's time to give **Neovim** a try!  

### Why Not Vim?  
~~I personally dislike political opinions in open-source software.~~  

You may have tried various out-of-the-box Neovim configurations, such as LazyVim, but these setups often come with their own set of problems:  

- Too many unnecessary keybindings.  
- Complex and hard-to-read file structures.  

If you're looking for a lightweight configuration that uses just a few plugins to achieve most IDE features, this setup is for you!  

---

## Features  

- **Code highlighting**  
- **Code completion**  
- **AI assistant**  
- **Project debugging**  
- **Multi-window support**  
- **Multi-language support**  
  - Primarily optimized for Go, but also supports C/C++, Java, and Python.  

---

## Core Plugins  

- [packer.nvim](https://github.com/wbthomason/packer.nvim) - Plugin manager  
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua) - File tree explorer  
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP client configuration  
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP installer and manager  
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Mason-LSP integration  
- [coc.nvim](https://github.com/neoclide/coc.nvim) - Code completion and IntelliSense  
- [supermaven-nvim](https://github.com/NexusXian/supermaven-nvim) - Maven integration  
- [vim-surround](https://github.com/tpope/vim-surround) - Bracket and quote operations  
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - Floating terminal  
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Status line plugin  
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - Tab bar management  
- [dracula.nvim](https://github.com/dracula/vim) - Dracula color scheme  
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Code syntax parser  

---

## Keybindings  

**`<leader>` refers to the Space key**  

| Keybinding            | Description                                     |  
|-----------------------|-------------------------------------------------|  
| `<leader> + e`        | Open the file explorer (nvim-tree)              |  
| `r`                   | Run Go, C++, C, or Java programs; press `r` again to stop |  
| `<ctrl> + p / f`      | Fuzzy file search / global file search          |  
| `<alt> + h/j/k/l`     | Navigate between windows (left, down, up, right)|  
| `<ctrl> + h/l`        | Switch between tabs (left, right)               |  
| `<leader> + t`        | Open a floating terminal                        |  
| `<leader> + w`        | Close the current window                        |  

---

## Installation  

### Recommended Backup  
Backup your current Neovim configuration before proceeding:  

```bash  
mv ~/.config/nvim{,.bak}  # Configuration files  
mv ~/.local/share/nvim{,.bak}  # Plugin data (recommended)  
mv ~/.local/state/nvim{,.bak}  # State files (recommended)  
mv ~/.cache/nvim{,.bak}  # Cache files (recommended)  
```  

### Clone the Configuration  
Clone this repository to your local system:  

```bash  
git clone git@github.com:NexusXian/nvim.git ~/.config/nvim  
```  

### Install Plugins  
Launch Neovim and run the following command to sync plugins:  

```bash  
:PackerSync  
```  

Whenever you modify the `plugins.lua` file, simply save it using `:w` to update or install new plugins (avoid using `:wq` directly).  

---

Try this lightweight yet powerful Neovim setup and take your coding experience to the next level!  

---  

