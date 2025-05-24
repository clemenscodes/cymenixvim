{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "symbol-usage";
      src = pkgs.fetchFromGitHub {
        owner = "Wansmer";
        repo = "symbol-usage.nvim";
        rev = "e07c07dfe7504295a369281e95a24e1afa14b243";
        hash = "sha256-zWT6ZGYGpWLwuUrMlmyTIE5UZtPLX2FnywhycTxUaRQ=";
      };
    })
  ];
  extraConfigLuaPost = ''
    local SymbolKind = vim.lsp.protocol.SymbolKind

    ---@type UserOpts
    require('symbol-usage').setup({
      ---@type table<string, any> `nvim_set_hl`-like options for highlight virtual text
      hl = { link = 'Comment' },
      ---@type lsp.SymbolKind[] Symbol kinds what need to be count (see `lsp.SymbolKind`)
      kinds = { SymbolKind.Function, SymbolKind.Method },
      ---Additional filter for kinds. Recommended use in the filetypes override table.
      ---fiterKind: function(data: { symbol:table, parent:table, bufnr:integer }): boolean
      ---`symbol` and `parent` is an item from `textDocument/documentSymbol` request
      ---See: #filter-kinds
      ---@type table<lsp.SymbolKind, filterKind[]>
      kinds_filter = {},
      ---@type 'above'|'end_of_line'|'textwidth'|'signcolumn' `above` by default
      vt_position = 'above',
      vt_priority = nil, ---@type integer Virtual text priority (see `nvim_buf_set_extmark`)
      ---Text to display when request is pending. If `false`, extmark will not be
      ---created until the request is finished. Recommended to use with `above`
      ---vt_position to avoid "jumping lines".
      ---@type string|table|false
      request_pending_text = 'loading...',
      ---The function can return a string to which the highlighting group from `opts.hl` is applied.
      ---Alternatively, it can return a table of tuples of the form `{ { text, hl_group }, ... }`` - in this case the specified groups will be applied.
      ---If `vt_position` is 'signcolumn', then only a 1-2 length string or a `{{ icon, hl_group }}` table is expected.
      ---See `#format-text-examples`
      ---@type function(symbol: Symbol): string|table Symbol{ definition = integer|nil, implementation = integer|nil, references = integer|nil, stacked_count = integer, stacked_symbols = table<SymbolId, Symbol> }
      -- text_format = function(symbol) end,
      references = { enabled = true, include_declaration = false },
      definition = { enabled = false },
      implementation = { enabled = false },
      ---@type { lsp?: string[], filetypes?: string[], cond?: function[] } Disables `symbol-usage.nvim' for specific LSPs, filetypes, or on custom conditions.
      ---The function in the `cond` list takes an argument `bufnr` and returns a boolean. If it returns true, `symbol-usage` will not run in that buffer.
      disable = { lsp = {}, filetypes = {}, cond = {} },
      ---@type UserOpts[] See default overridings in `lua/symbol-usage/langs.lua`
      -- filetypes = {},
      ---@type 'start'|'end' At which position of `symbol.selectionRange` the request to the lsp server should start. Default is `end` (try changing it to `start` if the symbol counting is not correct).
      symbol_request_pos = 'end', -- Recommended redefine only in `filetypes` override table
      ---@type (fun(ctx: lsp.HandlerContext):fun(symbol: lsp.Location): boolean)?
      -- This is a function factory that takes the LSP context as a parameter and
      -- produce a filter function for vim.tbl_filter. This can be used to exclude
      -- certain references/definition/implementation from being included in the
      -- count. See [Filtering Symbols] for details.
      symbol_filter = function(ctx)
        return function(symbol)
          if ctx.method == vim.lsp.protocol.Methods.textDocument_references then
            -- if the LSP request is 'textDocument/references', do not count it if the URI contains `tests/`
            return string.find(symbol.uri, "tests") == nil
          else
            -- for other types of LSP requests, do not apply a filter and always count
            -- the occurrence.
            return true
          end
        end
      end,
      ---@type LoggerConfig
      log = { enabled = false },
    })
  '';
  plugins = {
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>tu";
            desc = "Toggle symbol usages";
          }
          {
            __unkeyed-1 = "<leader>u";
            desc = "Refresh symbol usages";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action = {
        __raw = ''
          function()
            require('symbol-usage').toggle_globally()
          end
        '';
      };
      key = "<leader>tu";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle symbol usages";
      };
    }
    {
      action = {
        __raw = ''
          function()
            require('symbol-usage').refresh()
          end
        '';
      };
      key = "<leader>u";
      mode = "n";
      options = {
        silent = true;
        desc = "Refresh symbol usages";
      };
    }
  ];
}
