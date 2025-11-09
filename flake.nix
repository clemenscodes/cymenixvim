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
      config = {
        allowBroken = true;
      };
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
    default = mkNvim profiles.default;
    minimal = mkNvim profiles.minimal;
    cardano = mkNvim profiles.cardano;
  in {
    packages = {
      ${system} = {
        inherit default minimal cardano;
        inherit (pkgs) telescope-manix modes-nvim;
        inherit (pkgs.luajitPackages) neotest;
      };
    };
    formatter = {
      ${system} = pkgs.alejandra;
    };
  };
}
