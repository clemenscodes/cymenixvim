{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./angular {inherit inputs pkgs lib;})
    (import ./bash {inherit inputs pkgs lib;})
    (import ./html {inherit inputs pkgs lib;})
    (import ./css {inherit inputs pkgs lib;})
    (import ./emmet {inherit inputs pkgs lib;})
    (import ./json {inherit inputs pkgs lib;})
    (import ./eslint {inherit inputs pkgs lib;})
    (import ./markdown {inherit inputs pkgs lib;})
    (import ./tailwind {inherit inputs pkgs lib;})
    (import ./typescript {inherit inputs pkgs lib;})
    (import ./docker {inherit inputs pkgs lib;})
    (import ./yaml {inherit inputs pkgs lib;})
    (import ./nix {inherit inputs pkgs lib;})
    (import ./nx {inherit inputs pkgs lib;})
    (import ./lua {inherit inputs pkgs lib;})
    (import ./python {inherit inputs pkgs lib;})
  ];
}
