{ pkgs, ... }:
{
  imports = [
    ./vscode.nix
    ./zed-editor.nix
  ];

  home.packages = [
    pkgs.jetbrains.pycharm-community
    pkgs.jetbrains.clion
  ];
}
