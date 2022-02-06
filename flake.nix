{
  description = "An example of using Buf with Nix";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/7f7af7c7796f9d2f523686293de3cf2f149d9aa2"; # Matches
    };

    flake-utils = {
      url = "github:numtide/flake-utils/846b2ae0fc4cc943637d3d1def4454213e203cba";
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
