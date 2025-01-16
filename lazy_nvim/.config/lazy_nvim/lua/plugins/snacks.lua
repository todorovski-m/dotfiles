-- https://manytools.org/hacker-tools/ascii-banner (Calvin S)
local header = [[
┬  ┌─┐┌─┐┬ ┬┬  ┬┬┌┬┐
│  ├─┤┌─┘└┬┘└┐┌┘││││
┴─┘┴ ┴└─┘ ┴  └┘ ┴┴ ┴
]]

local currentDate = os.date("%d.%m.%Y")
local version = vim.version()
local nvimVersion = string.format("v%d.%d.%d", version.major, version.minor, version.patch)

local function shorCWD()
  local home = vim.fn.expand("$HOME") -- Get the value of $HOME
  local cwd = vim.fn.getcwd()
  cwd = cwd:gsub("OneDrive%-Personal", "OneDrive") -- Replace "OneDrive-Personal" with "OneDrive"
  cwd = cwd:gsub("Library/CloudStorage/OneDrive", "OneDrive") -- Replace "Library/CloudStorage/OneDrive" with "OneDrive"
  cwd = cwd:gsub("^" .. home, "~") -- Replace $HOME at the start of the path with ~
  local parts = vim.split(cwd, "/") -- Split the path by "/"
  if #parts > 3 then
    return ".../" .. table.concat(vim.list_slice(parts, #parts - 2, #parts), "/") -- Add ".../" if shortened
  else
    return cwd -- Return full path if it has 3 or fewer parts
  end
end

local Snacks = require("snacks")
local gitEnabled = Snacks.git.get_root() ~= nil

return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = header,
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 4, padding = 2 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 4, padding = 2, limit = 8 },
          { icon = " ", title = "Projects", section = "projects", indent = 4, padding = 2 },
          {
            section = "terminal",
            icon = " ",
            title = "Git Status",
            enabled = gitEnabled,
            cmd = "git diff --stat -B -M -C",
            height = 8,
            indent = 2,
            ttl = 3,
          },
          { section = "startup", padding = 1 },
          { text = { nvimVersion .. "  󰻃  " .. currentDate, hl = "Title" }, align = "center", padding = 1 },
          { text = { shorCWD(), hl = "key" }, align = "center" },
        },
      },
    },
  },
}
