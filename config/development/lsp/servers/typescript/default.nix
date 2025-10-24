{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.nvim-vtsls];
  extraPackages = [pkgs.vtsls];
  extraConfigLuaPost = ''
    vim.lsp.config.vtsls.setup({
      root_dir = vim.fn.getcwd(),
      settings = {
        typescript = {
          inlayHints = {
            parameterNames = { enabled = "literals" },
            parameterTypes = { enabled = true },
            variableTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            enumMemberValues = { enabled = true },
          }
        },
      }
    })
    require('vtsls').config({
      -- customize handlers for commands
      handlers = {
        source_definition = function(err, locations) end,
        file_references = function(err, locations) end,
        code_action = function(err, actions) end,
      },
      -- automatically trigger renaming of extracted symbol
      refactor_auto_rename = true,
      refactor_move_to_file = {
        -- If dressing.nvim is installed, telescope will be used for selection prompt. Use this to customize
        -- the opts for telescope picker.
        telescope_opts = function(items, default) end,
      }
    })
    vim.lsp.commands["editor.action.showReferences"] = function(command, ctx)
      local locations = command.arguments[3]
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      if locations and #locations > 0 then
        local items = vim.lsp.util.locations_to_items(locations, client.offset_encoding)
        vim.fn.setloclist(0, {}, " ", { title = "References", items = items, context = ctx })
        vim.api.nvim_command("lopen")
      end
    end
    local path_sep = package.config:sub(1, 1)

    local function trim_sep(path)
      return path:gsub(path_sep .. "$", "")
    end

    local function uri_from_path(path)
      return vim.uri_from_fname(trim_sep(path))
    end

    local function is_sub_path(path, folder)
      path = trim_sep(path)
      folder = trim_sep(folder)
      if path == folder then
        return true
      else
        return path:sub(1, #folder + 1) == folder .. path_sep
      end
    end

    local function check_folders_contains(folders, path)
      for _, folder in pairs(folders) do
        if is_sub_path(path, folder.name) then
          return true
        end
      end
      return false
    end

    local function match_file_operation_filter(filter, name, type)
      if filter.scheme and filter.scheme ~= "file" then
        -- we do not support uri scheme other than file
        return false
      end
      local pattern = filter.pattern
      local matches = pattern.matches

      if type ~= matches then
        return false
      end

      local regex_str = vim.fn.glob2regpat(pattern.glob)
      if vim.tbl_get(pattern, "options", "ignoreCase") then
        regex_str = "\\c" .. regex_str
      end
      return vim.regex(regex_str):match_str(name) ~= nil
    end
  '';
}
