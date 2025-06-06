{pkgs, ...}: {
  extraPackages = [pkgs.universal-ctags];
  globals = {
    tagbar_type_typescript = {
      ctagsbin = "${pkgs.universal-ctags}/bin/ctags";
      ctagstype = "typescript";
      kinds = [
        "c:classes"
        "n:modules"
        "f:function"
        "v:variables"
        "v:varlambdas"
        "m:members"
        "i:interfaces"
        "e:enums"
      ];
    };
    tagbar_type_rust = {
      ctagsbin = "${pkgs.universal-ctags}/bin/ctags";
      ctagstype = "rust";
      kinds = [
        "n:modules"
        "s:structures:1"
        "i:interfaces"
        "c:implementations"
        "f:functions:1"
        "g:enumerations:1"
        "t:type aliases:1:0"
        "C:constants:1:0"
        "M:macros:1"
        "m:fields:1:0"
        "e:enum variants:1:0"
        "P:methods:1"
      ];
      sro = "::";
      kind2scope = {
        n = "module";
        s = "struct";
        i = "interface";
        c = "implementation";
        f = "function";
        g = "enum";
        t = "typedef";
        v = "variable";
        M = "macro";
        m = "field";
        e = "enumerator";
        P = "method";
      };
    };
  };
  plugins = {
    tagbar = {
      enable = true;
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>tb";
            desc = "Toggle tagbar";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action = ":TagbarToggle<CR>";
      mode = "n";
      key = "<leader>tb";
      options = {
        silent = true;
        desc = "Toggle tagbar";
      };
    }
  ];
}
