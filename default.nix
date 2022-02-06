let
  nixpkgsRev = "7f7af7c7796f9d2f523686293de3cf2f149d9aa2"; # Matches flake.nix
  pkgs = import (fetchTarball "https://github.com/nixos/nixpkgs/archive/${nixpkgsRev}.tar.gz") {};
in pkgs
