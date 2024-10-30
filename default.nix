{
  lib,
  stdenv,
  ...
}:

stdenv.mkDerivation {
  pname = "rbw-run";
  version = "0.0.1";

  src = [ ./. ];
  installPhase = ''
    install -D $src/rbw-run.nu $out/bin/rbw-run
  '';

  meta.lib = {
    homepage = "https://github.com/run-rbw/run-rbw";
    description = "run rbw in parallel and run program with secrets";
    # changelog = "https://github.com/run-rbw/run-rbw/releases/tag/${version}";
    license = lib.licenses.unlicense;
    maintainers = with lib.maintainers; [ sedlund ];
    mainProgram = "rbw-run";
  };
}
