let
  nixpkgsRev = "6e9efe5d6702cbe24cec6575d46b0660c9dc61ca"; # Matches flake.nix
  pkgs = import (fetchTarball "https://github.com/nixos/nixpkgs/archive/${nixpkgsRev}.tar.gz") {};
in pkgs
