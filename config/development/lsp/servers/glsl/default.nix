{...}: {
  plugins = {
    lsp = {
      servers = {
        glslls= {
          enable = true;
        };
        glsl_analyzer = {
          enable = true;
        };
      };
    };
  };
}
