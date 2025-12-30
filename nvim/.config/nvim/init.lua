-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("lspconfig").fortls.setup({})

vim.api.nvim_set_hl(0, "SpellBad", {
  undercurl = false,
  underline = true,
  sp = "#f7768e", -- underline color
})
