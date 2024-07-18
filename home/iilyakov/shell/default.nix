{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./nushell.nix
    ./starship.nix
  ];

  home.packages = with pkgs; [
    ripgrep
    fd
    eza
  ];

  programs.bat.enable = true;
}
