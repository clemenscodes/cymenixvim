{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./buffers {inherit inputs pkgs lib;})
    (import ./diagnostics {inherit inputs pkgs lib;})
    (import ./ergonomics {inherit inputs pkgs lib;})
    (import ./navigation {inherit inputs pkgs lib;})
    (import ./organization {inherit inputs pkgs lib;})
    (import ./search {inherit inputs pkgs lib;})
    (import ./sessions {inherit inputs pkgs lib;})
    (import ./shortcuts {inherit inputs pkgs lib;})
    (import ./snacks {inherit inputs pkgs lib;})
    (import ./terminal {inherit inputs pkgs lib;})
  ];
}
