{pkgs, ...}: let
  junit_jar = pkgs.fetchMavenArtifact {
    groupId = "org/junit/platform";
    artifactId = "junit-platform-console-standalone";
    version = "1.10.1";
    sha256 = "sha256-tC6qU9E1dtF9tfuLKAcipq6eNtr5X0JivG6W1Msgcl8=";
  };
  neotest-java = import ./neotest-java {inherit pkgs;};
in {
  extraConfigLuaPost = ''
    local utils = require("neotest-gtest.utils")
    local lib = require("neotest.lib")
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
        require('neotest-java')({
          junit_jar = "${junit_jar}/share/java/junit-platform-console-standalone-1.10.1.jar"
        }),
        require('neotest-jest')({
          jestCommand = "jest --json --colors --silent --detectOpenHandles",
          jestConfigFile = "jest.config.ts",
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
        require("neotest-gtest").setup({
          -- fun(string) -> string: takes a file path as string and returns its project root
          -- directory
          -- neotest.lib.files.match_root_pattern() is a convenient factory for these functions:
          -- it returns a function that returns true if the directory contains any entries
          -- with matching names
          root = lib.files.match_root_pattern(
            ".git",
            "nx.json"
          ),
          -- which debug adapter to use? dap.adapters.<this debug_adapter> must be defined.
          debug_adapter = "codelldb",
          -- fun(string) -> bool: takes a file path as string and returns true if it contains
          -- tests
          is_test_file = function(file)
            -- by default, returns true if the file stem starts with test_ or ends with _test
            -- the extension must be cpp/cppm/cc/cxx/c++
          end,
          -- How many old test results to keep on disk (stored in stdpath('data')/neotest-gtest/runs)
          history_size = 3,
          -- To prevent large projects from freezing your computer, there's some throttling
          -- for -- parsing test files. Decrease if your parsing is slow and you have a
          -- monster PC.
          parsing_throttle_ms = 10,
          -- set configure to a normal mode key which will run :ConfigureGtest (suggested:
          -- "C", nil by default)
          mappings = { configure = nil },
          summary_view = {
            -- How long should the header be in tests short summary?
            -- ________TestNamespace.TestName___________ <- this is the header
            header_length = 80,
            -- Your shell's colors, if the default ones don't work.
            shell_palette = {
              passed = "\27[32m",
              skipped = "\27[33m",
              failed = "\27[31m",
              stop = "\27[0m",
              bold = "\27[1m",
            },
          },
          -- What extra args should ALWAYS be sent to google test?
          -- if you want to send them for one given invocation only,
          -- send them to `neotest.run({extra_args = ...})`
          -- see :h neotest.RunArgs for details
          extra_args = {},
          -- see :h neotest.Config.discovery. Best to keep this as-is and set
          -- per-project settings in neotest instead.
          filter_dir = function(name, rel_path, root)
            -- see :h neotest.Config.discovery for defaults
          end,
        })
      }
    }
  '';
  extraPlugins = [
    pkgs.vimPlugins.neotest
    pkgs.vimPlugins.neotest-jest
    pkgs.vimPlugins.neotest-gtest
    neotest-java
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
