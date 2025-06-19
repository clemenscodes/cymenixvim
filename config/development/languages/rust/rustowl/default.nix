{inputs, ...}: let
  system = "x86_64-linux";
in {
  extraPackages = [inputs.rustowl.packages.${system}.rustowl];
  extraPlugins = [inputs.rustowl.packages.${system}.rustowl-nvim];
  extraConfigLuaPost = ''
    require('rustowl').setup({
      auto_attach = true, -- Auto attach the RustOwl LSP client when opening a Rust file
      auto_enable = false, -- Enable RustOwl immediately when attaching the LSP client
      idle_time = 500, -- Time in milliseconds to hover with the cursor before triggering RustOwl
      client = {}, -- LSP client configuration that gets passed to `vim.lsp.start`
      highlight_style = 'underline', -- You can also use 'underline'
    })
  '';
  keymaps = [
    {
      mode = "n";
      key = "<leader>tr";
      action = ":Rustowl toggle<CR>";
      options = {
        desc = "Toggle Rustowl";
      };
    }
  ];
}
