{ pkgs }:

{
  buildInputs = with pkgs; [ buf ];

  shellHook = ''
    echo "Now entering the pure Buf workspace..."
  '';
}
