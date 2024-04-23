{ config, pkgs, lib, inputs, ... }: {
  home.username = "iilyakov";
  home.homeDirectory = "/home/iilyakov";

  imports = [
    ./programs
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
