{...}: {
  extraConfigLuaPost = ''
    local lsp = require('lspconfig')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    lsp.eslint.setup {
      capabilities = capabilites,
      root_dir = lsp.util.root_pattern(".git", "nx.json")
    }
  '';
}
