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

  environment.systemPackages = with pkgs; [
    # tools to build my config
    neovim
    git
    just
    alejandra
  ];
}
