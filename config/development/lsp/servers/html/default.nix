{...}: {
  extraConfigLuaPost = ''
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    root_dir = vim.fn.getcwd(),
    require'lspconfig'.html.setup {
      capabilities = capabilites,
      root_dir = root_dir,
    }
  '';
}
