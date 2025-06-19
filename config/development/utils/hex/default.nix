{pkgs, ...}: {
  plugins = {
    hex = {
      enable = true;
      settings = {
        assemble_cmd = "${pkgs.unixtools.xxd}/bin/xxd -r";
        dump_cmd = "${pkgs.unixtools.xxd}/bin/xxd -g 1 -u";
      };
    };
  };
}
