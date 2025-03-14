return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    views = {
      cmdline_popup = {
        position = {
          row = "50%",
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
    },
    presets = {
      bottom_search = false,
    },
    -- https://github.com/NormalNvim/NormalNvim/blob/c44fa82ae6c6eb3106419db5917e95a59ffec2d8/lua/plugins/2-ui.lua#L715
    -- Disable every other noice feature
    messages = { enabled = false },
    lsp = {
      hover = { enabled = false },
      signature = { enabled = false },
      progress = { enabled = false },
      message = { enabled = false },
      smart_move = { enabled = false },
    },
  },
}
