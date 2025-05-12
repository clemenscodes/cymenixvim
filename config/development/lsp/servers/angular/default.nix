{pkgs, ...}: {
  lsp = {
    servers = {
      angularls = {
        enable = true;
        package = null;
        # settings = {
        #   cmd = [
        #     "ngserver"
        #   ];
        #   filetypes = [
        #     "htmlangular"
        #   ];
        #   root_markers = [
        #     "nx.json"
        #   ];
        # };
      };
    };
  };
}
