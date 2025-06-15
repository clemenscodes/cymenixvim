{pkgs, ...}: {config, ...}: {
  plugins = {
    lsp = {
      servers = {
        ruff = {
          enable = true;
        };
      };
    };
    dap-python = {
      enable = true;
    };
  };
  extraConfigLuaPost = ''
    require("dap-python").setup("uv")
  '';
}
