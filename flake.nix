{
  description = "An example of using Buf with Nix";

  inputs = {
    nixpkgs = {
      url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";
    };

    flake-utils = {
      url = "https://flakehub.com/f/numtide/flake-utils/0.1.87.tar.gz";
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
