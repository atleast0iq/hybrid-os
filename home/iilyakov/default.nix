{ config, pkgs, lib, inputs, ... }: {
  home.username = "iilyakov";
  home.homeDirectory = "/home/iilyakov";

  imports = [
    ./programs
  ];

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
