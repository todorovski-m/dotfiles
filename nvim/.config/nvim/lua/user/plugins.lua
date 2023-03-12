local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  max_jobs = 16, -- Limit the number of simultaneous jobs. nil means no limit
}

-- Install your plugins here
return packer.startup(function(use)

    -- Have packer manage itself
    use "wbthomason/packer.nvim"
    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/popup.nvim"
    -- Useful lua functions used by lots of plugins
    use "nvim-lua/plenary.nvim"

    -- Auto pairs
    use "windwp/nvim-autopairs"
    -- Surroundings of a textobject
    use "machakann/vim-sandwich"
    -- Commenter
    use "scrooloose/nerdcommenter"
    -- use "numToStr/Comment.nvim"

    -- A File Explorer
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"

    use "akinsho/bufferline.nvim"
    use "nvim-lualine/lualine.nvim"
    use "antoinemadec/FixCursorHold.nvim" -- needed to fix lsp doc highlight
    use "folke/which-key.nvim"

    -- Toggle terminal
    use "akinsho/toggleterm.nvim"

    -- Greeter
    use "goolord/alpha-nvim"
    -- Sessions
    use "Shatur/neovim-session-manager"
    use "stevearc/dressing.nvim"

    -- Syntax checking (needed for fortran)
    use "dense-analysis/ale"
    --Undo tree
    use "mbbill/undotree"
    -- Run code
    use "erietz/vim-terminator"

    -- Colorschemes
    use "lunarvim/darkplus.nvim"
    use "joshdick/onedark.vim"
    use "morhetz/gruvbox"
    use "LunarVim/Colorschemes"
    use "catppuccin/nvim"
    use "EdenEast/nightfox.nvim"
    use "rose-pine/neovim"
    use "rebelot/kanagawa.nvim"

    -- Completion plugins
    use "hrsh7th/nvim-cmp" -- the completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-nvim-lsp"

    -- Snippets
    use "L3MON4D3/LuaSnip" --snippet engine <== this is required for "hrsh7th/nvim-cmp" to work!
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    use "saadparwaiz1/cmp_luasnip" -- snippet completions

    -- LSP
    -- enable LSP
    use "neovim/nvim-lspconfig"
    -- simple to use language server installer
    use "williamboman/nvim-lsp-installer"
    -- language server settings defined in json for
    use "tamago324/nlsp-settings.nvim"

    -- Telescope
    use "nvim-telescope/telescope.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "nvim-treesitter/playground"

    -- Git
    use "lewis6991/gitsigns.nvim"
    --use "tpope/vim-fugitive"
    --use "tpope/vim-rhubarb"
    use "kdheepak/lazygit.nvim"

    -- Place, toggle and display marks
    use "kshenoy/vim-signature"

    -- Align text
    use "junegunn/vim-easy-align"

    -- LaTex
    use "lervag/vimtex"

    -- Simplified clipboard functionality
    use "svermeulen/vim-easyclip"

    -- Themes
    use "dylanaraps/wal.vim"

    -- Registers
    use "tversteeg/registers.nvim"

    -- Debugging
    use "mfussenegger/nvim-dap"
    -- default debug configurations for Python (requires debugpy)
    use "mfussenegger/nvim-dap-python"
    -- UI/UX extensions for nvim-dap that provide a better user experience
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"
    use "nvim-telescope/telescope-dap.nvim"

    -- Indentation guides to all lines
    use "lukas-reineke/indent-blankline.nvim"

    -- Org Mode
    use "nvim-orgmode/orgmode"
    use "akinsho/org-bullets.nvim"

    -- General-purpose motion plugin
    use "ggandor/leap.nvim"

    -- Todo comments
    use "folke/todo-comments.nvim"

    -- Make quickfix window better
    use "kevinhwang91/nvim-bqf"
    use "junegunn/fzf"

    -- Easily interact with tmux from vim
    use "preservim/vimux"

    -- Neovim wrapper for GDB, LLDB, PDB/PDB++ and BashDB
    use "sakhnik/nvim-gdb"

    -- Displaying the colours in the file
    use {"rrethy/vim-hexokinase", run = "make"}

    -- Generate annotation for function, class or other relevant type
    use {
        "danymat/neogen",
        config = function()
            require('neogen').setup {}
        end,
        requires = "nvim-treesitter/nvim-treesitter",
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
