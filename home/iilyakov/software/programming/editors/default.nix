{pkgs, ...}: {
  imports = [
    ./vscode.nix
    ./zed-editor.nix
  ];

  home.packages = with pkgs; [
    # jetbrains.pycharm-community
    # jetbrains.clion
  ];
}
