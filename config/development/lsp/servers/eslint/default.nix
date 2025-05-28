{pkgs, ...}: {
  extraPackages = [pkgs.eslint_d];
  extraConfigLuaPost = ''
    local lsp = require('lspconfig')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    lsp.eslint.setup {
      capabilities = capabilites,
      root_dir = function(fname)
        if fname:match("/node_modules/") then
          return nil
        end
        return require('lspconfig.util').root_pattern(".git", "nx.json")(fname)
      end,
      on_attach = function(client, bufnr)
        local filepath = vim.api.nvim_buf_get_name(bufnr)
        if filepath:match("/node_modules/") then
          client.stop()
        end
      end,
    }
  '';
}
