{...}: {
  plugins = {
    avante = {
      enable = true;
      settings = {
        provider = "openai";
        auto_suggestions_provider = "openai";
        openai = {
          endpoint = "https://api.openai.com/v1";
          model = "gpt-4o";
          timeout = 30000;
          temperature = 0;
          max_completion_tokens = 8192;
        };
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
