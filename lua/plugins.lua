local packer = require("packer")
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
    -- dracula colortheme
    use 'Mofiqul/dracula.nvim'
    -- nvim-tree
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- bufferline 
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    -- mason
    use {"williamboman/mason.nvim"}
    -- lsp-config
    use{"neovim/nvim-lspconfig"}
    -- mason-lspconfig
    -- startup
    use {
  "startup-nvim/startup.nvim",
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim"},
  config = function()
    require"startup".setup()
  end
}
    use{"williamboman/mason-lspconfig.nvim"}
    -- coc
    use {'neoclide/coc.nvim', branch = 'release'}
    -- autopairs
    -- codeformat
    -- supermaven
    use {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({})
      end,
    }
    -- surround
    use "tpope/vim-surround"
    --toggleterm
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup {
    direction = "float",
    float_opts = {
      border = "curved",
      width = math.floor(vim.o.columns * 0.8),
      height = math.floor(vim.o.lines * 0.8),
    }
  }
end}
    --smoothcursor
    use { 'gen740/SmoothCursor.nvim',
  config = function()
    require('smoothcursor').setup()
  end
}
        -- Auto Pairs 插件
    use 'windwp/nvim-autopairs'
    -- nvim-cmp
        -- nvim-cmp 核心插件
    use 'hrsh7th/nvim-cmp'

    -- 补全源（根据需要安装）
    use 'hrsh7th/cmp-nvim-lsp'       -- LSP 支持
    use 'hrsh7th/cmp-buffer'         -- 缓冲区补全
    use 'hrsh7th/cmp-path'           -- 文件路径补全
    use 'hrsh7th/cmp-cmdline'        -- 命令行补全

    -- 可选：代码片段引擎（LuaSnip）
    use 'L3MON4D3/LuaSnip'           -- 代码片段引擎
    use 'saadparwaiz1/cmp_luasnip'   -- LuaSnip 的 nvim-cmp 源

    -- 可选：其他增强插件
    use 'onsails/lspkind-nvim'
    -- multi cursor
    use 'mg979/vim-visual-multi'
    -- hlargs 
    use { 'm-demare/hlargs.nvim' }
    -- raino-ts-
    use {'p00f/nvim-ts-rainbow'}
    ------------------------------------------------------------------------------
  end,
  config = {
      display = {
          open_fn = function()
              return require("packer.util").float({ border = "single" })
          end,
      },
    -- 并发数限制
    max_jobs = 16,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
  },
})

pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)

