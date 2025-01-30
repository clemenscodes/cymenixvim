{
  description = "A sane standalone nixvim configuration";

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
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [inputs.neovim-nightly-overlay.overlays.default];
    };
    inherit (pkgs) lib;
    cymenixvim = inputs.nixvim.legacyPackages.${system}.makeNixvim (import ./config {inherit inputs pkgs lib;});
  in {
    packages = {
      ${system} = {
        inherit cymenixvim;
        default = self.packages.${system}.cymenixvim;
      };
    };
    formatter = pkgs.alejandra;
  };
}
