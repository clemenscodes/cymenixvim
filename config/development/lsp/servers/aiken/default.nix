{pkgs, ...}: let
  aiken-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "aiken-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "aiken-lang";
      repo = "editor-integration-nvim";
      rev = "bcad7adea6b99f00e63c405f558c6d16a7f6ecb7";
      hash = "sha256-GFJmpE5J8DNjvmoGdDpy9JWhd2g+oKoEKVphbvuBAFQ=";
    };
  };
in {
  extraPackages = [pkgs.aiken];
  extraPlugins = [aiken-nvim];
  plugins = {
    lsp = {
      postConfig =
        /*
        lua
        */
        ''
          require('lspconfig')["aiken"].setup({
            cmd = { "aiken", "lsp" },
            file_types = { "aiken" },
          })
        '';
    };
  };
}
