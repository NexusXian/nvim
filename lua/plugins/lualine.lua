return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- 显示当前激活的 LSP 服务器（使用新 API 避免弃用警告）
    local function lsp_client()
      -- 新 API：vim.lsp.get_clients() 替代 vim.lsp.get_active_clients()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if #clients == 0 then
        return ""
      end
      local client_names = {}
      for _, client in ipairs(clients) do
        table.insert(client_names, client.name)
      end
      return " " .. table.concat(client_names, " | ")
    end

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',  -- 自动适配主题
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        globalstatus = true,  -- 启用全局状态栏（推荐）
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          { 'filename', path = 1 },  -- 显示相对路径
          {
            function() return ' ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':~') end,
            color = { fg = '#888888' },
          },
        },
        lualine_x = { lsp_client, 'encoding', 'fileformat', 'filetype' },  -- 显示 LSP 状态
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      extensions = { 'nvim-tree', 'fugitive' }  -- 扩展支持
    }
  end
}
