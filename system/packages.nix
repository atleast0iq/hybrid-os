{
  pkgs,
  pkgs-stable,
  ...
}: {
  environment.systemPackages =
    (with pkgs-stable; [
      alejandra
      git
      just
      neovim
    ])
    ++ (with pkgs; [
      amneziawg-go
      amneziawg-tools
    ]);

  programs = {
    adb.enable = true;
    amnezia-vpn.enable = true;

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    zsh.enable = true;
  };

  fonts.packages = with pkgs-stable; [
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
