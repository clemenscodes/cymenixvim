{pkgs, ...}: {
  extraPackages = [
    pkgs.ghostscript
    pkgs.tectonic
    pkgs.texliveSmall
    pkgs.mermaid-cli
    pkgs.sqlite
  ];
  plugins = {
    snacks = {
      enable = true;
      settings = {
        animate = {
          enabled = true;
        };
        image = {
          enabled = true;
        };
        quickfile = {
          enabled = true;
        };
        bufdelete = {
          enabled = true;
        };
        dashboard = {
          enable = true;
          sections = [
            {
              header = ''
                ██╗   ██╗██╗███╗   ███╗
                ██║   ██║██║████╗ ████║
                ██║   ██║██║██╔████╔██║
                ╚██╗ ██╔╝██║██║╚██╔╝██║
                 ╚████╔╝ ██║██║ ╚═╝ ██║
                  ╚═══╝  ╚═╝╚═╝     ╚═╝
              '';
            }
            {
              icon = " ";
              title = "Keymaps";
              section = "keys";
              gap = 1;
              padding = 1;
            }
            {
              icon = " ";
              title = "Recent Files";
              __unkeyed-1.__raw = "require('snacks').dashboard.sections.recent_files({cwd = true})";
              gap = 1;
              padding = 1;
            }
            {
              icon = " ";
              title = "Projects";
              section = "projects";
              gap = 1;
              padding = 1;
            }
            {
              pane = 2;
              section = "terminal";
              cmd = "colorscript -e square";
              height = 5;
              padding = 2;
            }
            {
              pane = 2;
              icon = " ";
              desc = "Browse Repo";
              padding = 1;
              key = "b";
              action.__raw = ''
                function()
                  Snacks.gitbrowse()
                end'';
            }
            {
              __raw = ''
                function()
                  local in_git = Snacks.git.get_root() ~= nil
                  local cmds = {
                    {
                      title = "Notifications",
                      cmd = "gh notify -s -a -n5",
                      action = function()
                        vim.ui.open("https://github.com/notifications")
                      end,
                      key = "N",
                      icon = " ",
                      height = 5,
                      enabled = true,
                    },
                    {
                      title = "Open Issues",
                      cmd = "gh issue list -L 3",
                      key = "i",
                      action = function()
                        vim.fn.jobstart("gh issue list --web", { detach = true })
                      end,
                      icon = " ",
                      height = 7,
                    },
                    {
                      icon = " ",
                      title = "Open PRs",
                      cmd = "gh pr list -L 3",
                      key = "p",
                      action = function()
                        vim.fn.jobstart("gh pr list --web", { detach = true })
                      end,
                      height = 7,
                    },
                    {
                      icon = " ",
                      title = "Git Status",
                      cmd = "git --no-pager diff --stat -B -M -C",
                      height = 10,
                    },
                  }
                  return vim.tbl_map(function(cmd)
                    return vim.tbl_extend("force", {
                      pane = 2,
                      section = "terminal",
                      enabled = in_git,
                      padding = 1,
                      ttl = 5 * 60,
                      indent = 3,
                    }, cmd)
                  end, cmds)
                end
              '';
            }
          ];
        };
        scope = {
          enabled = true;
        };
        gitbrowse = {
          enabled = true;
        };
        profiler = {
          enabled = true;
        };
        statuscolumn = {
          enabled = true;
          folds = {
            open = true;
            git_hl = true;
          };
        };
        zen = {
          enabled = true;
          toggles = {
            dim = false;
            git_signs = true;
            diagnostics = true;
            inlay_hints = false;
            mini_diff_signs = false;
          };
          win = {
            width = 120;
            height = 0;
            backdrop = {
              transparent = false;
              blend = 90;
            };
          };
        };

        picker = {
          actions = {
            calculate_file_truncate_width = {
              __raw = ''
                function(self)
                    local width = self.list.win:size().width
                    self.opts.formatters.file.truncate = width - 6
                end
              '';
            };
          };
          win = {
            list = {
              on_buf = {
                __raw = ''
                  function(self)
                      self:execute 'calculate_file_truncate_width'
                  end
                '';
              };
            };
            preview = {
              on_buf = {
                __raw = ''
                  function(self)
                      self:execute 'calculate_file_truncate_width'
                  end
                '';
              };
              on_close = {
                __raw = ''
                  function(self)
                      self:execute 'calculate_file_truncate_width'
                  end
                '';
              };
            };
          };
          layouts = {
            select = {
              layout = {
                relative = "cursor";
                width = 70;
                min_width = 0;
                row = 1;
              };
            };
          };
        };
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>";
            group = "+Snacks";
          }
          {
            __unkeyed-1 = "<leader>f";
            group = "Smart find files";
          }
          {
            __unkeyed-1 = "<leader>:";
            desc = "Toggle command history";
          }
          {
            __unkeyed-1 = "<leader>fa";
            desc = "Find autocmds";
          }
          {
            __unkeyed-1 = "<leader>fb";
            desc = "Find buffers";
          }
          {
            __unkeyed-1 = "<leader>go";
            desc = "Open file in browser";
          }
          {
            __unkeyed-1 = "<leader>fC";
            desc = "Find config files";
          }
          {
            __unkeyed-1 = "<leader>fe";
            desc = "File Explorer";
          }
          {
            __unkeyed-1 = "<leader>ff";
            desc = "Find files";
          }
          {
            __unkeyed-1 = "<leader>fF";
            desc = "Find files (All files)";
          }
          {
            __unkeyed-1 = "<leader>fh";
            desc = "Find help tags";
          }
          {
            __unkeyed-1 = "<leader>fk";
            desc = "Find keymaps";
          }

          {
            __unkeyed-1 = "<leader>fo";
            desc = "Find old files";
          }
          {
            __unkeyed-1 = "<leader>fO";
            desc = "Find Smart (Frecency)";
          }
          {
            __unkeyed-1 = "<leader>fp";
            desc = "Find projects";
          }
          {
            __unkeyed-1 = "<leader>fq";
            desc = "Find quickfix";
          }
          {
            __unkeyed-1 = "<leader>fr";
            desc = "Find registers";
          }
          {
            __unkeyed-1 = "<leader>fS";
            desc = "Find spelling suggestions";
          }
          {
            __unkeyed-1 = "<leader>fT";
            desc = "Find theme";
          }
          {
            __unkeyed-1 = "<leader>fu";
            desc = "Undo History";
          }
          {
            __unkeyed-1 = "<leader>fG";
            desc = "Live grep";
          }
          {
            __unkeyed-1 = "<leader>fg";
            desc = "Live grep (All files)";
          }
          {
            __unkeyed-1 = "<leader>f,";
            desc = "Find icons";
          }
          {
            __unkeyed-1 = "<leader>f'";
            desc = "Find marks";
          }
          {
            __unkeyed-1 = "<leader>f/";
            desc = "Fuzzy find in current buffer";
          }
          {
            __unkeyed-1 = "<leader>f?";
            desc = "Fuzzy find in open buffers";
          }
          {
            __unkeyed-1 = "<leader>f<CR>";
            desc = "Resume find";
          }
          {
            __unkeyed-1 = "<leader>fw";
            desc = "Search Word (visual or cursor)";
          }
          {
            __unkeyed-1 = "<leader>fuC";
            desc = "Colorschemes";
          }
          {
            __unkeyed-1 = "<leader>fG";
            desc = "Find Git Files";
          }
          {
            __unkeyed-1 = "<leader>gB";
            desc = "Find git branches";
          }
          {
            __unkeyed-1 = "<leader>gC";
            desc = "Find git commits";
          }
          {
            __unkeyed-1 = "<leader>gs";
            desc = "Find git status";
          }
          {
            __unkeyed-1 = "<leader>gS";
            desc = "Find git stashes";
          }
          {
            __unkeyed-1 = "<leader>gl";
            desc = "Git Log";
          }
          {
            __unkeyed-1 = "<leader>gL";
            desc = "Git Log Line";
          }
          {
            __unkeyed-1 = "<leader>gd";
            desc = "Git Diff (Hunks)";
          }
          {
            __unkeyed-1 = "<leader>gf";
            desc = "Git Log File";
          }
          {
            __unkeyed-1 = "<leader>fd";
            desc = "Find buffer diagnostics";
          }
          {
            __unkeyed-1 = "<leader>fD";
            desc = "Find workspace diagnostics";
          }
          {
            __unkeyed-1 = "gd";
            desc = "Go to definition";
          }
          {
            __unkeyed-1 = "gD";
            desc = "Go to declaration";
          }
          {
            __unkeyed-1 = "gr";
            desc = "References";
          }
          {
            __unkeyed-1 = "gi";
            desc = "Go to implementation";
          }
          {
            __unkeyed-1 = "gt";
            desc = "Go to type definition";
          }
          {
            __unkeyed-1 = "<leader>z";
            desc = "Toggle Zen mode";
          }
          {
            __unkeyed-1 = "<leader>o";
            desc = "Delete all buffers except current";
          }
          {
            __unkeyed-1 = "<leader>q";
            desc = "Delete current buffer";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>f";
      action = ''<cmd>lua Snacks.picker.smart()<cr>'';
      options = {
        desc = "Smart find files";
      };
    }
    {
      mode = "n";
      key = "<leader>:";
      action = ''<cmd>lua Snacks.picker.command_history()<cr>'';
      options = {
        desc = "Toggle command history";
      };
    }
    {
      mode = "n";
      key = "<leader>fa";
      action = ''<cmd>lua Snacks.picker.autocmds()<cr>'';
      options = {
        desc = "Find autocmds";
      };
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = ''<cmd>lua Snacks.picker.buffers()<cr>'';
      options = {
        desc = "Find buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>go";
      action = "<cmd>lua Snacks.gitbrowse()<CR>";
      options = {
        desc = "Open file in browser";
      };
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = ''<cmd>lua Snacks.picker.commands()<cr>'';
      options = {
        desc = "Find commands";
      };
    }
    {
      mode = "n";
      key = "<leader>fC";
      action.__raw = ''
        function()
          require("snacks.picker").files {
            prompt_title = "Config Files",
            cwd = vim.fn.stdpath("config"),
          }
        end
      '';
      options = {
        desc = "Find config files";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fe";
      action = ''<cmd>lua Snacks.explorer()<cr>'';
      options = {
        desc = "File Explorer";
      };
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = ''<cmd>lua Snacks.picker.files()<cr>'';
      options = {
        desc = "Find files";
      };
    }
    {
      mode = "n";
      key = "<leader>fF";
      action = ''<cmd>lua Snacks.picker.files({hidden = true, ignored = true})<cr>'';
      options = {
        desc = "Find files (All files)";
      };
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = ''<cmd>lua Snacks.picker.help()<cr>'';
      options = {
        desc = "Find help tags";
      };
    }
    {
      mode = "n";
      key = "<leader>fk";
      action = ''<cmd>lua Snacks.picker.keymaps()<cr>'';
      options = {
        desc = "Find keymaps";
      };
    }
    {
      mode = "n";
      key = "<leader>fm";
      action = ''<cmd>lua Snacks.picker.man()<cr>'';
      options = {
        desc = "Find man pages";
      };
    }
    {
      mode = "n";
      key = "<leader>fo";
      action = ''<cmd>lua Snacks.picker.recent()<cr>'';
      options = {
        desc = "Find old files";
      };
    }
    {
      mode = "n";
      key = "<leader>fO";
      action = ''<cmd>lua Snacks.picker.smart()<cr>'';
      options = {
        desc = "Find Smart (Frecency)";
      };
    }
    {
      mode = "n";
      key = "<leader>fp";
      action = ''<cmd>lua Snacks.picker.projects()<cr>'';
      options = {
        desc = "Find projects";
      };
    }
    {
      mode = "n";
      key = "<leader>fq";
      action = ''<cmd>lua Snacks.picker.qflist()<cr>'';
      options = {
        desc = "Find quickfix";
      };
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = ''<cmd>lua Snacks.picker.registers()<cr>'';
      options = {
        desc = "Find registers";
      };
    }
    {
      mode = "n";
      key = "<leader>fS";
      action = ''<CMD>lua Snacks.picker.spelling({layout = { preset = "select" }})<CR>'';
      options = {
        desc = "Find spelling suggestions";
      };
    }
    {
      mode = "n";
      key = "<leader>fT";
      action = ''<cmd>lua Snacks.picker.colorschemes()<cr>'';
      options = {
        desc = "Find theme";
      };
    }
    {
      mode = "n";
      key = "<leader>fu";
      action = "<cmd>lua Snacks.picker.undo()<cr>";
      options = {
        desc = "Undo History";
      };
    }
    {
      mode = "n";
      key = "<leader>fG";
      action = "<cmd>lua Snacks.picker.grep()<cr>";
      options = {
        desc = "Live grep";
      };
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>lua Snacks.picker.grep({hidden = true, ignored = true})<cr>";
      options = {
        desc = "Live grep (All files)";
      };
    }
    {
      mode = "n";
      key = "<leader>f,";
      action = ''<cmd>lua Snacks.picker.icons({layout = { preset = "select" }})<cr>'';
      options = {
        desc = "Find icons";
      };
    }
    {
      mode = "n";
      key = "<leader>f'";
      action = ''<cmd>lua Snacks.picker.marks()<cr>'';
      options = {
        desc = "Find marks";
      };
    }
    {
      mode = "n";
      key = "<leader>f/";
      action = ''<cmd>lua Snacks.picker.lines()<cr>'';
      options = {
        desc = "Fuzzy find in current buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>f?";
      action = ''<cmd>lua Snacks.picker.grep_buffers()<cr>'';
      options = {
        desc = "Fuzzy find in open buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>f<CR>";
      action = ''<cmd>lua Snacks.picker.resume()<cr>'';
      options = {
        desc = "Resume find";
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>fw";
      action = ''<cmd>lua Snacks.picker.grep_word()<cr>'';
      options = {
        desc = "Search Word (visual or cursor)";
      };
    }
    {
      mode = "n";
      key = "<leader>fuC";
      action = ''<cmd>lua Snacks.picker.colorschemes()<cr>'';
      options = {
        desc = "Colorschemes";
      };
    }
    {
      mode = "n";
      key = "<leader>fG";
      action = ''<cmd>lua Snacks.picker.git_files()<cr>'';
      options = {
        desc = "Find Git Files";
      };
    }
    {
      mode = "n";
      key = "<leader>gB";
      action = ''<cmd>lua Snacks.picker.git_branches()<cr>'';
      options = {
        desc = "Find git branches";
      };
    }
    {
      mode = "n";
      key = "<leader>gC";
      action = ''<cmd>lua Snacks.picker.git_log()<cr>'';
      options = {
        desc = "Find git commits";
      };
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = ''<cmd>lua Snacks.picker.git_status()<cr>'';
      options = {
        desc = "Find git status";
      };
    }
    {
      mode = "n";
      key = "<leader>gS";
      action = ''<cmd>lua Snacks.picker.git_stash()<cr>'';
      options = {
        desc = "Find git stashes";
      };
    }
    {
      mode = "n";
      key = "<leader>gl";
      action = ''<cmd>lua Snacks.picker.git_log()<cr>'';
      options = {
        desc = "Git Log";
      };
    }
    {
      mode = "n";
      key = "<leader>gL";
      action = ''<cmd>lua Snacks.picker.git_log_line()<cr>'';
      options = {
        desc = "Git Log Line";
      };
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = ''<cmd>lua Snacks.picker.git_diff()<cr>'';
      options = {
        desc = "Git Diff (Hunks)";
      };
    }
    {
      mode = "n";
      key = "<leader>gf";
      action = ''<cmd>lua Snacks.picker.git_log_file()<cr>'';
      options = {
        desc = "Git Log File";
      };
    }
    {
      mode = "n";
      key = "<leader>fd";
      action = ''<cmd>lua Snacks.picker.diagnostics_buffer()<cr>'';
      options = {
        desc = "Find buffer diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>fD";
      action = ''<cmd>lua Snacks.picker.diagnostics()<cr>'';
      options = {
        desc = "Find workspace diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>fs";
      action = ''<cmd>lua Snacks.picker.lsp_symbols()<cr>'';
      options = {
        desc = "Find lsp document symbols";
      };
    }
    {
      mode = "n";
      key = "gd";
      action = ''<cmd>lua Snacks.picker.lsp_definitions()<cr>'';
      options = {
        desc = "Go to definition";
      };
    }
    {
      mode = "n";
      key = "gD";
      action = ''<cmd>lua Snacks.picker.lsp_declarations()<cr>'';
      options = {
        desc = "Go to declaration";
      };
    }
    {
      mode = "n";
      key = "gr";
      action = ''<cmd>lua Snacks.picker.lsp_references()<cr>'';
      options = {
        desc = "References";
        nowait = true;
      };
    }
    {
      mode = "n";
      key = "gi";
      action = ''<cmd>lua Snacks.picker.lsp_implementations()<cr>'';
      options = {
        desc = "Go to implementation";
      };
    }
    {
      mode = "n";
      key = "gt";
      action = ''<cmd>lua Snacks.picker.lsp_type_definitions()<cr>'';
      options = {
        desc = "Go to type definition";
      };
    }
    {
      action = ":lua require('snacks').zen()<CR>";
      key = "<leader>z";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle Zen mode";
      };
    }
    {
      action = ":lua require('snacks').bufdelete.other()<CR>";
      key = "<leader>o";
      mode = "n";
      options = {
        silent = true;
        desc = "Delete all buffers except current";
      };
    }
    {
      action = ":lua require('snacks').bufdelete.delete()<CR>";
      key = "<leader>q";
      mode = "n";
      options = {
        silent = true;
        desc = "Delete current buffer";
      };
    }
  ];
}
