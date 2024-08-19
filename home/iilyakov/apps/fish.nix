{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  ...
}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = "
      set -u fish_greeting
    ";
  };
}
