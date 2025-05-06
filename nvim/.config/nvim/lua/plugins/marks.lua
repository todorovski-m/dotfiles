return {
  "chentoast/marks.nvim",
  event = "FileType",
  keys = {
    { "m/", "<cmd>MarksListAll<CR>", desc = "Marks from all opened buffers" },
    { "ml", "<cmd>Telescope marks<cr>", desc = "List marks in Telescope" },
  },
  opts = {
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
  },
}
