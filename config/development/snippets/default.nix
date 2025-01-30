{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./friendly-snippets {inherit inputs pkgs lib;})
    (import ./luasnip {inherit inputs pkgs lib;})
  ];
}
