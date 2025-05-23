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
    {
      event = "BufEnter";
      pattern = ["*"];
      callback = {
        __raw = ''
          function()
            local buf_size_limit = 1024 * 1024 -- 1MB size limit
            if vim.api.nvim_buf_get_offset(0, vim.api.nvim_buf_line_count(0)) > buf_size_limit then
              require("ibl").setup_buffer(0, { enabled = false })
              vim.cmd("setlocal nonumber norelativenumber")
              vim.cmd("syntax off")
              vim.cmd("let g:loaded_matchparen = 1")
              vim.cmd("setlocal nocursorline nocursorcolumn")
              vim.cmd("setlocal nofoldenable")
              vim.cmd("setlocal signcolumn=no")
              vim.cmd("setlocal noswapfile noundofile")
            end
          end
        '';
      };
    }
  ];
}
