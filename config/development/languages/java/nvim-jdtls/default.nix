{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.nvim-jdtls];
  autoCmd = [
    {
      event = ["FileType"];
      pattern = "java";
      callback = {
        __raw = let
          javaExt = pkgs.vscode-extensions.vscjava;
          sharePath = "share/vscode/extensions";
          jarGlob = "server/*.jar";
          debugger = "${javaExt.vscode-java-debug}/${sharePath}/vscjava.vscode-java-debug/${jarGlob}";
          java-test = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
            mktplcRef = {
              name = "vscode-java-test";
              publisher = "vscjava";
              version = "0.42.2024080609";
              hash = "sha256-LuI4V/LAvwzU5OgPLdErkeXmyoxTiDNMJXTNNaX7mbc=";
            };
          };
          tester = "${java-test}/${sharePath}/${jarGlob}";
        in
          /*
          lua
          */
          ''
            function()
              local jdtls = require('jdtls')
              local cmp_nvim_lsp = require('cmp_nvim_lsp')
              local client_capabilities = vim.lsp.protocol.make_client_capabilities()
              local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)
              local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
              local home = os.getenv('HOME')
              local bundles = {
                vim.fn.glob("${debugger}", 1)
              }
              vim.list_extend(bundles, vim.split(vim.fn.glob("${tester}", 1), "\n"))
              local extendedClientCapabilities = jdtls.extendedClientCapabilities
              extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
              local config = {
                capabilities = capabilities,
                cmd = {
                  "jdtls",
                  '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                  '-Dosgi.bundles.defaultStartLevel=4',
                  '-Declipse.product=org.eclipse.jdt.ls.core.product',
                  '-Dlog.protocol=true',
                  '-Dlog.level=ALL',
                  '-Xmx1g',
                  '--add-modules=ALL-SYSTEM',
                  '--add-opens', 'java.base/java.util=ALL-UNNAMED',
                  '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
                  "-configuration",
                  vim.fs.normalize("$HOME/.cache/jdtls/config"),
                  "-data",
                  vim.fs.normalize("$HOME/.cache/jdtls") .. "/" .. workspace_dir
                },
                root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"}),
                init_options = {
                  bundles = bundles,
                  extendedClientCapabilities = extendedClientCapabilities
                },
              }
              config.settings = {
                java = {
                  signatureHelp = { enabled = true };
                  contentProvider = { preferred = 'fernflower' };
                  completion = {
                    favoriteStaticMembers = {
                      "org.hamcrest.MatcherAssert.assertThat",
                      "org.hamcrest.Matchers.*",
                      "org.hamcrest.CoreMatchers.*",
                      "org.junit.jupiter.api.Assertions.*",
                      "java.util.Objects.requireNonNull",
                      "java.util.Objects.requireNonNullElse",
                      "org.mockito.Mockito.*"
                    },
                    filteredTypes = {
                      "com.sun.*",
                      "io.micrometer.shaded.*",
                      "java.awt.*",
                      "jdk.*",
                      "sun.*",
                    },
                  };
                  sources = {
                    organizeImports = {
                      starThreshold = 9999;
                      staticStarThreshold = 9999;
                    };
                  };
                  codeGeneration = {
                    toString = {
                      template = "''${object.className}{''${member.name()}=''${member.value}, ''${otherMembers}}"
                    },
                    hashCodeEquals = {
                      useJava7Objects = true,
                    },
                    useBlocks = true,
                  };
                };
              }
              jdtls.start_or_attach(config)
            end
          '';
      };
    }
  ];
  plugins = {
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>cj";
            group = "+Java";
          }
          {
            __unkeyed-1 = "<leader>cji";
            desc = "Organize imports";
          }
          {
            __unkeyed-1 = "<leader>cjrev";
            desc = "Create a variable from value at cursor/selection";
          }
          {
            __unkeyed-1 = "<leader>cjrea";
            desc = "Create a variable for all occurrences from value at cursor/selection";
          }
          {
            __unkeyed-1 = "<leader>cjrec";
            desc = "Create a constant from the value at cursor/selection";
          }
          {
            __unkeyed-1 = "<leader>cjreb";
            desc = "Create a constant from the value at cursor/selection";
          }
          {
            __unkeyed-1 = "<leader>cjrem";
            desc = "Create a method from the value at cursor/selection";
          }
          {
            __unkeyed-1 = "<leader>cjtc";
            desc = "Test the current class in the buffer";
          }
          {
            __unkeyed-1 = "<leader>cjtm";
            desc = "Test the nearest method in the buffer";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action = ":lua require('jdtls').organize_imports()<CR>";
      key = "<leader>cji";
      mode = "n";
      options = {
        desc = "Organize imports";
        silent = true;
      };
    }
    {
      action = ":lua require('jdtls').extract_variable()<CR>";
      key = "<leader>cjrev";
      mode = "n";
      options = {
        desc = "Create a variable from value at cursor/selection";
        silent = true;
      };
    }
    {
      action = ":lua require('jdtls').extract_variable(true)<CR>";
      key = "<leader>cjrea";
      mode = "n";
      options = {
        desc = "Create a variable for all occurrences from value at cursor/selection";
        silent = true;
      };
    }
    {
      action = ":lua require('jdtls').extract_constant()<CR>";
      key = "<leader>cjrec";
      mode = "n";
      options = {
        desc = "Create a constant from the value at cursor/selection";
        silent = true;
      };
    }
    {
      action = ":lua require('jdtls').extract_constant(true)<CR>";
      key = "<leader>cjreb";
      mode = "n";
      options = {
        desc = "Create a constant for all occurrences from the value at cursor/selection";
        silent = true;
      };
    }
    {
      action = ":lua require('jdtls').extract_method()<CR>";
      key = "<leader>cjrem";
      mode = "n";
      options = {
        desc = "Create a method from the value at cursor/selection";
        silent = true;
      };
    }
    {
      action = ":lua require('jdtls').test_class()<CR>";
      key = "<leader>cjtc";
      mode = "n";
      options = {
        desc = "Test the current class in the buffer";
        silent = true;
      };
    }
    {
      action = ":lua require('jdtls').test_nearest_method()<CR>";
      key = "<leader>cjtm";
      mode = "n";
      options = {
        desc = "Test the nearest method in the buffer";
        silent = true;
      };
    }
  ];
}
