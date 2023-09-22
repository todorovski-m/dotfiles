return {
   -- A File Explorer
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle" },
  event = { "DirChanged" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
        update_focused_file = {
            enable = true,
            update_cwd = true,
        },
    }
  end,
}
