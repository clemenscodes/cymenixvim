{...}: {
  plugins = {
    avante = {
      enable = true;
      settings = {
        provider = "openai";
        auto_suggestions_provider = "openai";
        windows = {
          sidebar_header = {
            align = "center";
            rounded = true;
          };
          width = 30;
          wrap = true;
        };
        diff = {
          autojump = true;
          debug = false;
          list_opener = "copen";
        };
        highlights = {
          diff = {
            current = "DiffText";
            incoming = "DiffAdd";
          };
        };
        hints = {
          enabled = true;
        };
        mappings = {
          diff = {
            both = "cb";
            next = "]x";
            none = "c0";
            ours = "co";
            prev = "[x";
            theirs = "ct";
          };
          jump = {
            next = "]]";
            prev = "[[";
          };
        };
      };
    };
  };
}
