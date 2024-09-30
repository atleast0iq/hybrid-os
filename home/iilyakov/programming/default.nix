{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [];

  home.packages = with pkgs; [
    gcc
    gdb
    clang-tools

    python3

    bun
    nodePackages_latest.nodejs

    nixd

    zed-editor
  ];
}
