{pkgs, ...}: {
  extraPlugins = [
    pkgs.vimPlugins.haskell-tools-nvim
  ];
  extraPackages = [
    pkgs.haskellPackages.hoogle
    pkgs.haskellPackages.haskell-debug-adapter
    pkgs.haskellPackages.ghci-dap
    pkgs.haskellPackages.fast-tags
  ];
  extraConfigLuaPost =
    /*
    lua
    */
    ''
      require('telescope').load_extension('ht')
    '';
  plugins = {
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>th";
            desc = "Toggle Cabal REPL";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action.__raw =
        /*
        lua
        */
        ''
          function()
            require('haskell-tools').repl.toggle()
          end
        '';
      key = "<leader>th";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle Cabal REPL";
      };
    }
  ];
}
