vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("config.bootstrap")
local opts = require("config.lazy-defaults")
require("lazy").setup("plugins", opts) -- lua/plugins/init.lua

require("config.options")
require("config.keymaps")
require("config.colorscheme")
require("config.setspell")
require("config.gitsigns")
require("config.bufferline")
require("config.lualine")
require("config.ale")
require("config.autocommands")
require("config.whichkey")
require("config.alpha")
require("config.session")
require("config.easyclip")
require("config.dap")
require("config.leap")
require("config.nvimgdb")
require("config.functions")
require("config.lsp-config")
require("config.diagnostics")
require("config.null-ls")
