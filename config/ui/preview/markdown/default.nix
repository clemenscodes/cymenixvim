{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./render-markdown {inherit inputs pkgs lib;})
  ];
}
