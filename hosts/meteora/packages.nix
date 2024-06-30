{ config, pkgs, lib, inputs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # tools to build my config
    neovim
    git
    just
  ];

  # Hyprland
  programs.hyprland.enable = true;
}
