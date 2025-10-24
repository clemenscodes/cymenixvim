{...}: {
  extraConfigLuaPost = ''
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    root_dir = vim.fn.getcwd(),
    vim.lsp.config.html.setup {
      capabilities = capabilites,
      root_dir = root_dir,
    }
  '';
}
