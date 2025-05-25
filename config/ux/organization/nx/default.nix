{pkgs, ...}: let
  nx = pkgs.vimUtils.buildVimPlugin {
    name = "nx";
    src = pkgs.fetchFromGitHub {
      owner = "ergoproxy623";
      repo = "nx.nvim";
      rev = "8130aef1d8d37980b4aabb63ebc5128928aebe88";
      hash = "sha256-dYP+1LzMTe8UCYq+opWtNPWweIdKDcTbrzKYxo5L0j4=";
    };
    doCheck = false;
  };
in {
  extraPlugins = [nx];
  extraConfigLuaPost = ''
    require('nx').setup{
      -- Base command to run all other nx commands, some other values may be:
      -- - `npm nx`
      -- - `yarn nx`
      -- - `pnpm nx`
      nx_cmd_root = 'npx nx',

      -- Command running capabilities,
      -- see nx.m.command-runners for more details
      command_runner = require('nx.command-runners').toggleterm_runner(),
      -- Form rendering capabilities,
      -- see nx.m.form-renderers for more detials
      form_renderer = require('nx.form-renderers').telescope(),

      -- Whether or not to load nx configuration,
      -- see nx.loading-and-reloading for more details
      read_init = true,
    }
  '';
  keymaps = [
    {
      action = ":Telescope nx actions<CR>";
      key = "<leader>xa";
      mode = "n";
      options = {
        silent = true;
        desc = "Find nx actions";
      };
    }
    {
      action = ":Telescope nx generators<CR>";
      key = "<leader>xg";
      mode = "n";
      options = {
        silent = true;
        desc = "Find nx generators";
      };
    }
    {
      action = ":Telescope nx affected<CR>";
      key = "<leader>xf";
      mode = "n";
      options = {
        silent = true;
        desc = "Find nx affected targets";
      };
    }
    {
      action = ":Telescope nx run_many<CR>";
      key = "<leader>xm";
      mode = "n";
      options = {
        silent = true;
        desc = "Find nx run many targets";
      };
    }
  ];
  plugins = {
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>x";
            group = "+Nx";
          }
          {
            __unkeyed-1 = "<leader>xa";
            desc = "Nx actions";
          }
          {
            __unkeyed-1 = "<leader>xg";
            desc = "Nx generators";
          }
          {
            __unkeyed-1 = "<leader>xf";
            desc = "Nx affected";
          }
          {
            __unkeyed-1 = "<leader>xm";
            desc = "Nx run-many";
          }
        ];
      };
    };
  };
}
