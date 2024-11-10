return {
  "L3MON4D3/LuaSnip",
  lazy = true, -- Lazy-load LuaSnip
  event = "InsertEnter", -- Load when entering insert mode
  config = function()
    -- Load LuaSnip's snippet configuration
    local ls = require("luasnip")
    local s = ls.snippet -- Shortcut for snippet creation
    local t = ls.text_node -- Shortcut for text nodes

    -- Define snippets directly here
    ls.add_snippets("all", {
      s(";true", t("⊤")),
      s(";false", t("⊥")),
      s(";and", t("∧")),
      s(";or", t("∨")),
      s(";not", t("¬")),
      s(";implies", t("→")),
    })
  end,
}
