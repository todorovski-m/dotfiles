local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

    -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/popup.nvim",
    -- Useful lua functions used by lots of plugins
    "nvim-lua/plenary.nvim",

    -- Auto pairs
    "windwp/nvim-autopairs",
    -- Surroundings of a textobject
    "machakann/vim-sandwich",
    -- Commenter
    "scrooloose/nerdcommenter",

    -- A File Explorer
    "kyazdani42/nvim-web-devicons",
    "kyazdani42/nvim-tree.lua",

    "akinsho/bufferline.nvim",
    "nvim-lualine/lualine.nvim",
    "folke/which-key.nvim",

    -- Greeter
    "goolord/alpha-nvim",
    -- Sessions
    "Shatur/neovim-session-manager",
    "stevearc/dressing.nvim",

    -- Syntax checking (needed for fortran)
    "dense-analysis/ale",
    --Undo tree
    "mbbill/undotree",
    -- Run code
    "erietz/vim-terminator",

    -- Colorschemes
    "lunarvim/darkplus.nvim",
    "joshdick/onedark.vim",
    "morhetz/gruvbox",
    "LunarVim/Colorschemes",
    "catppuccin/nvim",
    "EdenEast/nightfox.nvim",
    "rose-pine/neovim",
    "rebelot/kanagawa.nvim",
    "Mofiqul/dracula.nvim",

    -- Completion plugins
    "hrsh7th/nvim-cmp", -- the completion plugin
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-nvim-lsp",

    -- Snippets
    "L3MON4D3/LuaSnip", --snippet engine <== this is required for "hrsh7th/nvim-cmp" to work!
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use
    "saadparwaiz1/cmp_luasnip", -- snippet completions

    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- Telescope
    "nvim-telescope/telescope.nvim",

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-context",

    -- Git
    "lewis6991/gitsigns.nvim",
    "kdheepak/lazygit.nvim",

    -- Place, toggle and display marks
    "kshenoy/vim-signature",

    -- Align text
    "junegunn/vim-easy-align",

    -- LaTex
    "lervag/vimtex",

    -- Simplified clipboard functionality
    "svermeulen/vim-easyclip",

    -- Registers
    "tversteeg/registers.nvim",

    -- Debugging
    "mfussenegger/nvim-dap",
    -- default debug configurations for Python (requires debugpy)
    "mfussenegger/nvim-dap-python",
    -- UI/UX extensions for nvim-dap that provide a better user experience
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",

    -- Indentation guides to all lines
    "lukas-reineke/indent-blankline.nvim",

    -- Org Mode
    "nvim-orgmode/orgmode",
    "akinsho/org-bullets.nvim",

    -- General-purpose motion plugin
    "ggandor/leap.nvim",

    -- Todo comments
    "folke/todo-comments.nvim",

    -- Make quickfix window better
    "kevinhwang91/nvim-bqf",
    "junegunn/fzf",

    -- Easily interact with tmux from vim
    "preservim/vimux",

    -- Neovim wrapper for GDB, LLDB, PDB/PDB++ and BashDB
    "sakhnik/nvim-gdb",

    -- Displaying the colours in the file
    {"rrethy/vim-hexokinase", build = "make"},

    -- Generate annotation for function, class or other relevant type
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },

    -- Macro management and execution
    {
        "ecthelionvi/NeoComposer.nvim",
        dependencies = { "kkharji/sqlite.lua" }
    },

    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    }

}

local opts = {
    defaults = {
    lazy = false, -- should plugins be lazy-loaded?
    version = nil,
    -- default `cond` you can use to globally disable a lot of plugins
    -- when running inside vscode for example
    cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
    -- version = "*", -- enable this to try installing the latest stable versions of plugins
  },
}

require("lazy").setup(plugins, opts)
