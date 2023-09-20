vim.g["EasyClipUseCutDefaults"] = 0
--change the mapping for cut to x (by default set to m)
-- map g- to c-x so the latter will be free for cut (keymaps.lua)
-- map g= to c-a as in doom emacs
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<C-x>", "<Plug>MoveMotionPlug", opts)
keymap("x", "<C-x>", "<Plug>MoveMotionXPlug", opts)
-- use gs for substitute
keymap("n", "ss", "<Plug>SubstituteOverMotionMap", opts)
keymap("x", "ss", "<Plug>XEasyClipPaste", opts)
