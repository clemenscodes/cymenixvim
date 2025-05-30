{pkgs, ...}: {
  extraPlugins = [pkgs.cinnamon-nvim];

  extraConfigLuaPost = ''
    local cinnamon = require("cinnamon")

    cinnamon.setup({
      keymaps = {
        basic = true,
        extra = true,
      },
      options = {
        mode = "cursor",
        delay = 16,
        step_size = {
          vertical = 1,
          horizontal = 1,
        },
        max_delta = {
          line = false,
          column = false,
          time = 400,
        },
      },
    })

    local keymaps = {
      ["<C-D>"] = "<C-d>zz",
      ["<C-U>"] = "<C-u>zz",
      ["<C-F>"] = "<C-f>zz",
      ["<C-B>"] = "<C-b>zz",
      ["zz"]    = "zz",
      ["zt"]    = "zt",
      ["zb"]    = "zb",
      ["gg"]    = "gg",
      ["G"]     = "G",
    }

    for lhs, cmd in pairs(keymaps) do
      vim.keymap.set("n", lhs, function() cinnamon.scroll(cmd) end)
    end
  '';
}
