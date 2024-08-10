{ config
, pkgs
, pkgs-unstable
, lib
, inputs
, ...
}: {
  imports = [];

  home.packages =
    (with pkgs; [
      gcc
      gdb
      clang-tools
      nixd
    ])
    ++ (with pkgs-unstable; [
      zed-editor
    ]);
}
