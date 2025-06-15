{...}: {
  filetype = {
    extension = {
      ignore = "gitignore";
      rasi = "scss";
      prototools = "toml";
    };
    pattern = {
      ".*/hypr/.*%.conf" = "hyprlang";
      "flake.lock" = "json";
    };
  };
}
