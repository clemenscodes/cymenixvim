{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.mini-nvim];
  extraConfigLuaPost = ''
    require('mini.icons').setup()
  '';
}
