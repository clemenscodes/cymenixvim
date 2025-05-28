{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.nvim-spectre];
  extraConfigLuaPost = ''
    require('spectre').setup({
      color_devicons = true,
      open_cmd = 'vnew', -- can also be a lua function
      live_update = false, -- auto execute search again when you write to any file in vim
      lnum_for_results = true, -- show line number for search/replace results
      line_sep_start = '┌-----------------------------------------',
      result_padding = '¦  ',
      line_sep       = '└-----------------------------------------',
      highlight = {
          ui = "String",
          search = "DiffChange",
          replace = "DiffDelete"
      },
      mapping={
        ['tab'] = {
            map = '<Tab>',
            cmd = "<cmd>lua require('spectre').tab()<cr>",
            desc = 'next query'
        },
        ['shift-tab'] = {
            map = '<S-Tab>',
            cmd = "<cmd>lua require('spectre').tab_shift()<cr>",
            desc = 'previous query'
        },
        ['toggle_line'] = {
            map = "dd",
            cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
            desc = "toggle item"
        },
        ['enter_file'] = {
            map = "<leader>s<cr>",
            cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
            desc = "open file"
        },
        ['send_to_qf'] = {
            map = "<leader>sq",
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = "send all items to quickfix"
        },
        ['replace_cmd'] = {
            map = "<leader>sc",
            cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
            desc = "input replace command"
        },
        ['show_option_menu'] = {
            map = "<leader>so",
            cmd = "<cmd>lua require('spectre').show_options()<CR>",
            desc = "show options"
        },
        ['run_current_replace'] = {
          map = "<leader>sr",
          cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
          desc = "replace current line"
        },
        ['run_replace'] = {
            map = "<leader>sa",
            cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
            desc = "replace all"
        },
        ['change_view_mode'] = {
            map = "<leader>sv",
            cmd = "<cmd>lua require('spectre').change_view()<CR>",
            desc = "change result view mode"
        },
        ['change_replace_sed'] = {
          map = "<leader>strs",
          cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
          desc = "use sed to replace"
        },
        ['change_replace_oxi'] = {
          map = "<leader>stro",
          cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
          desc = "use oxi to replace"
        },
        ['toggle_live_update']={
          map = "<leader>stu",
          cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
          desc = "update when vim writes to file"
        },
        ['toggle_ignore_case'] = {
          map = "<leader>sti",
          cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
          desc = "toggle ignore case"
        },
        ['toggle_ignore_hidden'] = {
          map = "<leader>sth",
          cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
          desc = "toggle search hidden"
        },
        ['resume_last_search'] = {
          map = "<leader>sl",
          cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
          desc = "repeat last search"
        },
        ['select_template'] = {
            map = '<leader>sp',
            cmd = "<cmd>lua require('spectre.actions').select_template()<CR>",
            desc = 'pick template',
        },
        ['delete_line'] = {
            map = '<leader>sd',
            cmd = "<cmd>lua require('spectre.actions').run_delete_line()<CR>",
            desc = 'delete line',
        }
        -- you can put your mapping here it only use normal mode
      },
      find_engine = {
        -- rg is map with finder_cmd
        ['rg'] = {
          cmd = "rg",
          -- default args
          args = {
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
          },
          options = {
            ['ignore-case'] = {
              value= "--ignore-case",
              icon="[I]",
              desc="ignore case"
            },
            ['hidden'] = {
              value="--hidden",
              desc="hidden file",
              icon="[H]"
            },
            -- you can put any rg search option you want here it can toggle with
            -- show_option function
          }
        },
        ['ag'] = {
          cmd = "ag",
          args = {
            '--vimgrep',
            '-s'
          } ,
          options = {
            ['ignore-case'] = {
              value= "-i",
              icon="[I]",
              desc="ignore case"
            },
            ['hidden'] = {
              value="--hidden",
              desc="hidden file",
              icon="[H]"
            },
          },
        },
      },
      replace_engine={
          ['sed']={
              cmd = "sed",
              args = nil,
              options = {
                ['ignore-case'] = {
                  value= "--ignore-case",
                  icon="[I]",
                  desc="ignore case"
                },
              }
          },
          -- call rust code by nvim-oxi to replace
          ['oxi'] = {
            cmd = 'oxi',
            args = {},
            options = {
              ['ignore-case'] = {
                value = "i",
                icon = "[I]",
                desc = "ignore case"
              },
            }
          },
          ['sd'] = {
            cmd = "sd",
            options = { },
          },
      },
      default = {
          find = {
              --pick one of item in find_engine
              cmd = "rg",
              options = {"ignore-case"}
          },
          replace={
              --pick one of item in replace_engine
              cmd = "sed"
          }
      },
      replace_vim_cmd = "cdo",
      use_trouble_qf = false, -- use trouble.nvim as quickfix list
      is_open_target_win = true, --open file on opener window
      is_insert_mode = false,  -- start open panel on is_insert_mode
      is_block_ui_break = false, -- mapping backspace and enter key to avoid ui break
      open_template = {
        -- an template to use on open function
        -- see the 'custom function' section below to learn how to configure the template
        -- { search_text = 'text1', replace_text = "", path = "" }
      }
    })
  '';
  plugins = {
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>s";
            group = "+Search and replace";
          }
        ];
      };
    };
  };
}
