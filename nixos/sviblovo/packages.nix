{pkgs, ...}: {
  environment.systemPackages =
    (with pkgs; [
      neovim
      git
      just
      alejandra
    ])
    ++ (with {
      amneziawg-tools = pkgs.callPackage ../../modules/amnezia/amneziawg-tools {
        amneziawg-go = pkgs.callPackage ../../modules/amnezia/amneziawg-go {};
      };
    }; [amneziawg-tools]);

  programs = {
    adb.enable = true;

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    steam = {
      enable = true;

      extest.enable = true;
      gamescopeSession.enable = true;

      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    zsh.enable = true;
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "Iosevka"
        "FiraCode"
        "JetBrainsMono"
        "DroidSansMono"
        "UbuntuMono"
        "SpaceMono"
      ];
    })
    google-fonts
  ];
}
