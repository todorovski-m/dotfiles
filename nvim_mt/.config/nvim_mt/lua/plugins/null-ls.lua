return {
  -- Formatters
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        -- Sources are "ensure_installed" with mason
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.yapf,
        -- nls.builtins.diagnostics.pylint,
        nls.builtins.diagnostics.ruff,
        nls.builtins.completion.spell,
        -- nls.builtins.diagnostics.mypy,
      },
      -- configure format on save
      on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
          -- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            -- group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                filter = function(client)
                  --  only use null-ls for formatting instead of lsp server
                  return client.name == "null-ls"
                end,
                bufnr = bufnr,
              })
            end,
          })
        end
      end,
    }
  end,
}
