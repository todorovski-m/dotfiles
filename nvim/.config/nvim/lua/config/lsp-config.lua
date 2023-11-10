require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pyright", "fortls" }
})

-- https://github.com/jmbuhr/quarto-nvim-kickstarter/blob/20c693ebf136421bd6c23a2f5ff46abeeb3fa360/lua/plugins/quarto.lua#L173
local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
        local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
        buf_set_keymap('n', 'gD', '<cmd>Telescope lsp_type_definitions<CR>', opts)
        buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', opts)
        buf_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        client.server_capabilities.document_formatting = true
  end

require("lspconfig").lua_ls.setup {
    settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
    },
    on_attach = on_attach,
}

require("lspconfig").pyright.setup {
    settings = {
        python = {
            analysis = { diagnosticMode = "off", typeCheckingMode = "off" },
        },
    },
    on_attach = on_attach
}
