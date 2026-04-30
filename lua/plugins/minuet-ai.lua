return {
  'milanglacier/minuet-ai.nvim',
  config = function()
    require('minuet').setup({
      virtualtext = {
        auto_trigger_ft = {
          "*"
        },
        keymap = {
          -- accept one line
          accept_line = '<C-l>',
          -- accept one line
          dismiss = '<A-e>',
        },
      },
      provider = 'openai_fim_compatible',
      provider_options = {
        openai_fim_compatible = {
          api_key = 'DEEPSEEK_API_KEY',
          name = 'deepseek',
          model = 'deepseek-v4-flash',
          optional = {
            max_token = 256,
            top_p = 0.9,
          }
        }
      }
    })
  end,
}
