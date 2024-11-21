local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_lines = 1000,
  max_num_results = 20,
  sort = true,
  run_on_every_keystroke = true,
  snippet_placeholder = ' ',
  ignored_file_types = {
    -- 默认不忽略任何文件类型
    -- lua = true -- 如果需要忽略 Lua 文件，取消注释
  },
  show_prediction_strength = false,
  min_percent = 0
})
