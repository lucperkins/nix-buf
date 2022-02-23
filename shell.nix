let
  pkgs = (import ./default.nix).pkgs;
  shared = import ./nix/shared.nix { inherit pkgs; };
  shell = pkgs.mkShell {
    buildInputs = shared.buildInputs;
    shellHook = shared.shellHook;
  };
in shell
