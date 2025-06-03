{lib, ...}: let
  get_bufnrs.__raw = ''
    function()
      local buf_size_limit = 1024 * 1024 -- 1MB size limit
      local bufs = vim.api.nvim_list_bufs()
      local valid_bufs = {}
      for _, buf in ipairs(bufs) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf)) < buf_size_limit then
          table.insert(valid_bufs, buf)
        end
      end
      return valid_bufs
    end
  '';
  enableCmp = true;
in {
  plugins = {
    cmp_luasnip = {
      enable = enableCmp;
    };
    cmp-conventionalcommits = {
      enable = enableCmp;
    };
    cmp-dap = {
      enable = enableCmp;
    };
    cmp-git = {
      enable = enableCmp;
    };
    cmp-nvim-lsp = {
      enable = enableCmp;
    };
    cmp-nvim-lsp-document-symbol = {
      enable = enableCmp;
    };
    cmp-nvim-lsp-signature-help = {
      enable = enableCmp;
    };
    cmp-nvim-lua = {
      enable = enableCmp;
    };
    cmp-path = {
      enable = enableCmp;
    };
    cmp-npm = {
      enable = enableCmp;
    };
    cmp = {
      enable = enableCmp;
      autoEnableSources = true;
      settings = {
        mapping = {
          "<C-x>" =
            # Lua
            "cmp.mapping.scroll_docs(-4)";
          "<C-h>" =
            # Lua
            "cmp.mapping.scroll_docs(4)";
          "<C-Space>" =
            # Lua
            "cmp.mapping.complete()";
          "<C-e>" =
            # Lua
            "cmp.mapping.close()";
          "<S-Tab>" =
            # Lua
            ''
              cmp.mapping(
                function(fallback)
                  local luasnip = require 'luasnip'
                  if cmp.visible() then
                    cmp.select_prev_item()
                  elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                  else
                    fallback()
                  end
                end,
                { "i", "s" }
              )
            '';
          "<Tab>" =
            # Lua
            ''
              cmp.mapping(
                function(fallback)
                  local luasnip = require 'luasnip'
                  if cmp.visible() then
                    cmp.select_next_item()
                  elseif luasnip.expandable() then
                    luasnip.expand();
                  elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                  else
                    fallback()
                  end
                end,
                { "i", "s" }
              )
            '';
          "<CR>" =
            # Lua
            "cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })";
        };
        completion = {
          autocomplete = [
            # Lua
            ''
              require('cmp.types').cmp.TriggerEvent.TextChanged
            ''
          ];
        };
        preselect =
          # Lua
          "cmp.PreselectMode.None";
        snippet = {
          expand =
            # Lua
            "function(args) require('luasnip').lsp_expand(args.body) end";
        };
        window = {
          completion.__raw = ''cmp.config.window.bordered()'';
          documentation.__raw = ''cmp.config.window.bordered()'';
        };
        sources = [
          {
            name = "nvim_lsp";
            priority = 1000;
            entryFilter =
              # Lua
              ''
                function(entry, ctx)
                  return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
                end
              '';
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "nvim_lsp_signature_help";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "nvim_lsp_document_symbol";
            priority = 1000;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "treesitter";
            priority = 850;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "luasnip";
            priority = 750;
          }
          {
            name = "crates";
            priority = 900;
          }
          {
            name = "buffer";
            priority = 500;
            option = {
              inherit get_bufnrs;
            };
          }
          {
            name = "path";
            priority = 300;
          }
          {
            name = "cmdline";
            priority = 300;
          }
          {
            name = "git";
            priority = 250;
          }
          {
            name = "npm";
            priority = 250;
          }
          {
            name = "zsh";
            priority = 250;
          }
          {
            name = "emoji";
            priority = 100;
          }
          {name = "nixpkgs_maintainers";}
        ];
        formatting = {
          format =
            lib.mkForce
            # Lua
            ''
              require("lspkind").cmp_format({
                before = require("tailwind-tools.cmp").lspkind_format,
                menu = {
                  buffer = "",
                  calc = "",
                  cmdline = "",
                  codeium = "󱜙",
                  copilot = "",
                  emoji = "󰞅",
                  git = "",
                  luasnip = "󰩫",
                  neorg = "",
                  nixpkgs_maintainers = "",
                  nvim_lsp = "",
                  nvim_lua = "",
                  path = "",
                  spell = "",
                  treesitter = "󰔱"
                }
              })
            '';
        };
      };
    };
  };
}
