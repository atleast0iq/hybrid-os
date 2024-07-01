{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # tools to build my config
    neovim
    git
    just
    alejandra
  ];

  # Hyprland
  programs.hyprland.enable = true;
}
