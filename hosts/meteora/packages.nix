{ config, pkgs, lib, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    # tools to build my config
    neovim
    git
    just
  ];

  # Hyprland
  programs.hyprland.enable = true;
}
