{
  description = "A standalone nixvim configuration";

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
    nixpkgs,
    nixvim,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [inputs.neovim-nightly-overlay.overlays.default];
    };
    inherit (pkgs) lib;
    nixvim' = nixvim.legacyPackages.${system};
    nvim = nixvim'.makeNixvim (import ./config {inherit inputs pkgs lib;});
  in {
    packages = {
      ${system} = {
        default = nvim;
      };
    };
    formatter = pkgs.alejandra;
  };
}
