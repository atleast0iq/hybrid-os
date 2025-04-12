{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
    git
    just
    neovim
  ];

  programs = {
    adb.enable = true;
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
