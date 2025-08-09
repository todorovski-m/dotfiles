return {
  -- add colorschemes
  { "rebelot/kanagawa.nvim" },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        color_overrides = {
          all = {},
          latte = {},
          frappe = {},
          macchiato = {},
          mocha = {
            -- base = "#000000",
            -- mantle = "#000000",
            -- crust = "#000000",
          },
        },
      })
    end,
  },
}
