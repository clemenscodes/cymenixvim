{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./cinnamon {inherit inputs pkgs lib;})
  ];
}
