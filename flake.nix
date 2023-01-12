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
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        {
          apps.default = {
            type = "app";
            program = "${pkgs.buf}/bin/buf";
          };

          devShells.default = pkgs.mkShell {
            packages = with pkgs; [ buf ];
          };
        }
      );
}
