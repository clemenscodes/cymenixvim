{pkgs, ...}: {
  extraPackages = [pkgs.python313Packages.pylatexenc];
  plugins = {
    render-markdown = {
      enable = true;
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>tm";
      action = "<cmd>RenderMarkdown toggle<CR>";
      options = {
        desc = "Toggle Markdown Preview";
      };
    }
  ];
}
