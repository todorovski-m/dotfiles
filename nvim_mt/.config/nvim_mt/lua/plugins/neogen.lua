return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = {"Neogen"},
    config = function()
        require('neogen').setup {
            languages = {
                python = {
                    template = {
                        annotation_convention = "google_docstrings"
                        }
                },
            }
        }
    end,
    -- Uncomment next line if you want to follow only stable versions
    version = "*"
}
