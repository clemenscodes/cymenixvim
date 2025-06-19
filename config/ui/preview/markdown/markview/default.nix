{...}: let
  filetypes = [
    "Avante"
    "codecompanion"
    "latex"
    "markdown"
    "md"
    "norg"
    "org"
    "quarto"
    "rmd"
    "typst"
    "vimwiki"
  ];
in {
  plugins = {
    markview = {
      enable = true;

      lazyLoad.settings.ft = filetypes;
      settings = {
        preview = {
          inherit filetypes;
          ignore_buftypes = [];
          condition = {
            __raw = ''
              function (buffer)
                 local ft, bt = vim.bo[buffer].ft, vim.bo[buffer].bt;

                 if bt == "nofile" and (ft == "Avante" or ft == "codecompanion") then
                      return true;
                 elseif bt == "nofile" then
                      return false;
                 else
                      return true;
                 end
              end
            '';
          };
        };
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>tw";
            desc = "Toggle Markdown Preview";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>tw";
      action = "<cmd>Markview toggle<CR>";
      options = {
        desc = "Toggle Markdown Preview";
      };
    }
  ];
}
