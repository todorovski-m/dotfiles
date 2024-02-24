-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.autochdir = true
vim.opt.conceallevel = 0

vim.opt["spelllang"] = "mk,en"
vim.opt["spellfile"] = vim.fn.expand("$HOME/.config/nvim/spell/mk.utf-8.add,$HOME/.config/nvim/spell/en.utf-8.add")

-- highlight SpellBad gui=underline guifg=#E06C75
vim.cmd([[
highlight SpellBad gui=underline guisp=#E06C75
highlight SpellCap gui=underline guisp=#E06C75
]])

-- If this is in the table options iminsert gets random value 0 or 1 (changes at each nvim start)
vim.opt.keymap = "macedonian" -- switch the layout with Ctrl-^ (insert mode) copy macedonian.vim to $VIMRUNTIME/keymap/
vim.opt.iminsert = 0 -- keymap is not effective
vim.opt.imsearch = -1 -- the value of 'iminsert' is used
