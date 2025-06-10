{pkgs, ...}: {
  plugins = {
    lazy = {
      enable = true;
    };
    snacks = {
      enable = true;
      settings = {
        animate = {
          enabled = true;
          duration = 10;
          fps = 180;
        };
        image = {
          enabled = true;
          formats = [
            "png"
            "jpg"
            "jpeg"
            "gif"
            "bmp"
            "webp"
            "tiff"
            "heic"
            "avif"
            "mp4"
            "mov"
            "avi"
            "mkv"
            "webm"
            "pdf"
          ];
        };
        scroll = {
          enabled = true;
        };
        quickfile = {
          enabled = true;
        };
        explorer = {
          enabled = true;
          replace_netrw = true;
        };
        bufdelete = {
          enabled = true;
        };
        notifier = {
          enabled = true;
        };
        input = {
          enabled = true;
        };
        git = {
          enabled = true;
        };
        gitbrowse = {
          enabled = true;
        };
        profiler = {
          enabled = true;
        };
        terminal = {
          enabled = true;
          win = {
            height = 0.3;
            wo = {
              winbar = "";
            };
            keys = {
              __raw = ''
                {
                  q = "hide",
                  gf = function(self)
                    local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
                    if f == "" then
                      Snacks.notify.warn("No file under cursor")
                    else
                      self:hide()
                      vim.schedule(function()
                        vim.cmd("e " .. f)
                      end)
                    end
                  end,
                  term_toggle = {
                    "<leader>",
                    function(self)
                      self.leader_timer= self.leader_timer or (vim.uv or vim.loop).new_timer()
                      if self.leader_timer:is_active() then
                        self.leader_timer:stop()
                        local backspace = vim.api.nvim_replace_termcodes("<BS>", true, false, true)
                        vim.api.nvim_feedkeys(backspace, "t", false)
                        Snacks.terminal.toggle()
                        return ""
                      else
                        self.leader_timer:start(300, 0, function() end)
                        return " "
                      end
                    end,
                    mode = "t",
                    expr = true,
                    desc = "Double leader to toggle terminal",
                  },
                  term_normal = {
                    "<esc>",
                    function(self)
                      self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
                      if self.esc_timer:is_active() then
                        self.esc_timer:stop()
                        vim.cmd("stopinsert")
                      else
                        self.esc_timer:start(300, 0, function() end)
                        return "<esc>"
                      end
                    end,
                    mode = "t",
                    expr = true,
                    desc = "Double escape to toggle terminal",
                  },
                }
              '';
            };
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
          sources = {
            explorer = {
            };
          };
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
            sidebar = {
              layout = {
                width = 0.32;
              };
            };
          };
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
            {section = "startup";}
          ];
        };
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>f";
            group = "+Find";
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
            __unkeyed-1 = "<leader>fg";
            desc = "Live grep project files";
          }
          {
            __unkeyed-1 = "<leader>fG";
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
            __unkeyed-1 = "<leader>fw";
            desc = "Search Word (visual or cursor)";
          }
          {
            __unkeyed-1 = "<leader>gC";
            desc = "Find git commits";
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
            __unkeyed-1 = "<leader><leader>";
            desc = "Toggle terminal";
          }
        ];
      };
    };
  };
  keymaps = [
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
      key = "<leader>fe";
      action = ''<cmd>lua Snacks.explorer()<cr>'';
      options = {
        desc = "File Explorer";
      };
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = ''<cmd>lua Snacks.picker.smart()<cr>'';
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
      key = "<leader>fr";
      action = ''<cmd>lua Snacks.picker.registers()<cr>'';
      options = {
        desc = "Find registers";
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
        desc = "Find undo history";
      };
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>lua Snacks.picker.grep()<cr>";
      options = {
        desc = "Live grep";
      };
    }
    {
      mode = "n";
      key = "<leader>fG";
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
      key = "<leader>gb";
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
      action = {
        __raw = ''
          function()
            if vim.bo.filetype == "snacks_picker_list" then
              Snacks.explorer()
            end

            local api = vim.api
            local current_win = api.nvim_get_current_win()
            local current_buf = api.nvim_get_current_buf()
            local win_config = api.nvim_win_get_config(current_win)
            local is_floating = win_config.relative ~= ""

            if not is_floating and #api.nvim_list_wins() > 1 then
              pcall(vim.cmd, 'only')
            end

            for _, buf in ipairs(api.nvim_list_bufs()) do
              if buf ~= current_buf and api.nvim_buf_is_loaded(buf) then
                local is_listed = api.nvim_buf_get_option(buf, 'buflisted')
                local is_modifiable = api.nvim_buf_get_option(buf, 'modifiable')
                local buftype = api.nvim_buf_get_option(buf, 'buftype')
                if is_listed then
                  local cmd = is_modifiable and 'bdelete ' or 'bdelete! '
                  pcall(vim.cmd, cmd .. buf)
                end
              end
            end

            Snacks.bufdelete.other()
            vim.cmd("wa")
            vim.cmd("qa")
          end
        '';
      };
      key = "<leader>Q";
      mode = "n";
      options = {
        silent = true;
        desc = "Save and quit";
      };
    }
    {
      action = {
        __raw = ''
          function()
            if vim.bo.filetype == "snacks_picker_list" then
              Snacks.explorer()
            end

            local api = vim.api
            local current_win = api.nvim_get_current_win()
            local current_buf = api.nvim_get_current_buf()
            local win_config = api.nvim_win_get_config(current_win)
            local is_floating = win_config.relative ~= ""

            if not is_floating and #api.nvim_list_wins() > 1 then
              pcall(vim.cmd, 'only')
            end

            for _, buf in ipairs(api.nvim_list_bufs()) do
              if buf ~= current_buf and api.nvim_buf_is_loaded(buf) then
                local is_listed = api.nvim_buf_get_option(buf, 'buflisted')
                local is_modifiable = api.nvim_buf_get_option(buf, 'modifiable')
                local buftype = api.nvim_buf_get_option(buf, 'buftype')
                if is_listed then
                  local cmd = is_modifiable and 'bdelete ' or 'bdelete! '
                  pcall(vim.cmd, cmd .. buf)
                end
              end
            end

            Snacks.bufdelete.other()
          end
        '';
      };
      key = "<leader>o";
      mode = "n";
      options = {
        silent = true;
        desc = "Delete everything except current buffer";
      };
    }
    {
      action = {
        __raw = ''
          function()
            Snacks.bufdelete.other()
          end
        '';
      };
      key = "<leader>O";
      mode = "n";
      options = {
        silent = true;
        desc = "Delete all buffers except current buffer";
      };
    }
    {
      action = {
        __raw = ''
          function()
            if vim.bo.filetype == "snacks_picker_list" then
              Snacks.explorer()
            end

            local api = vim.api
            local current_win = api.nvim_get_current_win()
            local current_buf = api.nvim_get_current_buf()
            local win_config = api.nvim_win_get_config(current_win)
            local is_floating = win_config.relative ~= ""

            if not is_floating and #api.nvim_list_wins() > 1 then
              pcall(vim.cmd, 'only')
            end

            for _, buf in ipairs(api.nvim_list_bufs()) do
              if buf ~= current_buf and api.nvim_buf_is_loaded(buf) then
                local is_listed = api.nvim_buf_get_option(buf, 'buflisted')
                local is_modifiable = api.nvim_buf_get_option(buf, 'modifiable')
                local buftype = api.nvim_buf_get_option(buf, 'buftype')
                if is_listed then
                  local cmd = is_modifiable and 'bdelete ' or 'bdelete! '
                  pcall(vim.cmd, cmd .. buf)
                end
              end
            end

            Snacks.bufdelete.other()
            Snacks.zen()
          end
        '';
      };
      key = "<leader>z";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle Zen mode";
      };
    }
    {
      action = {
        __raw = ''
          function()
            Snacks.terminal.toggle()
          end
        '';
      };
      key = "<leader><leader>";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle terminal";
      };
    }
    {
      action = {
        __raw = ''
          function()
            Snacks.terminal.open()
          end
        '';
      };
      key = "<leader>m";
      mode = "n";
      options = {
        silent = true;
        desc = "More terminals";
      };
    }
  ];
  extraPackages = [
    pkgs.ghostscript
    pkgs.tectonic
    pkgs.texliveSmall
    pkgs.mermaid-cli
    pkgs.sqlite
  ];
  extraConfigLuaPost = ''
    local scroll_group = vim.api.nvim_create_augroup("SmartScrollSnacks", { clear = true })

    local function smart_scroll(direction)
      local cur, top, bot = vim.fn.line("."), vim.fn.line("w0"), vim.fn.line("w$")
      local scrolloff = vim.o.scrolloff
      local near_top = (cur == top + scrolloff)
      local near_bot = (cur == bot - scrolloff)

      if near_top or near_bot then
        if Snacks.scroll.enabled then
          Snacks.scroll.disable()
          vim.api.nvim_create_autocmd("CursorMoved", {
            group = scroll_group,
            callback = Snacks.scroll.enable,
            once = true,
          })
        end
      else
        if not Snacks.scroll.enabled then
          Snacks.scroll.enable()
        end
      end

      if vim.v.count == 0 then
        return direction == "up" and "gk" or "gj"
      else
        return direction == "up" and "k" or "j"
      end
    end

    for _, mode in ipairs({ "n", "o", "x" }) do
      for _, key in ipairs({ { "k", "up" }, { "j", "down" } }) do
        vim.keymap.set(mode, key[1], function()
          return smart_scroll(key[2])
        end, { expr = true, silent = true })
      end
    end
  '';
}
