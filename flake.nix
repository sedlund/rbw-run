{
  description = "Run rbw in parallel to fetch secrets and set them as environment variables to run a program";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      utils,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.callPackage ./default.nix { };
        devShells.default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            nixfmt-rfc-style
            nufmt
            nushell
            treefmt2
          ];
        };
        formatter = pkgs.treefmt2;
      }
    );
}
