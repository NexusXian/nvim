local ls = require("luasnip") -- 确保你引入了 luasnip
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
return {
  -- TODO 任务标记
  s("td", {
    t("-- TODO: "),
    i(1, "任务描述"),
    t({ "", "" }),
    i(0),
  }),
}
