{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    buf
  ];

  shellHook = ''
    echo "Welcome to your pure Buf workspace, $USER!"
  '';
}
