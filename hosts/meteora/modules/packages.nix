{ config, pkgs, lib, inputs, ... }: {
  imports = [
    #./hyprland.nix
  ];

  environment.systemPackages = with pkgs; [
    # tools to build my config
    neovim
    git
    just

    # wayland and hyprland stuff

  ];
}
