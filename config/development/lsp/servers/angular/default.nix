{pkgs, ...}: {
  plugins = {
    lsp = {
      postConfig =
        /*
        lua
        */
        # ''
        #   local lsp = require('lspconfig')
        #   lsp["angularls"].setup({})
        # '';
    };
  };
}
