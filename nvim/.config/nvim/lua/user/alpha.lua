local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

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
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("n", "  New file", ":enew <CR>"),
	dashboard.button("l", "  Load session", ":SessionManager load_session<CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("o", "  Org mode files", ":e ~/Dropbox/Mirko/org <CR>"),
	dashboard.button(".", "  Dotfiles", ":e ~/Dropbox/Mirko/dotfiles <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
  local datetime = os.date "%d.%m.%Y"
  local v = vim.version()
  local plugins_count = 0
  local plugins = require('lazy').plugins()
  for _, _ in pairs(plugins) do
      plugins_count = plugins_count + 1
  end
  return string.format("v%d.%d.%d    %s    %d plugins", v.major, v.minor, v.patch, datetime, plugins_count)
end


dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
