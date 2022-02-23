{
  description = "An example of using Buf with Nix";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};

          shared = import ./shared.nix { inherit pkgs; };
        in rec {
          apps = {
            buf = {
              type = "app";
              program = "${pkgs.buf}/bin/buf";
            };
          };

          defaultApp = apps.buf;

          devShell = pkgs.mkShell {
            buildInputs = shared.buildInputs;

            shellHook = shared.shellHook;
          };
        }
      );
}
