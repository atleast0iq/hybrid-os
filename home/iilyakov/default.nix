{osConfig, ...}: {
  imports =
    [
      ./software
      ./services.nix
      ./theme.nix
      ./xdg.nix
    ]
    ++ (
      if osConfig.services.xserver.desktopManager.gnome.enable
      then [
        ./wm/gnome
      ]
      else [
        ./wm/hyprland
      ]
    );

  home = {
    stateVersion = "24.05";

    username = "iilyakov";
    homeDirectory = "/home/iilyakov";
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/go/bin"
    ];
  };

  programs.home-manager.enable = true;
}
