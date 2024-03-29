return {
    "hrsh7th/nvim-cmp" ,
    event = {"InsertEnter"},
    opts = function(_, opts)
    -- opts function begins and overrides default behavior

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets/" } })

    -- Confirmaiton options
    local confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
    }

    -- Add boarders to completion windows
    local window = {
        completion = {
            border = "rounded",
            winhighlight = 'Normal:Pmenu,FloatBorder:Comment,CursorLine:PmenuSel,Search:Pmenu',
        },
        documentation = {
            border = "rounded",
            winhighlight = 'Normal:Pmenu,FloatBorder:Comment,CursorLine:PmenuSel,Search:Pmenu',
        },
    }

    -- Has words before
    local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
    end

    -- lsp kind icons
    local kind_icons = {
        Class = "",
        Color = "",
        Constant = "",
        Constructor = "",
        Enum = "",
        EnumMember = "",
        Event = "",
        Field = "",
        File = "",
        Folder = "",
        Function = "",
        Interface = "",
        Keyword = "",
        Method = "",
        Module = "",
        Operator = "",
        Property = "",
        Reference = "",
        Snippet = " ",
        Struct = "",
        Text = "",
        TypeParameter = "",
        Unit = "",
        Value = "",
        Variable = "",
        buffer = "﬘ ",
        calc = " ",
        nvim_lsp = " ",
        path = " ",
        spell = " ",
        vsnip = " ",
    }

    -- source_mappign and formatting
    local source_mapping = {
        buffer        = "[Buffer]",
        calc          = "[calc]",
        latex_symbols = "[LaTeX]",
        luasnip       = "[Snippet]",
        nvim_lsp      = "[LSP]",
        nvim_lua      = "[Lua]",
        path          = "[Path]",
        spell         = "[Spell]",
    }
    local formatting = {
        fields = {'kind', 'abbr', 'menu'},
        format = function(entry, vim_item)
            vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
            vim_item.menu = (source_mapping)[entry.source.name]
            return vim_item
        end
    }

    -- Snippets
    local snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
    }

    -- Mappings
    local mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },

        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),

        ["<C-c"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

        ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },

        ["<C-y>"] = cmp.config.disable,

        ["<CR>"] = cmp.mapping.confirm { select = true },

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }

    -- Sources
    local sources = {
        { name = "buffer", keyword_length = 2, max_item_count = 30 },
        { name = "calc", keyword_length = 2, max_item_count = 30 },
        { name = "latex_symbols", keyword_length = 1, max_item_count = 30 },
        { name = "luasnip", keyword_length = 1, max_item_count = 30 },
        { name = "nvim_lsp", keyword_length = 2, max_item_count = 30 },
        { name = "nvim_lua", keyword_length = 1, max_item_count = 30 },
        { name = "path", keyword_length = 3, max_item_count = 30 },
        { name = "spell", keyword_length = 2, max_item_count = 30 },
    }

    -- Update the function argument opts with local choices made.
    opts.confirm_opts = confirm_opts
    opts.formatting = formatting
    opts.mapping = mapping
    opts.snippet = snippet
    opts.sources = sources
    opts.window = window

    end,

    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip"
    }
}
