return {
  'Wansmer/symbol-usage.nvim',
  event = 'LspAttach',
  config = function()
    require('symbol-usage').setup({
      -- 可选配置
      vt_position = 'end_of_line', -- 行尾显示
    })
  end
}
