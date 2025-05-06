return {
  "LintaoAmons/bookmarks.nvim",
  -- pin the plugin at specific version for stability
  -- backup your bookmark sqlite db when there are breaking changes
  -- tag = "v2.3.0",
  dependencies = {
    { "kkharji/sqlite.lua" },
    { "nvim-telescope/telescope.nvim" },
    { "stevearc/dressing.nvim" }, -- optional: better UI
  },
  keys = {
    { "<leader>m", "", desc = "+bookmarks" },
    { "<leader>mt", "<cmd>BookmarksMark<cr>", desc = "Toggle bookmark" },
    { "<leader>mg", "<cmd>BookmarksGoto<cr>", desc = "Go to bookmark" },
    { "<leader>ml", "<cmd>BookmarksLists<cr>", desc = "Pick a bookmark list" },
    { "<leader>mT", "<cmd>BookmarksTree<cr>", desc = "Bookmarks tree" },
    { "<leader>m]", "<cmd>BookmarksGotoNext<cr>", desc = "Go to next bookmark" },
    { "<leader>m[", "<cmd>BookmarksGotoPrev<cr>", desc = "Go to previous bookmark" },
  },
  config = function()
    local opts = { -- check the "./lua/bookmarks/default-config.lua" file for all the options
      -- Directory to store the database file
      db_dir = "/Users/mirko/OneDrive/Mirko",
      -- Bookmarks sign configurations
      signs = {
        mark = {
          icon = "󰃁",
          color = "#FFA07A",
          line_bg = "",
        },
      },
    }
    require("bookmarks").setup(opts) -- you must call setup to init sqlite db
  end,
}
-- run :BookmarksInfo to see the running status of the plugin
