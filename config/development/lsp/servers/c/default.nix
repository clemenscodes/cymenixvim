{pkgs, ...}: {
  extraPackages = [pkgs.mesonlsp];
  extraConfigLuaPost = ''
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    root_dir = vim.fn.getcwd(),
    require'lspconfig'.mesonlsp.setup {
      capabilities = capabilites,
      root_dir = root_dir,
      filetypes = { 'meson' },
      cmd = {'mesonlsp', '--lsp' }
    }
  '';
  lsp.servers.clangd = {
    enable = true;
    settings = {
      settings = {
        init_options = {
          usePlaceholders = true;
          completeUnimported = true;
          clangdFileStatus = true;
        };
      };
      cmd = [
        "clangd"
        "--background-index"
        "--pretty"
        "--clang-tidy"
        "--header-insertion=iwyu"
        "--completion-style=detailed"
        "--function-arg-placeholders"
        "--fallback-style=llvm"
        "--compile-commands-dir=build"
      ];
    };
  };
  plugins = {
    clangd-extensions = {
      enable = true;
      enableOffsetEncodingWorkaround = true;
      settings = {
        inlay_hints = {
          inline = false;
        };
        ast = {
          role_icons = {
            declaration = "";
            expression = "";
            specifier = "";
            statement = "";
            "template argument" = "";
            type = "";
          };
          kind_icons = {
            Compound = "";
            Recovery = "";
            TranslationUnit = "";
            PackExpansion = "";
            TemplateTypeParm = "";
            TemplateTemplateParm = "";
            TemplateParamObject = "";
          };
        };
      };
    };
  };
}
