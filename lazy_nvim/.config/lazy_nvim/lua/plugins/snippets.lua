return {
  "rafamadriz/friendly-snippets",
  lazy = true,
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets/" } })
  end,
}
