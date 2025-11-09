{lib, ...}: {
  plugins = {
    tailwind-tools = {
      enable = true;
      settings = {
        cmp = {
          highlight = "foreground";
        };
        conceal = {
          enabled = false;
          min_length = null;
          symbol = "󱏿 ";
          highlight = {
            fg = "#38BDF8";
          };
        };
        document_color = {
          enabled = true;
          kind = "inline";
          inline_symbol = "󰝤 ";
          debounce = 200;
        };
        extension = {
          queries = [];
          patterns = {
            rust = ["class=[\"']([^\"']+)[\"']"];
            javascript = ["clsx%(([^)]+)%)"];
          };
        };
        server = {
          override = true;
          settings = {
            experimental = {
              classRegex = [
                "tw\\('([^']*)'\\)"
                "[[class=\"([^\"]*)]]"
                "class=\\s+\"([^\"]*)"
              ];
            };
          };
          on_attach = lib.nixvim.mkRaw ''
            function(client, bufnr) end
          '';
          root_dir = lib.nixvim.mkRaw ''
            function(fname)
              return vim.fn.getcwd()
            end
          '';
        };
        telescope = {
          utilities = {
            callback = lib.nixvim.mkRaw ''
              function(name, class) end
            '';
          };
        };
      };
    };
  };
}
