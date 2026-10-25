-- C# / Unity：Roslyn LSP（与 VS Code C# 扩展同款服务器）
return {
  "seblyng/roslyn.nvim",
  ft = { "cs", "razor" },
  dependencies = { "williamboman/mason.nvim", "saghen/blink.cmp" },
  opts = {
    -- Unity 项目文件很多，交给 roslyn 自己做文件监听更省资源
    filewatching = "roslyn",
    -- Unity 生成的 .sln 在项目根目录，锁定首次选中的 solution
    lock_target = true,
  },
  config = function(_, opts)
    local lsp_common = require("config.lspconfig.init")

    vim.lsp.config("roslyn", {
      capabilities = lsp_common.capabilities,
      settings = {
        ["csharp|inlay_hints"] = {
          csharp_enable_inlay_hints_for_implicit_object_creation = true,
          csharp_enable_inlay_hints_for_implicit_variable_types = true,
          csharp_enable_inlay_hints_for_lambda_parameter_types = true,
          dotnet_enable_inlay_hints_for_parameters = true,
        },
        ["csharp|completion"] = {
          dotnet_show_completion_items_from_unimported_namespaces = true,
          dotnet_show_name_completion_suggestions = true,
        },
        ["csharp|background_analysis"] = {
          dotnet_analyzer_diagnostics_scope = "openFiles",
          dotnet_compiler_diagnostics_scope = "fullSolution",
        },
        ["csharp|symbol_search"] = {
          dotnet_search_reference_assemblies = true,
        },
      },
    })

    require("roslyn").setup(opts)
  end,
}
