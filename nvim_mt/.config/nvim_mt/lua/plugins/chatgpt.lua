return {
  "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
        vim.env.OPENAI_API_KEY = vim.fn.getenv("KEY_1") .. vim.fn.getenv("KEY_7")
        require ("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
}
