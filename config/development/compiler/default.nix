{lib, ...}: {config, ...}: {
  plugins = {
    compiler = {
      enable = true;
      lazyLoad = {
        settings = {
          before.__raw = lib.mkIf config.plugins.lz-n.enable ''
            function()
              require('lz.n').trigger_load('overseer.nvim')
            end
          '';
          cmd = [
            "CompilerOpen"
            "CompilerRedo"
            "CompilerStop"
            "CompilerToggleResults"
          ];
        };
      };
      settings = {};
    };
    overseer = {
      enable = true;
      settings = {
        lazyLoad.settings.cmd = [
          "OverseerOpen"
          "OverseerClose"
          "OverseerToggle"
          "OverseerSaveBundle"
          "OverseerLoadBundle"
          "OverseerDeleteBundle"
          "OverseerRunCmd"
          "OverseerRun"
          "OverseerInfo"
          "OverseerBuild"
          "OverseerQuickAction"
          "OverseerTaskAction"
          "OverseerClearCache"
        ];
        task_list = {
          bindings = {
            "<C-e>" = "Edit";
            "<C-f>" = "OpenFloat";
            "<M-h>" = "DecreaseDetail";
            "<M-j>" = "ScrollOutputDown";
            "<M-k>" = "ScrollOutputUp";
            "<M-l>" = "IncreaseDetail";
            "<C-q>" = "OpenQuickFix";
            "<C-s>" = "OpenSplit";
            "<C-v>" = "OpenVsplit";
            "<CR>" = "RunAction";
            "?" = "ShowHelp";
            H = "DecreaseAllDetail";
            L = "IncreaseAllDetail";
            "[" = "DecreaseWidth";
            "]" = "IncreaseWidth";
            "g?" = "ShowHelp";
            o = "Open";
            p = "TogglePreview";
            q = "Close";
            "{" = "PrevTask";
            "}" = "NextTask";
          };
          max_height = [
            40
            0.1
          ];
          max_width = [
            100
            0.2
          ];
          min_height = 40;
          min_width = [
            40
            0.1
          ];
        };
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>b";
            icon = "";
            group = "+Build";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>CompilerOpen<CR>";
      options = {
        desc = "Compiler Open";
      };
    }
    {
      mode = "n";
      key = "<leader>br";
      action = "<cmd>CompilerRedo<CR>";
      options = {
        desc = "Compiler Redo";
      };
    }
    {
      mode = "n";
      key = "<leader>bs";
      action = "<cmd>CompilerStop<CR>";
      options = {
        desc = "Compiler Stop";
      };
    }
    {
      mode = "n";
      key = "<leader>bt";
      action = "<cmd>CompilerToggleResults<CR>";
      options = {
        desc = "Compiler Toggle Results";
      };
    }
  ];
}
