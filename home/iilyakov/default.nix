{ config, pkgs, lib, inputs, ... }: {
  home.username = "iilyakov";
  home.homeDirectory = "/home/iilyakov";

  home.packages = with pkgs; [];

  imports = [
    ./git.nix
  ];

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
