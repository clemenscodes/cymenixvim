{...}: {
  autoCmd = [
    {
      event = ["BufReadCmd"];
      pattern = "*.pdf";
      callback = {
        __raw = ''
          function()
            local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
            vim.cmd("silent !zathura " .. filename .. " &")
            vim.cmd("let tobedeleted = bufnr('%') | b# | exe \"bd! \" . tobedeleted")
          end
        '';
      };
    }
    {
      event = ["BufReadCmd"];
      pattern = [
        "*.png"
        "*.jpg"
        "*.jpeg"
        "*.gif"
        "*.webp"
      ];
      callback = {
        __raw = ''
          function()
            local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
            vim.cmd("silent !swayimg " .. filename .. " &")
            vim.cmd("let tobedeleted = bufnr('%') | b# | exe \"bd! \" . tobedeleted")
          end
        '';
      };
    }

    # Handle performance on large files by https://github.com/khaneliman/khanelivim/blob/main/modules/nixvim/autocommands.nix
    (
      lib.mkIf
      (
        (!config.plugins.snacks.enable)
        || (config.plugins.snacks.enable && (!config.plugins.snacks.settings.bigfile.enabled))
      )
      {
        event = "BufEnter";
        pattern = ["*"];
        callback = {
          __raw = ''
            function()
              local buf_size_limit = 1024 * 1024 -- 1MB size limit
              if vim.api.nvim_buf_get_offset(0, vim.api.nvim_buf_line_count(0)) > buf_size_limit then
                ${lib.optionalString config.plugins.indent-blankline.enable ''require("ibl").setup_buffer(0, { enabled = false })''}
                ${lib.optionalString (lib.hasAttr "indentscope" config.plugins.mini.modules) ''vim.b.miniindentscope_disable = true''}
                ${lib.optionalString config.plugins.illuminate.enable ''require("illuminate").pause_buf()''}

                -- Disable line numbers and relative line numbers
                vim.cmd("setlocal nonumber norelativenumber")

                -- Disable syntax highlighting
                -- vim.cmd("syntax off")

                -- Disable matchparen
                vim.cmd("let g:loaded_matchparen = 1")

                -- Disable cursor line and column
                vim.cmd("setlocal nocursorline nocursorcolumn")

                -- Disable folding
                vim.cmd("setlocal nofoldenable")

                -- Disable sign column
                vim.cmd("setlocal signcolumn=no")

                -- Disable swap file and undo file
                vim.cmd("setlocal noswapfile noundofile")

                -- Disable mini animate
                vim.b.minianimate_disable = true
              end
            end
          '';
        };
      }
    )
  ];
}
