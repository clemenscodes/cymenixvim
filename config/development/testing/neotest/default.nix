{pkgs, ...}: let
  junit_jar = pkgs.fetchMavenArtifact {
    groupId = "org/junit/platform";
    artifactId = "junit-platform-console-standalone";
    version = "1.10.1";
    sha256 = "sha256-tC6qU9E1dtF9tfuLKAcipq6eNtr5X0JivG6W1Msgcl8=";
  };
  # neotest-java = import ./neotest-java {inherit pkgs;};
in {
  extraConfigLuaPost = ''
    require('neotest').setup {
      discovery = {
        enabled = false,
        concurrent = 1,
      },
      output_panel = {
        open = "botright split | resize 20"
      },
      adapters = {
        require('rustaceanvim.neotest'),
        -- require('neotest-java')({
        --   junit_jar = "${junit_jar}/share/java/junit-platform-console-standalone-1.10.1.jar"
        -- }),
        require('neotest-jest')({
          jestCommand = "jest --json --colors --silent --detectOpenHandles",
          jestConfigFile = "jest.config.ts",
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
        require("neotest-gtest").setup({}),
        require("neotest-python")({
          -- Extra arguments for nvim-dap configuration
          -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
          dap = { justMyCode = false },
          -- Command line arguments for runner
          -- Can also be a function to return dynamic values
          args = {"--log-level", "DEBUG"},
          -- Runner to use. Will use pytest if available by default.
          -- Can be a function to return dynamic value.
          runner = "pytest",
          -- Custom python path for the runner.
          -- Can be a string or a list of strings.
          -- Can also be a function to return dynamic value.
          -- If not provided, the path will be inferred by checking for 
          -- virtual envs in the local directory and for Pipenev/Poetry configs
          python = "python",
          -- Returns if a given file path is a test file.
          -- NB: This function is called a lot so don't perform any heavy tasks within it.
          -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
          -- instances for files containing a parametrize mark (default: false)
          pytest_discover_instances = true,
        })
      }
    }
  '';
  extraPlugins = [
    pkgs.vimPlugins.neotest
    pkgs.vimPlugins.neotest-jest
    pkgs.vimPlugins.neotest-gtest
    pkgs.vimPlugins.neotest-python
    # neotest-java
  ];
  keymaps = [
    {
      action = ":Neotest output-panel clear<CR>";
      key = "<leader>roc";
      mode = "n";
      options = {
        silent = true;
        desc = "Clear Neotest output panel";
      };
    }
    {
      action = ":Neotest run<CR>";
      key = "<leader>rr";
      mode = "n";
      options = {
        silent = true;
        desc = "Run nearest test";
      };
    }
    {
      action = ":Neotest stop<CR>";
      key = "<leader>rs";
      mode = "n";
      options = {
        silent = true;
        desc = "Stop nearest test";
      };
    }
    {
      action = {
        __raw = ''
          function()
            require("neotest").run.stop(vim.fn.expand("%"))
          end'';
      };
      key = "<leader>rk";
      mode = "n";
      options = {
        silent = true;
        desc = "Stop tests in file";
      };
    }
    {
      action = {
        __raw = ''
          function()
            require('neotest').run.run({strategy = "dap"})
          end'';
      };
      key = "<leader>rd";
      mode = "n";
      options = {
        silent = true;
        desc = "Run nearest test";
      };
    }
    {
      action = ":Neotest output-panel toggle<CR>";
      key = "<leader>to";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle test output panel";
      };
    }
    {
      action = ":Neotest summary toggle<CR>";
      key = "<leader>ts";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle test summary";
      };
    }
    {
      action = ":Neotest jump next<CR>";
      key = "<leader>rn";
      mode = "n";
      options = {
        silent = true;
        desc = "Jump to next test";
      };
    }
    {
      action = ":Neotest jump prev<CR>";
      key = "<leader>rp";
      mode = "n";
      options = {
        silent = true;
        desc = "Jump to previous test";
      };
    }
    {
      action = ":Neotest run file<CR>";
      key = "<leader>ra";
      mode = "n";
      options = {
        silent = true;
        desc = "Run all tests";
      };
    }
    {
      action = ":Neotest attach<CR>";
      key = "<leader>rt";
      mode = "n";
      options = {
        silent = true;
        desc = "Attach to nearest test";
      };
    }
  ];
  plugins = {
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>r";
            group = "+Test";
          }
          {
            __unkeyed-1 = "<leader>roc";
            desc = "Clear Neotest output panel";
          }
          {
            __unkeyed-1 = "<leader>rr";
            desc = "Run nearest test";
          }
          {
            __unkeyed-1 = "<leader>rs";
            desc = "Stop nearest test";
          }
          {
            __unkeyed-1 = "<leader>rd";
            desc = "Debug nearest test";
          }
          {
            __unkeyed-1 = "<leader>rn";
            desc = "Jump to next test";
          }
          {
            __unkeyed-1 = "<leader>rp";
            desc = "Jump to previous test";
          }
          {
            __unkeyed-1 = "<leader>ra";
            desc = "Run all tests in file";
          }
          {
            __unkeyed-1 = "<leader>rk";
            desc = "Stop all tests in file";
          }
          {
            __unkeyed-1 = "<leader>rt";
            desc = "Attach to nearest test";
          }
        ];
      };
    };
  };
}
