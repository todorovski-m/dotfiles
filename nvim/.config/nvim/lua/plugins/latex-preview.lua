return {
  "sonv/latex-preview.nvim",
  dependencies = { "folke/snacks.nvim" },
  ft = { "tex", "latex", "markdown", "rmd", "quarto" },
  opts = {
    setup_keymap = true, -- bind <leader>ih in supported filetypes
    cache = false, -- persist renders to disk
    cache_dir = "preview", -- default: <texfile-dir>/aux/latex-preview-cache/
  },
}
