return {
   -- A File Explorer
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle" },
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
