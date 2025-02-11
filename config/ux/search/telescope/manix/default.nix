{pkgs, ...}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "manix";
  version = "0.8.1";

  src = pkgs.fetchFromGitHub {
    owner = "clemenscodes";
    repo = "manix";
    rev = "v${version}";
    hash = "sha256-GzolHYa4ijokgZyXATH+hevDBr/GRUZhfG8EPWHYvl8=";
  };

  cargoHash = "sha256-wYzDNj3jYKXlChSbM/XMry/bHYYaYGniSiC6c72rJyw=";

  nativeBuildInputs = [
    pkgs.autoconf
    pkgs.automake
    pkgs.libtool
  ];
}
