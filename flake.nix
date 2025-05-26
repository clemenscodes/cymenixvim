{
  description = "A nice standalone nixvim confiuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };
    telescope-manix = {
      url = "github:mrcjkb/telescope-manix";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        inputs.neovim-nightly-overlay.overlays.default
        (final: prev: {
          telescope-manix = inputs.telescope-manix.packages.${system}.telescope-manix.overrideAttrs (oldAttrs: {
            doCheck = false;
          });
        })
      ];
    };
    inherit (pkgs) lib;
    mkNvim = inputs.nixvim.legacyPackages.${system}.makeNixvim;
    profiles = import ./profiles {inherit inputs pkgs lib;};
    cymenixvim = mkNvim profiles.default;
    development = mkNvim profiles.development;
    cardano = mkNvim profiles.cardano;
  in {
    packages = {
      ${system} = {
        inherit cymenixvim development cardano;
        inherit (pkgs) telescope-manix;
        default = self.packages.${system}.cymenixvim;
      };
    };
    formatter = {
      ${system} = pkgs.alejandra;
    };
  };
}
