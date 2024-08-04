{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./steam.nix
  ];

  programs.adb.enable = true;

  environment.systemPackages = with pkgs; [
    # tools to build my config
    neovim
    git
    just
    alejandra
  ];
}
