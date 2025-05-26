{...}: {
  plugins = {
    devdocs = {
      enable = true;
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed = "<leader>D";
            group = "DevDocs";
            icon = " ";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>Dd";
      action = "<CMD>DevDocs delete<CR>";
      options = {
        desc = "Delete DevDoc";
      };
    }
    {
      mode = "n";
      key = "<leader>Df";
      action = {
        __raw = ''
          function()
            local devdocs = require("devdocs")
            local installedDocs = devdocs.GetInstalledDocs()
            vim.ui.select(installedDocs, {}, function(selected)
              if not selected then
                return
              end
              local docDir = devdocs.GetDocDir(selected)
              Snacks.picker.files({ cwd = docDir })
            end)
          end
        '';
      };
      options = {
        desc = "Find DevDocs";
      };
    }
    {
      mode = "n";
      key = "<leader>Dg";
      action = "<CMD>DevDocs get<CR>";
      options = {
        desc = "Get DevDocs";
      };
    }
    {
      mode = "n";
      key = "<leader>Di";
      action = "<CMD>DevDocs install<CR>";
      options = {
        desc = "Install DevDocs";
      };
    }
  ];
}
