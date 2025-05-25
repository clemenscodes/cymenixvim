{pkgs, ...}:
pkgs.buildNpmPackage rec {
  name = "nxls";
  version = "1.8.0";

  src = pkgs.fetchFromGitHub {
    owner = "clemenscodes";
    repo = name;
    rev = "c68a1a63acadf027c3dbe9f97b72931cefb3f625";
    hash = "sha256-pGFwadGbh4YXCWxTitTHzHo26aMJtfH4kz3kw1GPjBQ=";
  };

  npmDepsHash = "sha256-10Sm5jFvKOWj2dHErxL8Mr18MFF3Ax/6RxWQIk1Q6Ck=";

  dontNpmBuild = true;

  installPhase = ''
    npm install
    mkdir $out
    cp -r ./* $out
    chmod +x -R $out/bin
  '';
}
