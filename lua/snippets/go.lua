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
}
