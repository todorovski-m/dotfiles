return {
  "nvim-mini/mini.trailspace",
  event = "VeryLazy",
  config = function()
    require("mini.trailspace").setup()

    -- Auto-trim trailing whitespace on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        require("mini.trailspace").trim()
      end,
    })
  end,
}
