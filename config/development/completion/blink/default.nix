{
  lib,
  pkgs,
  ...
}: {
  extraPackages = with pkgs; [
    gh
    wordnet
    glab
  ];

  extraPlugins = with pkgs.vimPlugins; [
    blink-cmp-avante
    blink-cmp-conventional-commits
    blink-cmp-npm-nvim
    blink-nerdfont-nvim
  ];

  plugins = lib.mkMerge [
    {
      mini = {
        enable = true;
        mockDevIcons = true;

        modules = {
          ai = {};
          align = {};
          basics = {};
          bracketed = {};
          icons = {};
          snippets = {
            snippets = {
              __unkeyed-1.__raw =
                # Lua
                "require('mini.snippets').gen_loader.from_file('${pkgs.vimPlugins.friendly-snippets}/snippets/global.json')";
              __unkeyed-2.__raw = "require('mini.snippets').gen_loader.from_lang()";
            };
          };
        };
      };
    }
    {
      blink-cmp = {
        enable = true;

        lazyLoad.settings.event = [
          "InsertEnter"
          "CmdlineEnter"
        ];

        settings = {
          cmdline = {
            completion = {
              list.selection = {
                preselect = false;
              };
              menu.auto_show = true;
            };
            keymap = {
              preset = "enter";
              "<CR>" = [
                "accept_and_enter"
                "fallback"
              ];
            };
          };
          completion = {
            ghost_text.enabled = true;
            documentation = {
              auto_show = true;
              window.border = "rounded";
            };
            list.selection = {
              auto_insert = false;
              preselect = false;
            };
            menu = {
              border = "rounded";
              draw = {
                columns = [
                  {
                    __unkeyed-1 = "label";
                  }
                  {
                    __unkeyed-1 = "kind_icon";
                    __unkeyed-2 = "kind";
                    gap = 1;
                  }
                  {__unkeyed-1 = "source_name";}
                ];
                components = {
                  kind_icon = {
                    ellipsis = false;
                    text.__raw =
                      # Lua
                      ''
                        function(ctx)
                          local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                          -- Check for both nil and the default fallback icon
                          if not kind_icon or kind_icon == '󰞋' then
                            -- Use our configured kind_icons
                            return require('blink.cmp.config').appearance.kind_icons[ctx.kind] or ""
                          end
                          return kind_icon
                        end,
                        -- Optionally, you may also use the highlights from mini.icons
                        highlight = function(ctx)
                          local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                          return hl
                        end
                      '';
                  };
                };
              };
            };
          };
          fuzzy = {
            implementation = "rust";
            prebuilt_binaries = {
              download = false;
            };
          };
          appearance = {
            use_nvim_cmp_as_default = true;
            kind_icons = {
              Copilot = "";
            };
          };
          keymap = {
            preset = "enter";
            # NOTE: If you prefer Tab/S-Tab selection
            # But, find myself accidentally interrupting tabbing for movement
            "<A-Tab>" = [
              "snippet_forward"
              "fallback"
            ];
            "<A-S-Tab>" = [
              "snippet_backward"
              "fallback"
            ];
            "<Tab>" = [
              "select_next"
              "fallback"
            ];
            "<S-Tab>" = [
              "select_prev"
              "fallback"
            ];
          };
          signature = {
            enabled = true;
            window.border = "rounded";
          };
          snippets.preset = "mini_snippets";
          sources = {
            default.__raw = ''
              function(ctx)
                -- Base sources that are always available
                local base_sources = { 'buffer', 'lsp', 'path', 'snippets' }

                -- Build common sources list dynamically based on enabled plugins
                local common_sources = vim.deepcopy(base_sources)

                -- Add optional sources based on plugin availability
                table.insert(common_sources, 'emoji')
                table.insert(common_sources, 'nerdfont')
                table.insert(common_sources, 'ripgrep')
                if vim.fn.expand('%:t') == 'package.json' then table.insert(common_sources, 'npm') end

                -- Special context handling
                local success, node = pcall(vim.treesitter.get_node)
                if success and node and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
                  return { 'buffer', 'spell', 'dictionary' }
                elseif vim.bo.filetype == 'gitcommit' then
                  local git_sources = { 'buffer', 'spell', 'dictionary' }
                  table.insert(git_sources, 'git')
                  table.insert(git_sources, 'conventional_commits')
                  return git_sources
                else
                  return common_sources
                end
              end
            '';
            providers = {
              # BUILT-IN SOURCES
              lsp.score_offset = 4;
              # Community sources
              conventional_commits = {
                name = "Conventional Commits";
                module = "blink-cmp-conventional-commits";
                enabled.__raw = ''
                  function()
                    return vim.bo.filetype == 'gitcommit'
                  end
                '';
              };
              emoji = {
                name = "Emoji";
                module = "blink-emoji";
                score_offset = 1;
              };
              git = {
                name = "Git";
                module = "blink-cmp-git";
                enabled = true;
                score_offset = 100;
                should_show_items.__raw = ''
                  function()
                    return vim.o.filetype == 'gitcommit' or vim.o.filetype == 'markdown'
                  end
                '';
                opts = {
                  git_centers = {
                    github = {
                      issue = {
                        on_error.__raw = "function(_,_) return true end";
                      };
                    };
                  };
                };
              };
              ripgrep = {
                name = "Ripgrep";
                module = "blink-ripgrep";
                async = true;
                score_offset = 1;
              };
              nerdfont = {
                module = "blink-nerdfont";
                name = "Nerd Fonts";
                score_offset = 15;
                opts = {
                  insert = true;
                };
              };
              npm = {
                name = "npm";
                module = "blink-cmp-npm";
                async = true;
                enabled.__raw = ''
                  function()
                    return vim.fn.expand('%:t') == 'package.json'
                  end
                '';
                opts = {
                  ignore = {};
                  only_semantic_versions = true;
                  only_latest_version = false;
                };
              };
            };
          };
        };
      };

      blink-cmp-git.enable = true;
      blink-emoji.enable = true;
      blink-ripgrep.enable = true;
    }
  ];
}
