return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'c', 'cpp', 'go', 'lua', 'html', 'css', 'javascript', 'java', 'dart', 'python', 'rust', 'typescript', 'tsx',
      'graphql', 'vue', 'yaml', 'json', 'markdown', 'toml', 'html', 'css', 'javascript', 'java', 'dart', 'python', 'rust',
      'typescript', 'tsx', 'graphql', 'vue', 'yaml', 'json', 'markdown', 'toml', 'html', 'css', 'javascript', 'java',
      'dart', 'python', 'rust', 'typescript', 'tsx', 'graphql', 'vue', 'yaml', 'json', 'markdown', 'toml',
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
