return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        opts = {
          -- show_defaults 会导致copilot不能正常工作
          show_defaults = true,
          -- log_level = "DEBUG",
        },

        deepseek = function()
          return require("codecompanion.adapters").extend("deepseek", {
            name = "deepseek",
            env = {
              api_key = function()
                return os.getenv("DEEPSEEK_API_KEY")
              end,
            },
            schema = {
              model = {
                default = "deepseek-coder",
              },
            },
          })
        end,

        siliconflow_r1 = function()
          return require("codecompanion.adapters").extend("deepseek", {
            name = "siliconflow_r1",
            url = "https://api.siliconflow.cn/v1/chat/completions",
            env = {
              api_key = function()
                return os.getenv("DEEPSEEK_API_KEY_S")
              end,
            },
            schema = {
              model = {
                default = "deepseek-ai/DeepSeek-R1",
                choices = {
                  ["deepseek-ai/DeepSeek-R1"] = { opts = { can_reason = true } },
                  "deepseek-ai/DeepSeek-V3",
                },
              },
            },
          })
        end,

        siliconflow_v3 = function()
          return require("codecompanion.adapters").extend("deepseek", {
            name = "siliconflow_v3",
            url = "https://api.siliconflow.cn/v1/chat/completions",
            env = {
              api_key = function()
                return os.getenv("DEEPSEEK_API_KEY_S")
              end,
            },
            schema = {
              model = {
                default = "deepseek-ai/DeepSeek-V3",
                choices = {
                  "deepseek-ai/DeepSeek-V3",
                  ["deepseek-ai/DeepSeek-R1"] = { opts = { can_reason = true } },
                },
              },
            },
          })
        end,

        aliyun_deepseek = function()
          return require("codecompanion.adapters").extend("deepseek", {
            name = "aliyun_deepseek",
            url = "https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions",
            env = {
              api_key = function()
                return os.getenv("DEEPSEEK_API_ALIYUN")
              end,
            },
            schema = {
              model = {
                default = "deepseek-r1",
                choices = {
                  ["deepseek-r1"] = { opts = { can_reason = true } },
                },
              },
            },
          })
        end,

        aliyun_qwen = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            name = "aliyun_qwen",
            env = {
              url = "https://dashscope.aliyuncs.com",
              api_key = function()
                return os.getenv("DEEPSEEK_API_ALIYUN")
              end,
              chat_url = "/compatible-mode/v1/chat/completions",
            },
            schema = {
              model = {
                default = "qwen-coder-plus-latest",
              },
            },
          })
        end,

        copilot_claude = function()
          return require("codecompanion.adapters").extend("copilot", {
            name = "copilot_claude",
            schema = {
              model = {
                default = "claude-3.7-sonnet",
              },
            },
          })
        end,
      },

      strategies = {
        chat = { adapter = "aliyun_deepseek" },
        inline = { adapter = "aliyun_qwen" },
      },

      opts = {
        language = "Chinese",
      },
    })
  end,
}
