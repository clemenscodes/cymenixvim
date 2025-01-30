{pkgs, ...}: let
  tex = pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-full;
  };
  viewer = "zathura_simple";
in {
  globals = {
    maplocalleader = ",";
    vimtex_view_method = viewer;
    latex_view_general_viewer = viewer;
  };
  extraPackages = [tex];
  extraPlugins = [pkgs.vimPlugins.vimtex];
}
