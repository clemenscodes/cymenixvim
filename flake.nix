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
    nx-nvim = {
      url = "github:clemenscodes/nx.nvim";
    };
    rustowl = {
      url = "github:nix-community/rustowl-flake";
    };
    modes-nvim = {
      url = "github:mvllow/modes.nvim/v0.3.0";
      flake = false;
    };
    cinnamon-nvim = {
      url = "github:declancm/cinnamon.nvim/v1.2.5";
      flake = false;
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
          modes-nvim = pkgs.vimUtils.buildVimPlugin {
            pname = "modes.nvim";
            version = "0.3.0";
            src = inputs.modes-nvim;
            doCheck = false;
          };
          cinnamon-nvim = pkgs.vimUtils.buildVimPlugin {
            pname = "cinnamon.nvim";
            version = "1.2.5";
            src = inputs.cinnamon-nvim;
            doCheck = false;
          };
        })
      ];
    };
    inherit (pkgs) lib;
    mkNvim = inputs.nixvim.legacyPackages.${system}.makeNixvim;
    profiles = import ./profiles {inherit inputs pkgs lib;};
    cymenixvim = mkNvim profiles.default;
    development = mkNvim profiles.development;
    cardano = mkNvim profiles.cardano;
    minimal = mkNvim profiles.minimal;
  in {
    packages = {
      ${system} = {
        inherit cymenixvim development cardano minimal;
        inherit (pkgs) telescope-manix modes-nvim;
        default = self.packages.${system}.minimal;
      };
    };
    formatter = {
      ${system} = pkgs.alejandra;
    };
  };
}
