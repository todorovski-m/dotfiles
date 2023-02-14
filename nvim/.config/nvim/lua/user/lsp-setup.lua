local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
}
vim.diagnostic.config(config)


for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {
        texthl = sign.name,
        text = sign.text,
        numhl = "" })
end

local lspconfig = require("lspconfig")
-- for lua_ls: sudo pacman -S lua-language-server
local servers = { "jsonls", "lua_ls", "pyright", "fortls", "quick_lint_js" }
lsp_installer.setup {
    ensure_installed = servers
}

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local lua_ls_opts = {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                -- Do not send telemetry data containing a randomized but unique identifier
                enable = false,
            },
        },
    },
}

for _, server in pairs(servers) do
    local opt = { on_attach = on_attach, flags = lsp_flags }
    if server == "lua_ls" then
        opt = vim.tbl_deep_extend("force", lua_ls_opts, opt)
    end
    if server == "eslint" then
        -- run lsp in current directory
        opt.root_dir = function() return vim.loop.cwd() end
    end
    lspconfig[server].setup(opt)
end
