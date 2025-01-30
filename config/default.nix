{pkgs, ...}: {
  # imports = [
  #   inputs.nixvim.homeManagerModules.nixvim
  #   ./core
  #   ./development
  #   ./ui
  #   ./ux
  #   ./vcs
  # ];
  package = pkgs.neovim;
  enableMan = true;
  vimAlias = false;
  viAlias = false;
  colorscheme = "catppuccin";
}
