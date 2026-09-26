return {
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    opts = {
      invert_colors = "never",
      extra_args = {
        "--input=preview=true",
      },
    },
    keys = {
      { "<leader>tp", "<cmd>TypstPreviewToggle<cr>", desc = "Toggle Typst Preview" },
    },
  },
}
