{...}: {
  keymaps = [
    {
      action = "<c-u>zz";
      key = "<c-u>";
      mode = "n";
      options = {
        silent = true;
        desc = "Navigate up with centered cursor";
      };
    }
    {
      action = "<c-d>zz";
      key = "<c-d>";
      mode = "n";
      options = {
        silent = true;
        desc = "Navigate down with centered cursor";
      };
    }
    {
      action = '':let @/=""<CR>'';
      key = "<leader>h";
      mode = "n";
      options = {
        silent = true;
        desc = "Clear highlights and search term";
      };
    }
    {
      action = ":bnext<CR>";
      key = "<Tab>";
      mode = "n";
      options = {
        silent = true;
        desc = "Next buffer";
      };
    }
    {
      action = ":bprevious<CR>";
      key = "<S-Tab>";
      mode = "n";
      options = {
        silent = true;
        desc = "Previous buffer";
      };
    }
    {
      action = '':%bd|e#|bd#<CR>|'"'';
      key = "<leader>o";
      mode = "n";
      options = {
        silent = true;
        desc = "Close all buffers except current";
      };
    }
    {
      action = {
        __raw = ''
          function()
            local current = vim.api.nvim_get_current_buf()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if
                buf ~= current
                and vim.api.nvim_buf_is_loaded(buf)
                and vim.bo[buf].buftype ~= "terminal"
                and vim.bo[buf].filetype ~= "neotest-output"
              then
                vim.api.nvim_buf_delete(buf, { force = true })
              end
            end
          end
        '';
      };
      key = "<leader>k";
      mode = "n";
      options = {
        silent = true;
        desc = "Kill all buffers except current";
      };
    }
    {
      action = ":w<CR>";
      key = "<leader>w";
      mode = "n";
      options = {
        silent = true;
        desc = "Write current file";
      };
    }
    {
      action = ":confirm q<CR>";
      key = "<leader>q";
      mode = "n";
      options = {
        silent = true;
        desc = "Quit";
      };
    }
    {
      action = ":wincmd k<CR>";
      key = "<c-k>";
      mode = "n";
      options = {
        silent = true;
        desc = "Jump to top split";
      };
    }
    {
      action = ":wincmd j<CR>";
      key = "<c-j>";
      mode = "n";
      options = {
        silent = true;
        desc = "Jump to bottom split";
      };
    }
    {
      action = ":wincmd h<CR>";
      key = "<c-h>";
      mode = "n";
      options = {
        silent = true;
        desc = "Jump to left split";
      };
    }
    {
      action = ":wincmd l<CR>";
      key = "<c-l>";
      mode = "n";
      options = {
        silent = true;
        desc = "Jump to right split";
      };
    }
  ];
}
