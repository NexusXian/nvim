local ls = require("luasnip") -- 确保你引入了 luasnip
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- hello 片段
  s("hello", {
    t({
      "package main",
      "",
      "import \"fmt\"",
      "",
      "func main() {",
      "\tfmt.Println(\"Hello, World!\")",
      "}",
    }),
  }),



  -- main 片段
  s("main", {
    t({
      "package main",
      "",
      "func main() {",
      "\t",
    }),
    i(0, "// TODO: write your code here"),
    t({
      "",
      "}",
    }),
  }),

  -- Gin Default 初始化段落：gd
  s("gd", {
    t({
      "r := gin.Default()",
      "r.LoadHTMLGlob(\"templates/*\")",
      "r.Static(\"/static\", \"./static\")",
      "r.Run(\":8080\")",
    }),
  }),

  -- errn 错误检查片段
  s("errn", {
    t({
      "if err != nil {",
      "\treturn err",
      "}",
    }),
  }),

  -- ife 带变量声明的错误检查片段
  s("iferr", {
    t("if err := "),
    i(1, "func()"),
    t("; err != nil {"),
    t({
      "\treturn err",
      "}",
    }),
  }),

  -- swg Swagger 注释片段
  s("swg", {
    t({
      "// @Summary ",
    }),
    i(1, "接口摘要"),
    t({
      "",
      "// @Description ",
    }),
    i(2, "接口描述"),
    t({
      "",
      "// @Tags ",
    }),
    i(3, "模块标签"),
    t({
      "",
      "// @Accept ",
    }),
    i(4, "json"),
    t({
      "",
      "// @Produce ",
    }),
    i(5, "json"),
    t({
      "",
      "// @Param ",
    }),
    i(6, "id query string true \"参数说明\""),
    t({
      "",
      "// @Success 200 {object} ",
    }),
    i(7, "utils.ResultUtils"),
    t({
      " \"成功说明\"",
      "// @Failure 400 {object} ",
    }),
    i(8, "utils.ResultUtils"),
    t({
      " \"失败说明\"",
      "// @Router ",
    }),
    i(9, "/path [get]"),
  }),

  -- swgup 文件上传 Swagger 注释片段
  s("swgup", {
    t({
      "// @Summary ",
    }),
    i(1, "上传文件"),
    t({
      "",
      "// @Description ",
    }),
    i(2, "上传文件描述"),
    t({
      "",
      "// @Tags ",
    }),
    i(3, "文件管理"),
    t({
      "",
      "// @Accept mpfd",
      "// @Produce json",
      "// @Param ",
    }),
    i(4, "id"),
    t({
      " formData string true \"表单字段说明\"",
      "// @Param ",
    }),
    i(5, "file"),
    t({
      " formData file true \"文件说明\"",
      "// @Success 200 {object} ",
    }),
    i(6, "utils.ResultUtils"),
    t({
      " \"上传成功\"",
      "// @Failure 400 {object} ",
    }),
    i(7, "utils.ResultUtils"),
    t({
      " \"请求无效\"",
      "// @Failure 500 {object} ",
    }),
    i(8, "utils.ResultUtils"),
    t({
      " \"服务器错误\"",
      "// @Router ",
    }),
    i(9, "/upload [post]"),
  }),
}
