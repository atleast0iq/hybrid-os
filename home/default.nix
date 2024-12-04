{...}: {
  imports = [
    ./languages
    ./software
    ./wm
    ./services.nix
    ./theme.nix
    ./xdg.nix
  ];

  home = {
    stateVersion = "24.05";

    username = "iilyakov";
    homeDirectory = "/home/iilyakov";
    sessionPath = ["$HOME/.local/bin"];
  };

  programs.home-manager.enable = true;
}
