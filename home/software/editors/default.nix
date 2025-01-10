{pkgs, ...}: {
  imports = [
    ./zed-editor.nix
  ];

  home.packages = with pkgs; [
    jetbrains.pycharm-community
  ];
}
