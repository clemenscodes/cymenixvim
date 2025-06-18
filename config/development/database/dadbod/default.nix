{...}: {
  plugins = {
    vim-dadbod = {
      enable = true;
    };
    vim-dadbod-completion = {
      enable = true;
    };
    vim-dadbod-ui = {
      enable = true;
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>D";
            group = "+Database";
          }
        ];
      };
    };
  };
  keymaps = [
  ];
}
