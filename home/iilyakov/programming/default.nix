{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  ...
}: {
  imports = [];

  home.packages =
    (with pkgs; [
      gcc
      gdb
      clang-tools

      python3
      pyright

      nixd
    ])
    ++ (with pkgs-unstable; [
      zed-editor
    ]);
}
