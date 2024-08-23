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

      bun
      nodePackages_latest.nodejs
    ])
    ++ (
      let
        zed-fhs = pkgs.buildFHSUserEnv {
          name = "zed";
          targetPkgs = pkgs:
            with pkgs-unstable; [
              zed-editor
            ];
          runScript = "zed";
        };
      in [
        zed-fhs
      ]
    );
}
