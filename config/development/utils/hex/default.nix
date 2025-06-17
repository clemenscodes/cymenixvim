{pkgs, ...}: {
  plugins = {
    hex = {
      enable = true;
      settings = {
        assemble_cmd = "${pkgs.unixtools.xxd}/bin/xxd -r";
        dump_cmd = "${pkgs.unixtools.xxd}/bin/xxd -g 1 -u";
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>X";
            group = "+Hex";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action = ":HexDump<CR>";
      key = "<leader>Xd";
      mode = "n";
      options = {
        silent = true;
        desc = "Hex dump";
      };
    }
    {
      action = ":HexAssemble<CR>";
      key = "<leader>Xa";
      mode = "n";
      options = {
        silent = true;
        desc = "Hex assemble";
      };
    }
    {
      action = ":HexToggle<CR>";
      key = "<leader>Xt";
      mode = "n";
      options = {
        silent = true;
        desc = "Hex toggle";
      };
    }
  ];
}
