return {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        presets = {
            bottom_search = false,
            lsp_doc_border = false,
        },
        messages = {
            enabled = true,
        },
        routes = {
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                },
                opts = { skip = true },
            },
        }
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
}
