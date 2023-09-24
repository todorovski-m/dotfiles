return {

    -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/popup.nvim",
    -- Useful lua functions used by lots of plugins
    "nvim-lua/plenary.nvim",

    -- Surroundings of a textobject
    "machakann/vim-sandwich",
    -- Commenter
    "scrooloose/nerdcommenter",

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
    "folke/tokyonight.nvim",

    -- Snippets
    {"L3MON4D3/LuaSnip", --snippet engine <== this is required for "hrsh7th/nvim-cmp" to work!
        lazy = true,
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
    },

    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- A pretty list for showing diagnostics
    "folke/trouble.nvim",
    -- Linting
    "jose-elias-alvarez/null-ls.nvim",

    -- Git
    "lewis6991/gitsigns.nvim",

    -- Place, toggle and display marks
    "kshenoy/vim-signature",

    -- Align text
    "junegunn/vim-easy-align",

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

    -- Indentation guides to all lines
    "lukas-reineke/indent-blankline.nvim",

    -- General-purpose motion plugin
    "ggandor/leap.nvim",

    -- Make quickfix window better
    "kevinhwang91/nvim-bqf",
    "junegunn/fzf",

    -- Easily interact with tmux from vim
    "preservim/vimux",

    -- Neovim wrapper for GDB, LLDB, PDB/PDB++ and BashDB
    "sakhnik/nvim-gdb",

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
