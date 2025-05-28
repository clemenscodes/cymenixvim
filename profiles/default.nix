{
  inputs,
  pkgs,
  lib,
  ...
}: {
  default = {...}: {
    imports = [
      (import ../config {inherit inputs pkgs lib;})
    ];
  };
  minimal = {...}: {
    imports = [
      (import ../config/core {inherit inputs pkgs lib;})
      (import ../config/development {inherit inputs pkgs lib;})
      (import ../config/ui/theme {inherit inputs pkgs lib;})
      (import ../config/ui/icons {inherit inputs pkgs lib;})
      (import ../config/ui/explorer {inherit inputs pkgs lib;})
      (import ../config/ui/noice {inherit inputs pkgs lib;})
      (import ../config/ui/status {inherit inputs pkgs lib;})
      (import ../config/ui/syntax/rainbow-delimiters {inherit inputs pkgs lib;})
      (import ../config/ui/tabs {inherit inputs pkgs lib;})
      (import ../config/ux/buffers {inherit inputs pkgs lib;})
      (import ../config/ux/search/telescope {inherit inputs pkgs lib;})
      (import ../config/ux/shortcuts/which-key {inherit inputs pkgs lib;})
      (import ../config/ux/snacks {inherit inputs pkgs lib;})
      (import ../config/ux/terminal {inherit inputs pkgs lib;})
      (import ../config/ux/organization {inherit inputs pkgs lib;})
      (import ../config/ux/ergonomics/project-nvim {inherit inputs pkgs lib;})
      (import ../config/ux/ergonomics/auto-save {inherit inputs pkgs lib;})
      (import ../config/ux/ergonomics/nvim-autopairs {inherit inputs pkgs lib;})
      (import ../config/ux/ergonomics/surround {inherit inputs pkgs lib;})
      (import ../config/ux/sessions/auto-session {inherit inputs pkgs lib;})
    ];
    package = pkgs.neovim;
    colorscheme = "catppuccin";
  };
  development = {...}: {
    imports = [
      (import ../config {inherit inputs pkgs lib;})
      (import ../config/development/languages {inherit inputs pkgs lib;})
      (import ../config/development/testing {inherit inputs pkgs lib;})
      (import ../config/development/debugging {inherit inputs pkgs lib;})
      (import ../config/development/linting {inherit inputs pkgs lib;})
      (import ../config/development/vcs {inherit inputs pkgs lib;})
    ];
  };
  cardano = {...}: {
    imports = [
      (import ../config {inherit inputs pkgs lib;})
      (import ../config/development/languages {inherit inputs pkgs lib;})
      (import ../config/development/testing {inherit inputs pkgs lib;})
      (import ../config/development/debugging {inherit inputs pkgs lib;})
      (import ../config/development/linting {inherit inputs pkgs lib;})
      (import ../config/development/vcs {inherit inputs pkgs lib;})
      (import ../config/development/lsp/servers/aiken {inherit inputs pkgs lib;})
    ];
  };
}
