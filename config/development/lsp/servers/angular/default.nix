{pkgs, ...}: {
  plugins = {
    lsp = {
      # postConfig = ''
      #   local lsp = require('lspconfig')
      #   lsp["angularls"].setup({})
      # '';
    };
  };
}
