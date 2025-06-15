{pkgs, ...}: {config, ...}: {
  plugins = {
    dap-python = {
      enable = true;
    };
  };
  extraConfigLuaPost = ''
    require("conform").setup({
        formatters_by_ft = {
            python = {
              -- To fix auto-fixable lint errors.
              "ruff_fix",
              -- To run the Ruff formatter.
              "ruff_format",
              -- To organize the imports.
              "ruff_organize_imports",
            },
        },
    })
    require("lint").linters_by_ft = {
      python = { "ruff" },
    }
    require("dap-python").setup("uv")
    local lsp = require('lspconfig')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    }
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    lsp.pyright.setup {
      capabilities = capabilites,
      root_dir = vim.fn.getcwd(),
      settings = {
        pyright = {
          disableOrganizeImports = true, -- Using Ruff
          disableTaggedHints = true,
        },
        python = {
          analysis = {
           diagnosticSeverityOverrides = {
              -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
              reportUndefinedVariable = "none",
            },
          },
        },
      },
    }
  '';
}
