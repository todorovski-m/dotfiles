return {
  {
    "junegunn/vim-easy-align",
  },
  {
    "svermeulen/vim-easyclip",
    init = function()
      -- Disable default mappings BEFORE plugin is loaded
      vim.g.EasyClipUseCutDefaults = 0
    end,
    config = function()
      -- Your custom mappings
      vim.keymap.set("n", "<C-x>", "<Plug>MoveMotionPlug")
      vim.keymap.set("x", "<C-x>", "<Plug>MoveMotionXPlug")
      vim.keymap.set("n", "ss", "<Plug>SubstituteOverMotionMap")
      vim.keymap.set("x", "ss", "<Plug>XEasyClipPaste")
    end,
  },
}
