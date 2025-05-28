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
    {
      action = "<cmd>resize -2<CR>";
      key = "<C-Up>";
      mode = "n";
      options = {
        silent = true;
        desc = "Decrease window height";
      };
    }
    {
      action = "<cmd>resize +2<CR>";
      key = "<C-Down>";
      mode = "n";
      options = {
        silent = true;
        desc = "Increase window height";
      };
    }
    {
      action = "<cmd>vertical resize -2<CR>";
      key = "<C-Left>";
      mode = "n";
      options = {
        silent = true;
        desc = "Decrease window width";
      };
    }
    {
      action = "<cmd>vertical resize +2<CR>";
      key = "<C-Right>";
      mode = "n";
      options = {
        silent = true;
        desc = "Increase window width";
      };
    }
    {
      action = "<cmd>move-2<CR>";
      key = "<M-k>";
      mode = "n";
      options = {
        silent = true;
        desc = "Move line up";
      };
    }
    {
      action = "<cmd>move+<CR>";
      key = "<M-j>";
      mode = "n";
      options = {
        silent = true;
        desc = "Move line down";
      };
    }
    {
      action = "x";
      key = "<BS>";
      mode = "n";
      options = {
        silent = true;
        desc = "Delete character";
      };
    }
    {
      action = "$";
      key = "ü";
      mode = "n";
      options = {
        silent = true;
        desc = "Go to end of line";
      };
    }
    {
      action = "$";
      key = "+";
      mode = "n";
      options = {
        silent = true;
        desc = "Go to end of line";
      };
    }
    {
      action = "^";
      key = "q";
      mode = "n";
      options = {
        silent = true;
        desc = "Go to start of line";
      };
    }
    {
      action = "%";
      key = "q";
      mode = "n";
      options = {
        silent = true;
        desc = "Go to other pair";
      };
    }
    {
      action = "^";
      key = "-";
      mode = "x";
      options = {
        silent = true;
        desc = "Go to start of line";
      };
    }
    {
      action = "%";
      key = "-";
      mode = "x";
      options = {
        silent = true;
        desc = "Go to other pair";
      };
    }
    {
      action = "$";
      key = "ü";
      mode = "x";
      options = {
        silent = true;
        desc = "Go to end of line";
      };
    }
    {
      action = "$";
      key = "+";
      mode = "x";
      options = {
        silent = true;
        desc = "Go to end of line";
      };
    }
    {
      action = ">gv";
      key = "<Tab>";
      mode = "v";
      options = {
        silent = true;
        desc = "Indent selected lines";
      };
    }
    {
      action = "<gv";
      key = "<S-Tab>";
      mode = "v";
      options = {
        silent = true;
        desc = "Unindent selected lines";
      };
    }
    {
      action = "<cmd>m '<-2<CR>gv=gv<cr>";
      key = "K";
      mode = "v";
      options = {
        silent = true;
        desc = "Move selected block up";
      };
    }
    {
      action = "<cmd>m '>+2<CR>gv=gv<cr>";
      key = "J";
      mode = "v";
      options = {
        silent = true;
        desc = "Move selected block down";
      };
    }
    {
      action = "x";
      key = "<BS>";
      mode = "v";
      options = {
        silent = true;
        desc = "Delete character";
      };
    }
    {
      action = "<C-o>gk";
      key = "<C-k>";
      mode = "i";
      options = {
        silent = true;
        desc = "Move line up";
      };
    }
    {
      action = "<Left>";
      key = "<C-h>";
      mode = "i";
      options = {
        silent = true;
        desc = "Move cursor left";
      };
    }
    {
      action = "<Right>";
      key = "<C-l>";
      mode = "i";
      options = {
        silent = true;
        desc = "Move cursor right";
      };
    }
    {
      action = "<C-o>gj";
      key = "<C-j>";
      mode = "i";
      options = {
        silent = true;
        desc = "Move line down";
      };
    }
  ];
}
