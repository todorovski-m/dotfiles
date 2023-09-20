vim.opt["spelllang"] = "mk,en"
vim.opt["spellfile"] = "/home/mirko/.config/nvim/spell/mk.utf-8.add,/home/mirko/.config/nvim/spell/en.utf-8.add"

-- highlight SpellBad gui=underline guifg=#E06C75
vim.cmd [[
highlight SpellBad gui=underline guisp=#E06C75
highlight SpellCap gui=underline guisp=#E06C75
]]

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<F7>", ":Telescope spell_suggest<CR>", opts)
