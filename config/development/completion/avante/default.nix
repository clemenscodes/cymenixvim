# This Nix configuration file sets up the Avante.nvim plugin for Neovim.
# It includes settings for the plugin's package source, provider configurations,
# window display options, diff handling, and key mappings.
{pkgs, ...}: {
  plugins = {
    avante = {
      enable = true; # Enable the avante.nvim plugin
      lazyLoad.settings.event = ["DeferredUIEnter"];
      package = pkgs.vimPlugins.avante-nvim.overrideAttrs (oldAttrs: {
        # Fetch the plugin source from GitHub
        src = pkgs.fetchFromGitHub {
          owner = "yetone";
          repo = "avante.nvim";
          rev = "87c4c6b4937d1884960759aba4a0e42645688f2f";
          hash = "sha256-yDPu3bmOFeNdcD0o+nC6Cq1hij1A8ZoT5uipj7qf7cc=";
        };
      });
      settings = {
        provider = "openai"; # Set the AI provider to OpenAI
        auto_suggestions_provider = "openai";
        openai = {
          endpoint = "https://api.openai.com/v1"; # OpenAI API endpoint
          model = "gpt-4o"; # Model to use for completions
          timeout = 30000; # Timeout for API requests in milliseconds
          temperature = 0; # Temperature setting for deterministic output
          max_completion_tokens = 8192; # Maximum tokens for completion
        };
        windows = {
          sidebar_header = {
            align = "center"; # Align sidebar header text to center
            rounded = true; # Use rounded corners for the sidebar
          };
          width = 30; # Width of the sidebar
          wrap = true; # Enable text wrapping in the sidebar
        };
        diff = {
          autojump = true; # Automatically jump to diffs
          debug = false; # Disable debug mode
          list_opener = "copen"; # Command to open the diff list
        };
        highlights = {
          diff = {
            current = "DiffText"; # Highlight for current diff
            incoming = "DiffAdd"; # Highlight for incoming diff
          };
        };
        hints = {
          enabled = true; # Enable hints
        };
        mappings = {
          diff = {
            both = "cb"; # Key mapping for both diffs
            next = "]x"; # Key mapping for next diff
            none = "c0"; # Key mapping for no diffs
            ours = "co"; # Key mapping for our diffs
            prev = "[x"; # Key mapping for previous diff
            theirs = "ct"; # Key mapping for their diffs
          };
          jump = {
            next = "]]"; # Key mapping for next jump
            prev = "[["; # Key mapping for previous jump
          };
        };
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>a"; # Leader key mapping for AI
            desc = "+AI"; # Description for the AI key mapping
          }
        ];
      };
    };
  };
}
