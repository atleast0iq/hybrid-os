{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  home = {
    stateVersion = "24.05";

    username = "iilyakov";
    homeDirectory = "/home/iilyakov";
    sessionPath = ["$HOME/.local/bin"];
  };

  programs.home-manager.enable = true;

  imports = [
    ./stylix.nix
    ./services.nix
    ./apps
    ./fonts.nix
    ./shell
    ./tools
    ./wm
  ];
}
