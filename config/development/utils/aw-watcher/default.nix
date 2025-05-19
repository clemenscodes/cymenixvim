{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "aw-watcher";
      src = pkgs.fetchFromGitHub {
        owner = "lowitea";
        repo = "aw-watcher.nvim";
        rev = "be7b03748f59b6602502baf08e7f7736cc7279a5";
        hash = "sha256-YGxlOzigqbpa3pwNDaBJYb7f1NDT8t0O4oB8xgbj+4E=";
      };
    })
  ];
  extraConfigLuaPre = ''
    require("aw_watcher").setup({})
  '';
}
