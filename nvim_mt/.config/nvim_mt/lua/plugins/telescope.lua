return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function ()
        require("telescope").setup({
            pickers = {
                colorscheme = {
                enable_preview = true
                },
            },
            vimgrep_arguments = {
                "rg",
                "--with-filename",
                "--line-number",
                "--ignore-case",
                "--recursive",
                "--no-messages",
                "--exclude-dir=*cache*",
                "--exclude-dir=*.git",
            },
        })
    end
}
