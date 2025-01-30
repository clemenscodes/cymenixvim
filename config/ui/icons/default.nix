{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./mini-icons {inherit inputs pkgs lib;})
  ];
  plugins = {
    web-devicons = {
      enable = true;
    };
  };
}
