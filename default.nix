{
  lib,
  pkgs,
  stdenvNoCC,
  ...
}:

stdenvNoCC.mkDerivation {
  pname = "rbw-run";
  version = "0.0.1";

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  src = [ ./. ];

  installPhase = ''
    install -Dm 755 $src/rbw-run.nu $out/bin/rbw-run
  '';

  fixupPhase = ''
    substituteInPlace $out/bin/rbw-run \
      --replace-fail '/usr/bin/env nu' '${pkgs.nushell}/bin/nu'
  '';

  meta = {
    description = "run rbw in parallel and run a program with secrets";
    homepage = "https://github.com/sedlund/run-rbw";
    license = lib.licenses.unlicense;
    mainProgram = "rbw-run";
    maintainers = with lib.maintainers; [ sedlund ];
  };
}
