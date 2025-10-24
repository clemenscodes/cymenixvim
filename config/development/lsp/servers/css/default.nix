{...}: {
  extraConfigLuaPost = ''
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    root_dir = vim.fn.getcwd()
    vim.lsp.config.cssls.setup {
      capabilities = capabilities,
      root_dir = root_dir,
      settings = {
        css = {
          validate = true,
          lint = {
            unknownAtRules = "ignore"
          }
        },
        scss = {
          validate = true,
          lint = {
            unknownAtRules = "ignore"
          }
        },
        less = {
          validate = true,
          lint = {
            unknownAtRules = "ignore"
          }
        }
      }
    }
  '';
}
