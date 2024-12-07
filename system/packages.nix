{
  pkgs,
  pkgs-unstable,
  ...
}: {
  imports = [
    ./steam.nix
  ];

  environment.systemPackages =
    (with pkgs; [
      alejandra
      git
      just
      neovim
    ])
    ++ (
      with pkgs-unstable; [
        amneziawg-go
        amneziawg-tools
      ]
    );

  programs = {
    adb.enable = true;

    hyprland = {
      enable = true;
      xwayland.enable = true;
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
