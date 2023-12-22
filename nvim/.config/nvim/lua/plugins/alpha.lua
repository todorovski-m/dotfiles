return {
    "goolord/alpha-nvim",
    opts = function()
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
            [[┌┐┌┬─┐┌─┐┬  ┬┬┌┬┐]],
            [[│││├┤ │ │└┐┌┘││││]],
            [[┘└┘└─┘└─┘ └┘ ┴┴ ┴]],
        }
        dashboard.section.buttons.val = {
            dashboard.button("a", "  Agenda", ":lua require('orgmode').action('agenda.prompt')<CR>"),
            dashboard.button("h", "  Bookmarked directories", ":call fzf#run({'down': 10, 'source': 'cat ~/.config/zsh/bookmarks.txt', 'sink': 'cd' })<CR>"),
            dashboard.button("g", "  Find directory", ":call fzf#run({'down': 10, 'source': 'find . -type d', 'sink': 'cd' })<CR>"),
            dashboard.button("f", "󰥩  Find file", ":Telescope find_files <CR>"),
            dashboard.button("n", "  New file", ":enew <CR>"),
            dashboard.button("l", "  Load session", ":SessionManager load_session<CR>"),
            dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
            dashboard.button("o", "  Org mode files", ":e ~/Dropbox/Mirko/org <CR>"),
            dashboard.button(".", "  Dotfiles", ":e ~/Dropbox/Mirko/dotfiles <CR>"),
            dashboard.button("q", "󰿅  Quit Neovim", ":qa<CR>"),
        }
        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"
        dashboard.opts.opts.noautocmd = true
        return dashboard
    end,
    config = function(_, dashboard)
        require("alpha").setup(dashboard.opts)
        vim.api.nvim_create_autocmd("User", {
            callback = function()
                local datetime = os.date "%d.%m.%Y"
                local plugins_count = 0
                local v = vim.version()
                local plugins = require("lazy").plugins()
                for _, _ in pairs(plugins) do
                    plugins_count = plugins_count + 1
                end
                local stats = require("lazy").stats()
                local f = string.format("v%d.%d.%d    %s    %d/%d plugins (%.1f ms)", v.major, v.minor, v.patch, datetime, stats.loaded, plugins_count, stats.startuptime)
                dashboard.section.footer.val = f
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
